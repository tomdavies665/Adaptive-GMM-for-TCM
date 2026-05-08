// This extracts the frequency domain features
// 
// Fundamental Harmonic Magnitude:
// Searches bins 1 to 10 (ignoring Bin 0 DC offset) to find the largest peak.
// This accommodates spindle speeds up to 29040 RPM.
//
// High Frequency Content Mean:
// Takes the mean of all frequency bins from 20x the fundamental harmonic bin
// up to the Nyquist limit (Bin 511).

module freq_Feat_Ex
#(
    parameter WINDOW_DEPTH = 1024,
    parameter DIN_WIDTH    = 27,
    parameter DOUT_WIDTH   = 18
)
(
    input  logic                  clk50,      // Main system clock
    input  logic                  rst_n,      // Global reset

    // --- Inputs from FFT Mag ---
    input  logic                  fft_vld_in,
    input  logic [DIN_WIDTH-1:0]  fft_mag_in,
    
    // --- Outputs ---
    output logic                  fund_mag_vld,
    output logic [DOUT_WIDTH-1:0] fund_mag,
    output logic                  hf_mean_vld,  
    output logic [DOUT_WIDTH-1:0] hf_mean
);

    localparam COUNT_WIDTH = $clog2(WINDOW_DEPTH);
    
    // Internal counters and registers
    logic [COUNT_WIDTH-1:0] bin_count;
    
    // Fundamental Harmonic Registers
    logic [DIN_WIDTH-1:0]   max_mag;
    logic [COUNT_WIDTH-1:0] max_bin;
    logic [COUNT_WIDTH-1:0] hf_start_bin;
    
    // High Frequency Mean Registers
    // Accumulator needs extra bits to prevent overflow. Max 512 additions = +9 bits
    logic [DIN_WIDTH+9:0]   hf_accum; 
    logic [COUNT_WIDTH-1:0] hf_count;
    
    // State Machine
    typedef enum logic [1:0] {STREAM, CALC, DONE} state_t;
    state_t state;

    // Temporary logic for division
    logic [DIN_WIDTH+9:0]   hf_mean_full;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            bin_count    <= '0;
            max_mag      <= '0;
            max_bin      <= '0;
            hf_start_bin <= '0;
            hf_accum     <= '0;
            hf_count     <= '0;
            fund_mag     <= '0;
            hf_mean      <= '0;
            fund_mag_vld <= 1'b0;
            hf_mean_vld  <= 1'b0;
            state        <= STREAM;
        end else begin
            // Default strobes
            fund_mag_vld <= 1'b0;
            hf_mean_vld  <= 1'b0;
            
            case (state)
                STREAM: begin
                    if (fft_vld_in) begin
                        // 1. New Frame Initialization (Bin 0)
                        if (bin_count == 0) begin
                            max_mag  <= '0;
                            hf_accum <= '0;
                            hf_count <= '0;
                        end
                        
                        // 2. Search for Fundamental Harmonic (Bins 1 to 10)
                        // We skip Bin 0 just in case the DC offset wasn't perfectly removed
                        else if (bin_count >= 1 && bin_count <= 10) begin
                            if (fft_mag_in > max_mag) begin
                                max_mag      <= fft_mag_in;
                                max_bin      <= bin_count;
                                hf_start_bin <= bin_count * 20; // Pre-calculate the 20x threshold
                            end
                        end
                        
                        // 3. Accumulate High Frequency Content
                        // Starts at the 20x threshold and STOPS at Nyquist (WINDOW_DEPTH/2 - 1)
                        // We throw away the mirror image (Bins 512-1023)
                        else if (bin_count >= hf_start_bin && bin_count < (WINDOW_DEPTH / 2)) begin
                            hf_accum <= hf_accum + fft_mag_in;
                            hf_count <= hf_count + 1'b1;
                        end
                        
                        // 4. End of Frame Tracking
                        if (bin_count == WINDOW_DEPTH - 1) begin
                            bin_count <= '0;
                            state     <= CALC;
                        end else begin
                            bin_count <= bin_count + 1'b1;
                        end
                    end
                end
                
                CALC: begin
                    // SLICE 1: Grab bits [20:3] of the maximum magnitude
                    fund_mag     <= max_mag[20:3];
                    fund_mag_vld <= 1'b1;
                    
                    // Hardware Division to find the mean.
                    if (hf_count > 0) begin
                        hf_mean_full = (hf_accum / hf_count);
                        // SLICE 2: Grab bits [20:3] of the calculated mean
                        hf_mean <= hf_mean_full[20:3];
                    end else begin
                        hf_mean <= '0;
                    end
                    
                    hf_mean_vld  <= 1'b1;
                    state        <= DONE;
                end
                
                DONE: begin
                    // Wait here until the next frame begins
                    if (fft_vld_in) begin
                        bin_count <= 1'b1; 
                        max_mag   <= '0;
                        hf_accum  <= '0;
                        hf_count  <= '0;
                        state     <= STREAM;
                    end
                end
                
                default: state <= STREAM;
            endcase
        end
    end

endmodule




	
