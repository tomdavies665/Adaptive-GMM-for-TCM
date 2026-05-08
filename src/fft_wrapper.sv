// Author: Tom Davies
// This module acts as the interface to the FFT IP
// Output is in signed Q8.14 (25 bits) format
// ATM 2048 point FFT but switching lower saves on hardware, testing needed
// Throughput latency is 4096 clock cycles ~82us

// Fully parameterized to allow easy scaling of FFT depth and bit widths.

module fft_wrapper
#(  
    parameter CORDIC_OUT_WIDTH = 14,   // Width of the incoming original magnitude (without sign bit)
    parameter FFT_IN_WIDTH     = 16,   // Width expected by the generated FFT IP
    parameter FFT_DEPTH        = 1024, // Transform length (e.g., 512, 1024, 2048)
    parameter FFT_OUT_WIDTH    = 26    // Output width (FFT_IN_WIDTH + log2(FFT_DEPTH))
)
(   
    input  logic                            clk50,      // Main system clock
    input  logic                            rst_n,      // Global reset
    
    // --- Inputs from DC Offset Removal ---
    input  logic                            valid_in,   
    input  logic signed [CORDIC_OUT_WIDTH:0] data_in,   // Signed data (15 bits wide)
    
    // --- Outputs to Feature Extraction ---
    output logic                            fft_valid_out,
    output logic                            fft_sop_out,
    output logic                            fft_eop_out,
    output logic signed [FFT_OUT_WIDTH-1:0] fft_real_out,
    output logic signed [FFT_OUT_WIDTH-1:0] fft_imag_out
);
    
    // --- Auto-Calculating Local Parameters ---
    // $clog2 calculates the exact number of bits needed to count up to FFT_DEPTH
    localparam COUNT_WIDTH = $clog2(FFT_DEPTH);
    
    // Account for the +1 bit in the data_in width when calculating padding
    localparam ACTUAL_IN_WIDTH = CORDIC_OUT_WIDTH + 1;
    localparam PAD_WIDTH       = FFT_IN_WIDTH - ACTUAL_IN_WIDTH;

    logic [COUNT_WIDTH-1:0] sample_count;
    logic                   sink_ready;
    logic                   sink_sop;
    logic                   sink_eop;

    // --- Packetizing Logic (Counter) ---
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            sample_count <= {COUNT_WIDTH{1'b0}};
        end else if (valid_in && sink_ready) begin
            if (sample_count == FFT_DEPTH - 1)
                sample_count <= {COUNT_WIDTH{1'b0}};
            else
                sample_count <= sample_count + 1'b1; // Auto-scales to COUNT_WIDTH
        end
    end

    assign sink_sop = (sample_count == {COUNT_WIDTH{1'b0}}) && valid_in;
    assign sink_eop = (sample_count == (FFT_DEPTH - 1)) && valid_in;

    // --- Safely Convert Unsigned CORDIC to Signed FFT Input ---
    logic signed [FFT_IN_WIDTH-1:0] padded_data_in;
    
    // Dynamically concatenates the exact number of sign bits required (PAD_WIDTH) 
    // to the front of data_in, guaranteeing correct two's complement extension.
    assign padded_data_in = { {PAD_WIDTH{data_in[CORDIC_OUT_WIDTH]}}, data_in }; 

    // --- FFT Instantiation ---
    fft fft_1 (
        .clk          (clk50),          
        .reset_n      (rst_n),      
        .sink_valid   (valid_in),   
        .sink_ready   (sink_ready), 
        .sink_error   (2'b00),          
        .sink_sop     (sink_sop),   
        .sink_eop     (sink_eop),   
        .sink_real    (padded_data_in), 
        
        // Dynamically creates a block of zeros matching the FFT_IN_WIDTH
        .sink_imag    ({FFT_IN_WIDTH{1'b0}}),        
        
        // Passes the depth parameter directly to the IP core
        .fftpts_in    (FFT_DEPTH),     
        
        .inverse      (1'b0),           
        .source_valid (fft_valid_out), 
        .source_ready (1'b1),            
        .source_error (),           
        .source_sop   (fft_sop_out),   
        .source_eop   (fft_eop_out),   
        .source_real  (fft_real_out),  
        .source_imag  (fft_imag_out),
        .fftpts_out   ()                
    );

endmodule
	
	