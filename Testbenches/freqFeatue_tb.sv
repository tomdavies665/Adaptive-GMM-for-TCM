`timescale 1ns / 1ps

module freqFeat_tb();

    // --- Parameters ---
    parameter WINDOW_DEPTH = 1024;
    parameter DIN_WIDTH    = 27;
    parameter DOUT_WIDTH   = 18;

    // --- Signals ---
    logic clk50;
    logic rst_n;
    
    logic fft_vld_in;
    logic [DIN_WIDTH-1:0] fft_mag_in;
    
    logic fund_mag_vld;
    logic [DOUT_WIDTH-1:0] fund_mag;
    logic hf_mean_vld;
    logic [DOUT_WIDTH-1:0] hf_mean;

    // --- DUT Instantiation ---
    freq_Feat_Ex #(
        .WINDOW_DEPTH(WINDOW_DEPTH),
        .DIN_WIDTH(DIN_WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH)
    ) dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .fft_vld_in(fft_vld_in),
        .fft_mag_in(fft_mag_in),
        .fund_mag_vld(fund_mag_vld),
        .fund_mag(fund_mag),
        .hf_mean_vld(hf_mean_vld),
        .hf_mean(hf_mean)
    );

    // --- Clock Generation ---
    always #10 clk50 = ~clk50; // 50 MHz clock -> 20ns period

    // --- Test Sequence ---
    initial begin
        // Initialize Inputs
        clk50      = 0;
        rst_n      = 0;
        fft_vld_in = 0;
        fft_mag_in = '0;

        // Apply Reset
        #50;
        rst_n = 1;
        #50;
        
        // ---------------------------------------------------------
        // FRAME 1: Standard Operation Test
        // ---------------------------------------------------------
        $display("--- Starting Frame 1 ---");
        send_frame();

        // Using @(posedge) is safer than wait() to prevent missing 1-cycle pulses
        @(posedge fund_mag_vld);
        @(posedge clk50); // Give waveforms time to register outputs
        
        $display("Frame 1 Results: fund_mag = %0d, hf_mean = %0d", fund_mag, hf_mean);
        
        if (fund_mag == 18'd125_000) 
            $display("PASS: fund_mag is correct.");
        else 
            $error("FAIL: fund_mag is incorrect. Expected 125000, Got %0d", fund_mag);

        if (hf_mean == 18'd62_500) 
            $display("PASS: hf_mean is correct.");
        else 
            $error("FAIL: hf_mean is incorrect. Expected 62500, Got %0d", hf_mean);

        // ---------------------------------------------------------
        // FRAME 2: State Recovery Test (DONE -> STREAM)
        // ---------------------------------------------------------
        #100;
        $display("\n--- Starting Frame 2 (Testing recovery from DONE state) ---");
        send_frame();

        @(posedge fund_mag_vld);
        @(posedge clk50);
        
        $display("Frame 2 Results: fund_mag = %0d, hf_mean = %0d", fund_mag, hf_mean);
        if (fund_mag == 18'd125_000 && hf_mean == 18'd62_500)
            $display("PASS: Frame 2 computed correctly, state machine recovery successful.\n");
        else
            $error("FAIL: Frame 2 computed incorrectly.\n");

        #100;
        $display("Simulation Finished.");
        $stop;
    end

    // --- Task: Send a 1024-bin FFT Frame ---
    task send_frame;
        integer i;
        begin
            // ALIGN TO NEGATIVE EDGE: Guarantees the DUT reads stable data on the posedge
            @(negedge clk50); 
            
            for (i = 0; i < WINDOW_DEPTH; i = i + 1) begin
                // Use blocking assignments (=) since we are safely on the negedge
                fft_vld_in = 1'b1;
                
                if (i == 4) begin
                    fft_mag_in = 27'd1_000_000;
                end 
                else if (i >= 1 && i <= 10) begin
                    fft_mag_in = 27'd10_000;
                end 
                else if (i >= 80 && i < 512) begin
                    fft_mag_in = 27'd500_000;
                end 
                else begin
                    fft_mag_in = 27'd0;
                end
                
                @(negedge clk50); // Step forward by one clock cycle
            end
            
            fft_vld_in = 1'b0;
            fft_mag_in = '0;
        end
    endtask

endmodule
