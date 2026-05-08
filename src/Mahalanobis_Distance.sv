// Mahalanobis Distance Calculator
// Computes D^2 = (x-mu)^T * InvCov * (x-mu)

module Mahalanobis_Distance
#(
    parameter FEAT_W = 18,
    parameter INV_W  = 32,
    parameter DIST_W = 64
)
(
    input  logic                      clk50,
    input  logic                      rst_n,
    
    // Control
    input  logic                      infer_vld_in,  // High when new sample arrives
    
    // Data Inputs
    input  logic [FEAT_W*3-1:0]       din,           // Packed 3x18-bit current sample
    input  logic [FEAT_W*3-1:0]       mean_in,       // Packed 3x18-bit stored mean
    input  logic signed [INV_W-1:0]   inv_cov [0:5], // Stored 3x3 inverted matrix
    
    // Outputs
    output logic                      dist_vld,
    output logic signed [DIST_W-1:0]  mana_dist
);

    // -------------------------------------------------------------------------
    // STAGE 1: Unpack and Subtraction (v = x - mu)
    // -------------------------------------------------------------------------
    logic signed [FEAT_W-1:0] x [0:2];
    logic signed [FEAT_W-1:0] mu [0:2];
    logic signed [FEAT_W:0]   v [0:2]; // 1 extra bit for signed subtraction
    logic valid_s1;
    
    assign {x[2], x[1], x[0]} = din;
    assign {mu[2], mu[1], mu[0]} = mean_in;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            v[0] <= '0; v[1] <= '0; v[2] <= '0;
            valid_s1 <= 1'b0;
        end else begin
            valid_s1 <= infer_vld_in;
            v[0] <= $signed(x[0]) - $signed(mu[0]);
            v[1] <= $signed(x[1]) - $signed(mu[1]);
            v[2] <= $signed(x[2]) - $signed(mu[2]);
        end
    end

    // -------------------------------------------------------------------------
    // STAGE 2: Intermediate Multiplications (v^2 and v_i*v_j)
    // -------------------------------------------------------------------------
    localparam V_MULT_W = (FEAT_W + 1) * 2;
    logic signed [V_MULT_W-1:0] v2_00, v2_11, v2_22;
    logic signed [V_MULT_W-1:0] v_01, v_02, v_12;
    logic valid_s2;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            v2_00 <= '0; v2_11 <= '0; v2_22 <= '0;
            v_01  <= '0; v_02  <= '0; v_12  <= '0;
            valid_s2 <= 1'b0;
        end else begin
            valid_s2 <= valid_s1;
            // Variances
            v2_00 <= v[0] * v[0];
            v2_11 <= v[1] * v[1];
            v2_22 <= v[2] * v[2];
            // Covariances (shifted left by 1 to multiply by 2 for the formula)
            v_01  <= (v[0] * v[1]) <<< 1; 
            v_02  <= (v[0] * v[2]) <<< 1;
            v_12  <= (v[1] * v[2]) <<< 1;
        end
    end

    // -------------------------------------------------------------------------
    // STAGE 3: Multiply by Matrix Weights
    // -------------------------------------------------------------------------
    localparam TERM_W = V_MULT_W + INV_W;
    logic signed [TERM_W-1:0] t_00, t_11, t_22;
    logic signed [TERM_W-1:0] t_01, t_02, t_12;
    logic valid_s3;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            t_00 <= '0; t_11 <= '0; t_22 <= '0;
            t_01 <= '0; t_02 <= '0; t_12 <= '0;
            valid_s3 <= 1'b0;
        end else begin
            valid_s3 <= valid_s2;
            // Note: inv_cov map: 0:M00, 1:M01, 2:M02, 3:M11, 4:M12, 5:M22
            t_00 <= v2_00 * inv_cov[0];
            t_01 <= v_01  * inv_cov[1];
            t_02 <= v_02  * inv_cov[2];
            t_11 <= v2_11 * inv_cov[3];
            t_12 <= v_12  * inv_cov[4];
            t_22 <= v2_22 * inv_cov[5];
        end
    end

    // -------------------------------------------------------------------------
    // STAGE 4: Final Accumulation
    // -------------------------------------------------------------------------
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            mana_dist <= '0;
            dist_vld  <= 1'b0;
        end else begin
            dist_vld  <= valid_s3;
            if (valid_s3) begin
                // Sum all terms
                mana_dist <= t_00 + t_11 + t_22 + t_01 + t_02 + t_12;
            end
        end
    end

endmodule