`timescale 1ns/1ps

module fft_mag_tb();

    // --- Parameters ---
    parameter DIN_WIDTH = 26;
    parameter CORDIC_LATENCY = 6;
    parameter DOUT_WIDTH = 27;

    // --- Signals ---
    logic clk50;
    logic rst_n;
    
    logic fft_valid_in;
    logic signed [DIN_WIDTH-1:0] fft_real_in;
    logic signed [DIN_WIDTH-1:0] fft_imag_in;
    
    logic fft_valid_out;
    logic [DOUT_WIDTH-1:0] fft_mag_out; // 27-bit Unsigned output

    // --- Instantiate the Device Under Test (DUT) ---
    // (Ensure your fft_mag module takes DOUT_WIDTH as a param if needed)
    fft_mag #(
        .DIN_WIDTH(DIN_WIDTH),
        .CORDIC_LATENCY(CORDIC_LATENCY)
    ) dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .fft_valid_in(fft_valid_in),
        .fft_real_in(fft_real_in),
        .fft_imag_in(fft_imag_in),
        .fft_valid_out(fft_valid_out),
        .fft_mag_out(fft_mag_out)
    );

    // --- Clock Generation (50 MHz = 20ns period) ---
    initial begin
        clk50 = 0;
        forever #10 clk50 = ~clk50; 
    end

    // --- Print Outputs to Console ---
    // $monitor will print a line every time one of these signals changes
    initial begin
        $monitor("Time: %0t | VALID_IN: %b | Real: %7d, Imag: %7d || VALID_OUT: %b | Mag OUT: %8d", 
                  $time, fft_valid_in, fft_real_in, fft_imag_in, fft_valid_out, fft_mag_out);
    end

    // --- Stimulus (Driving the Inputs) ---
    initial begin
        // 1. Initial State & Reset
        rst_n = 0;
        fft_valid_in = 0;
        fft_real_in = 0;
        fft_imag_in = 0;
        
        // Hold reset for 2 clock cycles
        @(posedge clk50);
        @(posedge clk50);
        rst_n = 1;      // Release reset
        @(posedge clk50);

        // Test Case 1: 3-4-5 Triangle * 1000 -> Mag should be 5000. 
        // With CORDIC gain (1.64676): 5000 * 1.64676 = ~8234
        fft_valid_in = 1;
        fft_real_in  =  26'sd3000;  
        fft_imag_in  =  26'sd4000;  
        @(posedge clk50);
        
        // Test Case 2: Negative real number (-3000, 4000) -> Mag should still be 5000.
        // With CORDIC gain: ~8234
        fft_valid_in = 1;
        fft_real_in  = -26'sd3000; 
        fft_imag_in  =  26'sd4000; 
        @(posedge clk50);
        
        // Test Case 3: Only Real part (5000, 0) -> Mag should be 5000.
        // With CORDIC gain: ~8234
        fft_valid_in = 1;
        fft_real_in  =  26'sd5000;
        fft_imag_in  =  0;
        @(posedge clk50);
        
        // Test Case 4: 6-8-10 Triangle * 1000 -> Mag should be 10000.
        // With CORDIC gain: 10000 * 1.64676 = ~16468
        fft_valid_in = 1;
        fft_real_in  =  26'sd6000;
        fft_imag_in  =  26'sd8000;
        @(posedge clk50);
          
        // Test Case 5: Zero input (0, 0) -> Mag should be 0
        fft_valid_in = 1;
        fft_real_in  = 0;
        fft_imag_in  = 0;
        @(posedge clk50);

        // Stop sending valid data
        fft_valid_in = 0;
        fft_real_in  = 0;
        fft_imag_in  = 0;

        // Wait for the pipeline to drain completely (Latency + a few buffer clocks)
        repeat (CORDIC_LATENCY + 5) @(posedge clk50);

        // End simulation
        $display("\n--- Simulation Complete ---");
        $stop;
    end

endmodule