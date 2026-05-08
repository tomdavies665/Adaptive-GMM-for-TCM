module GaussianMixtureModel #(
    parameter MAX_SAMPLES = 64,         // Depth of the feature memory
    parameter THRESHOLD = 64'd100
)(
    input  logic        clk,         // Clock input
    input  logic        rst_n,       // Active-low reset
    
    output logic        gmm_trained, // High when covariance inversion finishes
    output logic [1:0] wear_leds,    // 2-bit LED array for percentage wear (50, 100%)

    // =========================================================
    // --- 4 Spare IO Pins for Logic Analyser (Latency Tracking)
    // =========================================================
    output logic        debug_fft_sop,     // T=Start: FFT begins its frame output
    output logic        debug_feat_vld,    // ENVELOPE: High during processing phase
    output logic        debug_gmm_vld,     // T=End: GMM inference complete pulse
    output logic        debug_gmm_trained  // Context: High = Inference Phase, Low = Training Phase
);

    // --- Internal Wires ---
    logic [13:0]        afe_sample_data;
    logic               afe_sample_valid;
    logic               gmm_trained_int; // Internal active-high trained status
    
    logic               train_mode;
    logic               infer_mode;
    
    // Drive the physical LED (Active-Low Hardware)
    assign gmm_trained = ~gmm_trained_int; 
    
    // Pre-FFT / DC Offset
    logic signed [14:0] pre_fft_data;
    logic signed [14:0] time_mean_w;
    logic               fft_valid_im; 
    logic               dc_eop;      // End of packet for time domain
    
    // FFT Outputs
    logic               fft_valid;
    logic [25:0]        fft_real; 
    logic [25:0]        fft_imag;
    logic               fft_sop;
    logic               fft_eop;

    // Magnitude Outputs
    logic               mag_valid;
    logic [26:0]        mag_data; 
    
    // Features
    logic               fund_mag_vld;
    logic [17:0]        freq_fund_mag;   
    logic               hf_mean_vld;
    logic [17:0]        freq_hf_mean;

    // =========================================================================
    // --- Mode Control Logic (Auto Train-to-Infer) ---
    // =========================================================================
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            train_mode <= 1'b1; // Start in training mode on reset
            infer_mode <= 1'b0;
        end else if (gmm_trained_int) begin // Use the active-high internal signal
            train_mode <= 1'b0; // Switch to inference once trained
            infer_mode <= 1'b1;
        end
    end

    // --- Instantiate the Analogue Front End ---
    // Tied start_acq to 1'b1 so the ADC continuously feeds the FFT 1024-point frame
    analogue_front_end afe_inst (
        .clk50      (clk),
        .rst_n      (rst_n),
        .start_acq  (1'b1), 
        .sample_out (afe_sample_data),
        .sample_vld (afe_sample_valid)
    );
    
    // --- Instantiate the DC Offset ---
    dc_offset dcOffset_inst(        
        .clk50      (clk),
        .rst_n      (rst_n),
        .valid_in   (afe_sample_valid),
        .data_in    (afe_sample_data),
        .dout       (pre_fft_data),
        .time_mean  (time_mean_w),
        .valid_out  (fft_valid_im),
        .sop        (),
        .eop        (dc_eop) // Capture EOP to know when time_mean is ready
    );

    // --- Instantiate the FFT Wrapper ---
    fft_wrapper fft_inst (
        .clk50           (clk),
        .rst_n           (rst_n),
        .valid_in        (fft_valid_im),
        .data_in         (pre_fft_data),  
        .fft_valid_out   (fft_valid),    
        .fft_real_out    (fft_real),     
        .fft_imag_out    (fft_imag),     
        .fft_sop_out     (fft_sop),      
        .fft_eop_out     (fft_eop)       
    );
    
    // --- Instantiate the Magnitude CORDIC ---
    fft_mag #(
        .DIN_WIDTH(26),
        .CORDIC_LATENCY(6),
        .DOUT_WIDTH(27)
    ) fft_mag_inst(
        .clk50         (clk),
        .rst_n         (rst_n),
        .fft_valid_in  (fft_valid),
        .fft_real_in   (fft_real),
        .fft_imag_in   (fft_imag),
        .fft_valid_out (mag_valid),
        .fft_mag_out   (mag_data)
    );
    
    // --- Instantiate the Frequency Features ---
    freq_Feat_Ex freq_feat_inst(        
        .clk50         (clk),
        .rst_n         (rst_n),
        .fft_vld_in    (mag_valid),
        .fft_mag_in    (mag_data),
        .fund_mag_vld  (fund_mag_vld),
        .fund_mag      (freq_fund_mag),
        .hf_mean_vld   (hf_mean_vld),
        .hf_mean       (freq_hf_mean) 
    );
    
    // =========================================================================
    // --- Feature Aggregation and Padding ---
    // =========================================================================
    
    logic signed [14:0] hold_time_mean;
    logic signed [17:0] padded_time_mean;
    logic [53:0]        current_feature_vector;
    logic               feat_write_en;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hold_time_mean <= '0;
        end else if (dc_eop) begin
            hold_time_mean <= time_mean_w;
        end
    end

    // Pad the 15-bit time mean to 18 bits via Sign Extension
    assign padded_time_mean = { {3{hold_time_mean[14]}}, hold_time_mean };

    assign current_feature_vector = {padded_time_mean, freq_fund_mag, freq_hf_mean};
    assign feat_write_en = fund_mag_vld && hf_mean_vld;

    // =========================================================================
    // --- GMM Training & Inference Engine ---
    // =========================================================================
    
    // GMM Result Wires
    logic               mana_dist_vld;
    logic signed [63:0] mana_dist_val;

    gmm #(
        .NUM_SAMPLES(MAX_SAMPLES),
        .DIN_WIDTH(54),
        .DOUT_WIDTH(64),
        .INV_W(32)
    ) gmm_top_inst (
        .clk50       (clk),
        .rst_n       (rst_n),
        .train_vld   (train_mode),             
        .infer_vld   (infer_mode),             
        .din_vld     (feat_write_en),          
        .din         (current_feature_vector), 
        .gmm_trained (gmm_trained_int),        // Connect to internal signal
        .dout_vld    (mana_dist_vld),          
        .mana_dist   (mana_dist_val)            
    );

    // =========================================================================
    // --- Profiling Envelopes (Latency Tracking for Logic Analyzer) ---
    // =========================================================================
    logic processing_phase; 

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            processing_phase <= 1'b0;
        end else begin
            // Turn ON when the FFT starts streaming its processed frame
            if (fft_sop) begin
                processing_phase <= 1'b1;
            end 
            // Turn OFF when the final Mahalanobis distance is generated
            else if (mana_dist_vld) begin
                processing_phase <= 1'b0;
            end
        end
    end

    // =========================================================================
    // --- Logic Analyzer Pin Mapping ---
    // =========================================================================
    assign debug_fft_sop     = fft_valid_im;
    assign debug_feat_vld    = mag_valid; // Solid HIGH block during math
    assign debug_gmm_vld     = mana_dist_vld;    // T=End Trigger
    assign debug_gmm_trained = feat_write_en;

    // =========================================================================
    // --- Percentage Wear LED Logic ---
    // =========================================================================
    
    // Calculate fractional thresholds at compile time
    localparam signed [63:0] THRESH_50  = THRESHOLD / 2;
    localparam signed [63:0] THRESH_100 = THRESHOLD;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wear_leds <= 2'b11; // Active-Low: 11 = Both OFF
        end else if (mana_dist_vld) begin
            // Check the live distance against the compile-time limits
            if (mana_dist_val >= THRESH_100)
                wear_leds <= 2'b00; // 100% Worn (Active-Low: 00 = Both ON)
            else if (mana_dist_val >= THRESH_50)
                wear_leds <= 2'b10; // 50% Worn  (Active-Low: 10 = One ON)
            else
                wear_leds <= 2'b11; // Healthy   (Active-Low: 11 = Both OFF)
        end
    end

endmodule