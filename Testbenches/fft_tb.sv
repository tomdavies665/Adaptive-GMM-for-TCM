`timescale 1ns/1ps

module fft_tb;

    // --- Clocks & Resets ---
    logic clk50;
    logic rst_n;
    
    // --- Inputs to FFT Wrapper ---
    logic        valid_in;
    logic [13:0] data_in;
    
    // --- Outputs from FFT Wrapper ---
    logic               fft_valid_out;
    logic               fft_sop_out;
    logic               fft_eop_out;
    logic signed [25:0] fft_real_out;
    logic signed [25:0] fft_imag_out;

    integer fd_out;

    // --- Timing Constants ---
    localparam int CLK_PERIOD       = 20; 
    localparam int TICKS_PER_SAMPLE = 10; 

    // --- Mathematical Constants ---
    real pi = 3.1415926535;
    real fs = 5000000.0;     
    real f1 = 150000.0;      
    real f2 = 800000.0;      
    
    // Variables for signal generation
    real raw_sine_val;
    real mag_val;
    
    // Instantiating the parameterised wrapper
    fft_wrapper #(
        .CORDIC_OUT_WIDTH(14),
        .FFT_IN_WIDTH(16),
        .FFT_DEPTH(1024),      
        .FFT_OUT_WIDTH(26)
    ) dut (
        .clk50        (clk50),
        .rst_n        (rst_n),
        .valid_in     (valid_in),
        .data_in      (data_in),
        .fft_valid_out(fft_valid_out),
        .fft_sop_out  (fft_sop_out),
        .fft_eop_out  (fft_eop_out),
        .fft_real_out (fft_real_out),
        .fft_imag_out (fft_imag_out)
    );

    // --- Clock Generation ---
    initial clk50 = 0;
    always #(CLK_PERIOD/2) clk50 = ~clk50;

    // --- Stimulus Generation ---
    initial begin
        rst_n = 0;
        valid_in = 0;
        data_in = 0;
        
        fd_out = $fopen("fft_output.csv", "w");
        $fdisplay(fd_out, "Real,Imag");

        #(CLK_PERIOD * 5) rst_n = 1;
        repeat(5) @(negedge clk50);

        // NOTE: Make sure the loop count matches FFT_DEPTH
        $display("Feeding 1024 samples at 10:1 clock ratio...");
        
        for (int i = 0; i < 1024; i++) begin
            @(negedge clk50);
            
            // 1. Generate a complex multi-tone signal (ranges from -1.0 to 1.0)
            raw_sine_val = (0.5 * $sin(2.0 * pi * f1 * i / fs)) + 
                           (0.5 * $sin(2.0 * pi * f2 * i / fs));
            
            // 2. Scale it to +/- 8000, then add a DC offset of 8192.
            // This perfectly centers the wave inside the 0 to 16383 unsigned 14-bit range
            // without distorting or rectifying the frequencies.
            data_in = 14'(8192 + int'(raw_sine_val * 8000.0));
            
            valid_in = 1'b1; // Pulse valid for 1 cycle
            
            @(negedge clk50);
            valid_in = 1'b0; 
            
            // Wait 9 cycles (Total of 10 cycles per sample)
            repeat(TICKS_PER_SAMPLE - 1) @(negedge clk50);
        end
        
        valid_in = 1'b0;
        
        // Wait for the pipeline to finish
        #300000; 
        
        $display("ERROR: Simulation timed out!");
        $fclose(fd_out);
        $stop;
    end

    // --- Output Capture ---
    always @(posedge clk50) begin
        if (fft_valid_out) begin
            $fdisplay(fd_out, "%d,%d", $signed(fft_real_out), $signed(fft_imag_out));
        end
        
        if (fft_valid_out && fft_eop_out) begin
            $display("SUCCESS: FFT frame captured.");
            $fclose(fd_out);
            $stop;
        end
    end

endmodule