`timescale 1ns / 1ps

module tb_Mahalanobis_Distance;

    // -------------------------------------------------------------------------
    // PARAMETERS
    // -------------------------------------------------------------------------
    parameter FEAT_W = 18;
    parameter INV_W  = 32;
    parameter DIST_W = 64;

    // -------------------------------------------------------------------------
    // SIGNALS
    // -------------------------------------------------------------------------
    logic                      clk50;
    logic                      rst_n;
    
    logic                      infer_vld_in;
    logic [FEAT_W*3-1:0]       din;
    logic [FEAT_W*3-1:0]       mean_in;
    logic signed [INV_W-1:0]   inv_cov [0:5];
    
    logic                      dist_vld;
    logic signed [DIST_W-1:0]  mana_dist;

    // Helper signals for readable packing
    logic signed [FEAT_W-1:0]  test_x  [0:2];
    logic signed [FEAT_W-1:0]  test_mu [0:2];

    // -------------------------------------------------------------------------
    // DUT INSTANTIATION
    // -------------------------------------------------------------------------
    Mahalanobis_Distance #(
        .FEAT_W(FEAT_W),
        .INV_W(INV_W),
        .DIST_W(DIST_W)
    ) dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .infer_vld_in(infer_vld_in),
        .din(din),
        .mean_in(mean_in),
        .inv_cov(inv_cov),
        .dist_vld(dist_vld),
        .mana_dist(mana_dist)
    );

    // -------------------------------------------------------------------------
    // CLOCK GENERATION
    // -------------------------------------------------------------------------
    initial begin
        clk50 = 0;
        forever #10 clk50 = ~clk50; // 50 MHz
    end

    // Pack the helper arrays into the flat input buses
    assign din     = {test_x[2], test_x[1], test_x[0]};
    assign mean_in = {test_mu[2], test_mu[1], test_mu[0]};

    // -------------------------------------------------------------------------
    // MAIN STIMULUS
    // -------------------------------------------------------------------------
    initial begin
        // 1. Initialize
        rst_n        = 0;
        infer_vld_in = 0;
        
        test_x[0] = '0; test_x[1] = '0; test_x[2] = '0;
        test_mu[0] = '0; test_mu[1] = '0; test_mu[2] = '0;
        for(int i=0; i<6; i++) inv_cov[i] = '0;

        // 2. Assert Reset
        #50;
        rst_n = 1;
        #20;

        // 3. Load the Trained Model (Mean and Inverse Covariance)
        // Mean vector: [2, 4, 3]
        test_mu[0] = 18'sd2;
        test_mu[1] = 18'sd4;
        test_mu[2] = 18'sd3;

        // Inverse Covariance Matrix (symmetric)
        // M00=1, M01=0, M02=-1, M11=2, M12=1, M22=1
        inv_cov[0] = 32'sd1;   // M00
        inv_cov[1] = 32'sd0;   // M01
        inv_cov[2] = -32'sd1;  // M02
        inv_cov[3] = 32'sd2;   // M11
        inv_cov[4] = 32'sd1;   // M12
        inv_cov[5] = 32'sd1;   // M22

        // 4. Send an Inference Sample
        // Incoming Sample: [5, 6, 7] 
        // Difference (v) should be: [3, 2, 4]
        @(posedge clk50);
        test_x[0] = 18'sd5;
        test_x[1] = 18'sd6;
        test_x[2] = 18'sd7;
        infer_vld_in = 1'b1;
        
        @(posedge clk50);
        infer_vld_in = 1'b0; // Pulse for one clock cycle

        // 5. Wait for pipeline to finish (4 stages)
        $display("Sample sent into pipeline. Waiting for calculation...");
        wait(dist_vld == 1'b1);
        @(posedge clk50); // Align with clock edge for printing
        
        // 6. Check Results
        $display("--------------------------------------------------");
        $display(" MAHALANOBIS DISTANCE RESULTS");
        $display("--------------------------------------------------");
        $display("Expected D^2 | Actual D^2");
        $display("     25      | %0d", mana_dist);
        $display("--------------------------------------------------");

        if (mana_dist == 64'sd25)
            $display("[PASS] Pipelined distance calculated correctly!");
        else
            $display("[FAIL] Math did not match expected result.");

        #100;
        $stop;
    end

endmodule