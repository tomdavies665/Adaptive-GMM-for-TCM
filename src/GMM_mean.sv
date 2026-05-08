// This file is used to calculate the mean for each feature in the learning process
// It accumulates 64 samples, each 51 bits, containing the bits for 3 features
// Extracts the features from the bits, then computes the average by bit shifting 6 bits
module GMM_mean #(
    parameter NUM_SAMPLES = 64,
    parameter DATA_WIDTH  = 54 // Updated: 3 features * 18 bits = 54 bits
)(
    input  logic                  clk50,      // Main system clock
    input  logic                  rst_n,      // Global reset
    
    // INPUTS
    input  logic                  train_vld,  // Flag to control when should train
    input  logic [DATA_WIDTH-1:0] DIN,
    input  logic                  sample_vld,
    
    // OUTPUTS 
    output logic [DATA_WIDTH-1:0] gmm_mean,   
    output logic                  gmm_mean_vld
);

    // -------------------------------------------------------------------------
    // ACCUMULATORS
    // All inputs are 18-bit. Max sum of 64 samples requires 18 + 6 = 24 bits.
    // -------------------------------------------------------------------------
    logic signed [23:0] acc_time_mean; 
    logic        [23:0] acc_fund_mag;  
    logic        [23:0] acc_hf_mean;   
    
    // Sample counter (Counts 0 to 63)
    logic [5:0] sample_cnt; 

    // -------------------------------------------------------------------------
    // COMBINATIONAL LOOK-AHEAD (For the 64th sample)
    // -------------------------------------------------------------------------
    logic signed [23:0] next_time_mean;
    logic        [23:0] next_fund_mag;
    logic        [23:0] next_hf_mean;

    assign next_time_mean = acc_time_mean + $signed(DIN[53:36]);
    assign next_fund_mag  = acc_fund_mag  + DIN[35:18];
    assign next_hf_mean   = acc_hf_mean   + DIN[17:0];

    // -------------------------------------------------------------------------
    // SEQUENTIAL LOGIC
    // -------------------------------------------------------------------------
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            acc_time_mean <= '0;
            acc_fund_mag  <= '0;
            acc_hf_mean   <= '0;
            sample_cnt    <= '0;
            gmm_mean      <= '0;
            gmm_mean_vld  <= 1'b0;
        end else begin
            // Default valid flag to 0 
            gmm_mean_vld <= 1'b0;
            
            // If training is disabled, flush the pipeline
            if (!train_vld) begin
                acc_time_mean <= '0;
                acc_fund_mag  <= '0;
                acc_hf_mean   <= '0;
                sample_cnt    <= '0;
            end 
            // Otherwise accumulate
            else if (sample_vld) begin
                
                if (sample_cnt == 6'd63) begin
                    // 64th Sample: Calculate final sum and divide by 64 (bit slice [23:6])
                    gmm_mean <= {
                        next_time_mean[23:6], 
                        next_fund_mag[23:6],  
                        next_hf_mean[23:6]   
                    };
                    gmm_mean_vld <= 1'b1;
                    
                    // Reset accumulators to 0 to prepare for the next batch of 64
                    acc_time_mean <= '0;
                    acc_fund_mag  <= '0;
                    acc_hf_mean   <= '0;
                    sample_cnt    <= '0;
                end else begin
                    // Standard Accumulation for samples 0 to 62
                    acc_time_mean <= acc_time_mean + $signed(DIN[53:36]);
                    acc_fund_mag  <= acc_fund_mag  + DIN[35:18];
                    acc_hf_mean   <= acc_hf_mean   + DIN[17:0];
                    sample_cnt    <= sample_cnt + 1'b1;
                end
            end
        end
    end

endmodule
