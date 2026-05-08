`timescale 1ns / 1ps

module tb_Matrix_Inversion;

    // Parameters
    parameter DIN_WIDTH  = 36;
    parameter DOUT_WIDTH = 32;

    // Signals
    logic                      clk50;
    logic                      rst_n;
    
    logic                      start_inv;
    logic                      inv_vld;
    
    logic signed [DIN_WIDTH-1:0]  cov_in  [0:5];
    logic signed [DOUT_WIDTH-1:0] cov_out [0:5];

    // Instantiate the DUT
    Matrix_Inversion #(
        .DIN_WIDTH(DIN_WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH)
    ) dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .start_inv(start_inv),
        .inv_vld(inv_vld),
        .cov_in(cov_in),
        .cov_out(cov_out)
    );

    // Clock Generation
    initial begin
        clk50 = 0;
        forever #10 clk50 = ~clk50; // 50 MHz
    end

    // Main Test Stimulus
    initial begin
        // Initialize
        rst_n     = 0;
        start_inv = 0;
        for (int i=0; i<6; i++) cov_in[i] = 0;

        // Reset
        #50;
        rst_n = 1;
        #20;

        // ---------------------------------------------------------------------
        // TEST CASE: Real Data from Python Bit-Accurate Model
        // ---------------------------------------------------------------------
        cov_in[0] = 36'sd135718672; // Cov(0,0)
        cov_in[1] = 36'sd4801139;   // Cov(0,1)
        cov_in[2] = 36'sd-35647986; // Cov(0,2)
        cov_in[3] = 36'sd110813122; // Cov(1,1)
        cov_in[4] = 36'sd2254570;   // Cov(1,2)
        cov_in[5] = 36'sd157142791; // Cov(2,2)

        // Pulse Start
        @(posedge clk50);
        start_inv = 1;
        @(posedge clk50);
        start_inv = 0;

        // Wait for FSM to finish calculation
        $display("Matrix Inversion Started... waiting for inv_vld");
        
        wait(inv_vld == 1'b1);
        @(posedge clk50);
        
        // Print Results
        $display("--------------------------------------------------");
        $display(" MATRIX INVERSION RESULTS");
        $display("--------------------------------------------------");
        $display("Actual FPGA Output");
        $display("%0d \t(Inv 0,0)", cov_out[0]);
        $display("%0d \t(Inv 0,1)", cov_out[1]);
        $display("%0d \t(Inv 0,2)", cov_out[2]);
        $display("%0d \t(Inv 1,1)", cov_out[3]);
        $display("%0d \t(Inv 1,2)", cov_out[4]);
        $display("%0d \t(Inv 2,2)", cov_out[5]);
        $display("--------------------------------------------------");

        #100;
        $finish;
    end

endmodule

// =============================================================================
// MOCK ALTERA IPs (Allows simulation without Quartus Libraries)
// =============================================================================

// Mock Multiplier (Latency = 2)
module mult32 (
    input  logic               clock,
    input  logic signed [31:0] dataa,
    input  logic signed [31:0] datab,
    output logic signed [63:0] result
);
    logic signed [63:0] pipe [0:1];
    always_ff @(posedge clock) begin
        pipe[0] <= dataa * datab;
        pipe[1] <= pipe[0];
    end
    assign result = pipe[1];

endmodule

// Mock Divider (Latency = 4)
module div32 (
    input  logic               clock,
    input  logic signed [31:0] numer,
    input  logic signed [31:0] denom,
    output logic signed [31:0] quotient,
    output logic [31:0]        remain
);
    logic signed [31:0] q_pipe [0:3];
    logic [31:0]        r_pipe [0:3];

    always_ff @(posedge clock) begin
        // Protect against divide-by-zero simulation crashes
        q_pipe[0] <= (denom != 0) ? (numer / denom) : '0;
        r_pipe[0] <= (denom != 0) ? (numer % denom) : '0;
        
        q_pipe[1] <= q_pipe[0]; r_pipe[1] <= r_pipe[0];
        q_pipe[2] <= q_pipe[1]; r_pipe[2] <= r_pipe[1];
        q_pipe[3] <= q_pipe[2]; r_pipe[3] <= r_pipe[2];
    end
    assign quotient = q_pipe[3];
    assign remain   = r_pipe[3];
endmodule