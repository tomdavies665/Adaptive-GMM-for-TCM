`timescale 1ns / 1ps

module tb_GMM_cov;

    // -------------------------------------------------------------------------
    // PARAMETERS
    // -------------------------------------------------------------------------
    parameter NUM_SAMPLES = 64;
    parameter FEAT_W      = 18;
    parameter NUM_FEAT    = 3;
    
    parameter MULT_W        = FEAT_W * 2;
    parameter PACKED_DIN_W  = FEAT_W * NUM_FEAT;
    parameter PACKED_COV_W  = MULT_W * 6;

    // -------------------------------------------------------------------------
    // SIGNALS
    // -------------------------------------------------------------------------
    logic                      clk50;
    logic                      rst_n;
    
    logic                      start_cov;
    logic                      din_vld;
    logic [PACKED_DIN_W-1:0]   din;
    logic [PACKED_DIN_W-1:0]   mean_in;
    
    logic                      cov_vld;
    logic [PACKED_COV_W-1:0]   cov_matrix;

    // Helper signals to make packing/unpacking human-readable
    logic signed [FEAT_W-1:0] test_mu [0:2];
    logic signed [FEAT_W-1:0] test_x  [0:2];
    
    logic signed [MULT_W-1:0] out_cov [0:5];

    // -------------------------------------------------------------------------
    // DUT INSTANTIATION
    // -------------------------------------------------------------------------
    GMM_cov #(
        .NUM_SAMPLES(NUM_SAMPLES),
        .FEAT_W(FEAT_W),
        .NUM_FEAT(NUM_FEAT)
    ) dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .start_cov(start_cov),
        .din_vld(din_vld),
        .din(din),
        .mean_in(mean_in),
        .cov_vld(cov_vld),
        .cov_matrix(cov_matrix)
    );

    // -------------------------------------------------------------------------
    // CLOCK GENERATION (50 MHz)
    // -------------------------------------------------------------------------
    initial begin
        clk50 = 0;
        forever #10 clk50 = ~clk50; // 20ns period
    end

    // Pack inputs
    assign mean_in = {test_mu[2], test_mu[1], test_mu[0]};
    assign din     = {test_x[2],  test_x[1],  test_x[0]};

    // Unpack outputs for easy viewing in the waveform/console
    assign {out_cov[5], out_cov[4], out_cov[3], out_cov[2], out_cov[1], out_cov[0]} = cov_matrix;

    // -------------------------------------------------------------------------
    // MAIN STIMULUS
    // -------------------------------------------------------------------------
    initial begin
        // Initialize Signals
        rst_n      = 0;
        start_cov  = 0;
        din_vld    = 0;
        
        test_mu[0] = 18'sd10;
        test_mu[1] = 18'sd20;
        test_mu[2] = 18'sd30;
        
        test_x[0]  = 18'sd12; // Diff = 2
        test_x[1]  = 18'sd17; // Diff = -3
        test_x[2]  = 18'sd34; // Diff = 4

        // 1. Assert Reset
        #50;
        rst_n = 1;
        #20;

        // 2. Pulse Start Flag
        @(posedge clk50);
        start_cov = 1;
        @(posedge clk50);
        start_cov = 0;

        // 3. Stream 64 valid samples
        $display("Streaming 64 samples into GMM_cov...");
        for (int i = 0; i < NUM_SAMPLES; i++) begin
            din_vld = 1;
            @(posedge clk50);
        end
        
        // Stop streaming
        din_vld = 0;

        // 4. Wait for processing to finish
        // Because of the 2-stage pipeline, it takes a couple of cycles after the 
        // 64th sample is presented for the accumulator to finish and flag 'cov_vld'.
        wait(cov_vld == 1'b1);
        @(posedge clk50); 
        
        // 5. Check Results
        $display("--------------------------------------------------");
        $display(" COVARIANCE MATRIX RESULTS");
        $display("--------------------------------------------------");
        $display("Expected | Actual");
        $display("    4    | %0d \t(Cov 0,0)", out_cov[0]);
        $display("   -6    | %0d \t(Cov 0,1)", out_cov[1]);
        $display("    8    | %0d \t(Cov 0,2)", out_cov[2]);
        $display("    9    | %0d \t(Cov 1,1)", out_cov[3]);
        $display("  -12    | %0d \t(Cov 1,2)", out_cov[4]);
        $display("   16    | %0d \t(Cov 2,2)", out_cov[5]);
        $display("--------------------------------------------------");

        if (out_cov[0] == 4 && out_cov[5] == 16)
            $display("[PASS] Matrix math and bit-shifting are correct.");
        else
            $display("[FAIL] Outputs do not match expected math.");

        #100;
        $finish;
    end

endmodule