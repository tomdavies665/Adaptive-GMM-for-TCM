// Author: Tom Davies
// This file is used to get the magnitude of each FFT bin from real and imaginary
// components
// Uses CORDIC IP to save DSP slices, remeber CORDIC scales output by ~1.647
// Throughput latency = 6 Clock Cycles


module fft_mag
#(  
    parameter DIN_WIDTH = 26,
    parameter CORDIC_LATENCY = 6,
	 parameter DOUT_WIDTH = 27
)
(   
    input  logic                      clk50,      // Main system clock
    input  logic                      rst_n,      // Global reset
    
    // --- Inputs from FFT ---
    input  logic                      fft_valid_in,   
    input  logic signed [DIN_WIDTH-1:0] fft_real_in,
    input  logic signed [DIN_WIDTH-1:0] fft_imag_in, 
    
    // --- Outputs to Feature Extraction ---
    output logic                      fft_valid_out,
    output logic [DOUT_WIDTH-1:0]      fft_mag_out 
);

    // 1. Control Signal Pipeline (Shift Register)
    logic [CORDIC_LATENCY-1:0] valid_shift_reg;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            valid_shift_reg <= '0;
        end else begin
            valid_shift_reg <= {valid_shift_reg[CORDIC_LATENCY-2:0], fft_valid_in};
        end
    end

    // The output valid is the Most Significant Bit (the oldest bit in the pipe)
    assign fft_valid_out = valid_shift_reg[CORDIC_LATENCY-1];
   
    // 2. CORDIC IP Instantiation

    
    CORDIC_FFT fft_mag_1 (
		.clk    (clk50),    		//    clk.clk
		.areset (!rst_n), 		// areset.reset
		.x      (fft_real_in),  //      x.x
		.y      (fft_imag_in),  //      y.y
		.q      (),      			//      q.q (Phase)
		.r      (fft_mag_out)   //      r.r (Magnitude)
	);

endmodule