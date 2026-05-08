// GMM - Training & Inference
// Pure Math Engine

module gmm
#(
    parameter NUM_SAMPLES  = 64,
    parameter DIN_WIDTH    = 54, // 3 x 18-bit features
    parameter DOUT_WIDTH   = 64,
    parameter INV_W        = 32
)
(
    input  logic                      clk50,
    input  logic                      rst_n,
    
    // Inputs
    input  logic                      train_vld,   // High during training phase
    input  logic                      infer_vld,   // High during inference phase
    input  logic                      din_vld,     // High when valid data is streaming
    input  logic [DIN_WIDTH-1:0]      din,
    
    // Outputs
    output logic                      gmm_trained, // High when model is ready for inference
    output logic                      dout_vld,    // PULSES HIGH when mana_dist is valid
    output logic signed [DOUT_WIDTH-1:0] mana_dist // 64-bit Mahalanobis Distance 
);

    // -------------------------------------------------------------------------
    // Internal Signals & Storage
    // -------------------------------------------------------------------------
    logic [DIN_WIDTH-1:0]    mean_vector;
    logic                    mean_ready;
    logic                    cov_vld;
    logic [INV_W*6-1:0]      cov_matrix;
    logic                    inv_vld;
    logic signed [INV_W-1:0] inv_cov_out [0:5];

    logic [DIN_WIDTH-1:0]    saved_mean;
    logic signed [INV_W-1:0] saved_inv_cov [0:5];

    // -------------------------------------------------------------------------
    // Storage Control (Latch values when training is complete)
    // -------------------------------------------------------------------------
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            gmm_trained <= 1'b0;
            saved_mean  <= '0;
            for(int i=0; i<6; i++) saved_inv_cov[i] <= '0;
        end else begin
            if (inv_vld && train_vld) begin
                gmm_trained <= 1'b1;
                saved_mean  <= mean_vector;
                for(int i=0; i<6; i++) saved_inv_cov[i] <= inv_cov_out[i];
            end else if (!train_vld && !infer_vld) begin
                gmm_trained <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Block Instantiations
    // -------------------------------------------------------------------------
    GMM_mean #(
        .NUM_SAMPLES(NUM_SAMPLES),
        .DATA_WIDTH(DIN_WIDTH)
    ) mean_inst (
        .clk50        (clk50),
        .rst_n        (rst_n),
        .train_vld    (train_vld),
        .DIN          (din),
        .sample_vld   (din_vld),
        .gmm_mean     (mean_vector),
        .gmm_mean_vld (mean_ready)
    );

    GMM_cov #(
        .NUM_SAMPLES(NUM_SAMPLES)
    ) cov_inst (
        .clk50      (clk50),
        .rst_n      (rst_n),
        .start_cov  (mean_ready), 
        .din_vld    (din_vld && train_vld),
        .din        (din),
        .mean_in    (mean_vector),
        .cov_vld    (cov_vld),
        .cov_matrix (cov_matrix)
    );

    logic signed [35:0] cov_unpacked [0:5];
    assign {cov_unpacked[5], cov_unpacked[4], cov_unpacked[3], cov_unpacked[2], cov_unpacked[1], cov_unpacked[0]} = cov_matrix;

    Matrix_Inversion inv_inst (
        .clk50     (clk50),
        .rst_n     (rst_n),
        .start_inv (cov_vld),
        .cov_in    (cov_unpacked),
        .inv_vld   (inv_vld),
        .cov_out   (inv_cov_out)
    );

    logic run_inference;
    assign run_inference = gmm_trained && infer_vld && din_vld;

    Mahalanobis_Distance #(
        .FEAT_W(18),
        .INV_W(INV_W),
        .DIST_W(DOUT_WIDTH)
    ) dist_inst (
        .clk50        (clk50),
        .rst_n        (rst_n),
        .infer_vld_in (run_inference),
        .din          (din),
        .mean_in      (saved_mean),
        .inv_cov      (saved_inv_cov),
        .dist_vld     (dout_vld),
        .mana_dist    (mana_dist)
    );

endmodule


