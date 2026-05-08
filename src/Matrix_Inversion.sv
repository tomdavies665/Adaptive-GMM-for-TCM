// 3x3 Matrix Inversion for Symmetric Covariance Matrix
// Method: Adjugate Matrix / Determinant
// Pipelined: Shared Multiplier and Divider via FSM
// Latency: Multiplier (1 cycle), Divider (4 cycles)

module Matrix_Inversion
#(
    parameter DIN_WIDTH  = 36,
    parameter DOUT_WIDTH = 32
)
(
    input  logic                      clk50,
    input  logic                      rst_n,
    
    // Control
    input  logic                      start_inv,
    output logic                      inv_vld,
    
    // Data (Unpacked Arrays)
    input  logic signed [DIN_WIDTH-1:0]  cov_in  [0:5], // {C00, C01, C02, C11, C12, C22}
    output logic signed [DOUT_WIDTH-1:0] cov_out [0:5]
);

    // -------------------------------------------------------------------------
    // 1. INTERNAL REGISTERS & SIGNALS
    // -------------------------------------------------------------------------
    logic signed [31:0] a, b, c, d, e, f; // Internal 32-bit matrix elements
    logic signed [31:0] C00, C01, C02, C11, C12, C22; // Cofactors
    logic signed [64:0] det;
    logic signed [31:0] m_reg; // Temporary storage for first half of cofactor math
    
    // IP Interface Signals
    logic signed [31:0] dataa_sig, datab_sig;
    logic signed [63:0] result_sig;
    logic signed [31:0] result_truncated;
    
    logic signed [31:0] numer_sig, denom_sig;
    logic signed [31:0] quotient_sig;
    logic [31:0]        remain_sig; // Unused

    // FSM State Definition
    typedef enum logic [4:0] {
        IDLE, 
        LOAD,
        CALC_COF_MULT1, // First mult of a cofactor
        CALC_COF_MULT2, // Second mult of a cofactor
        CALC_DET,       // Det = aC00 + bC01 + cC02
        CALC_DIV,       // Final division (Cofactor/Det)
        DONE
    } state_t;

    state_t state;
    logic [3:0] step;     // Tracks which of the 6 elements
    logic [2:0] wait_cnt; // Handles IP latency

    // -------------------------------------------------------------------------
    // 2. IP INSTANTIATIONS (Altera/Intel LPM)
    // -------------------------------------------------------------------------
    // Set for Signed 32-bit. 2 cycle latency for multiplier.
    mult32 mult32_inst (
        .clock  ( clk50 ),
        .dataa  ( dataa_sig ),
        .datab  ( datab_sig ),
        .result ( result_sig )
    );
    
    // FIX: Truncate to the BOTTOM 32 bits to preserve integer values.
    // Discarding the top 32 bits prevents massive accidental division.
    assign result_truncated = result_sig[31:0];

    // Set for Signed 32-bit. Latency = 4 cycles
    div32 div32_inst (
        .clock    ( clk50 ),
        .denom    ( denom_sig ),
        .numer    ( numer_sig ),
        .quotient ( quotient_sig ),
        .remain   ( remain_sig )
    );

    // -------------------------------------------------------------------------
    // 3. FSM CONTROL LOGIC
    // -------------------------------------------------------------------------
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            state    <= IDLE;
            inv_vld  <= 1'b0;
            step     <= '0;
            wait_cnt <= '0;
            for(int i=0; i<6; i++) cov_out[i] <= '0;
        end else begin
            inv_vld <= 1'b0;

            case (state)
                IDLE: begin
                    if (start_inv) begin
                        state <= LOAD;
                        step  <= 0;
                    end
                end

                LOAD: begin
                    // FIX: Convert 36-bit to 32-bit by grabbing the bottom 32 bits directly.
                    // This preserves the true integer value of your covariance features.
                    a <= cov_in[0][31:0]; 
                    b <= cov_in[1][31:0]; 
                    c <= cov_in[2][31:0];
                    d <= cov_in[3][31:0]; 
                    e <= cov_in[4][31:0]; 
                    f <= cov_in[5][31:0];
                    state <= CALC_COF_MULT1;
                end

                // Step 1: Perform the first part of each cofactor subtraction (e.g., d*f)
                CALC_COF_MULT1: begin
                    case (step)
                        0: begin dataa_sig <= d; datab_sig <= f; end // for C00
                        1: begin dataa_sig <= c; datab_sig <= e; end // for C01
                        2: begin dataa_sig <= b; datab_sig <= e; end // for C02
                        3: begin dataa_sig <= a; datab_sig <= f; end // for C11
                        4: begin dataa_sig <= b; datab_sig <= c; end // for C12
                        5: begin dataa_sig <= a; datab_sig <= d; end // for C22
                    endcase
                    
                    if (wait_cnt == 3) begin // Multiplier Latency
                        m_reg    <= result_truncated;
                        wait_cnt <= 0;
                        state    <= CALC_COF_MULT2;
                    end else wait_cnt <= wait_cnt + 1;
                end

                // Step 2: Second part (e.g., m_reg - e*e)
                CALC_COF_MULT2: begin
                    case (step)
                        0: begin dataa_sig <= e; datab_sig <= e; end
                        1: begin dataa_sig <= b; datab_sig <= f; end
                        2: begin dataa_sig <= c; datab_sig <= d; end
                        3: begin dataa_sig <= c; datab_sig <= c; end
                        4: begin dataa_sig <= a; datab_sig <= e; end
                        5: begin dataa_sig <= b; datab_sig <= b; end
                    endcase

                    if (wait_cnt == 3) begin
                        case (step)
                            0: C00 <= m_reg - result_truncated;
                            1: C01 <= m_reg - result_truncated;
                            2: C02 <= m_reg - result_truncated;
                            3: C11 <= m_reg - result_truncated;
                            4: C12 <= m_reg - result_truncated;
                            5: C22 <= m_reg - result_truncated;
                        endcase
                        wait_cnt <= 0;
                        if (step == 5) begin
                            state <= CALC_DET;
                            step  <= 0;
                        end else begin
                            step  <= step + 1;
                            state <= CALC_COF_MULT1;
                        end
                    end else wait_cnt <= wait_cnt + 1;
                end

                // Step 3: Determinant calculation (Using Multiplier one more time)
                CALC_DET: begin
                    // Det = a*C00 + b*C01 + c*C02
                    det <= (64'(a) * C00) + (64'(b) * C01) + (64'(c) * C02); 
                    state <= CALC_DIV;
                    step  <= 0;
                end

                // Step 4: Division (Each cofactor / Determinant)
                CALC_DIV: begin
                    // FIX: Grab the bottom 32 bits of the determinant to prevent dividing by ~65k
                    denom_sig <= det[31:0]; 
                    
                    // FIX: Removed the <<< 12 shifts to keep the numerators as true integers
                    case (step)
                         0: numer_sig <= C00; 
                         1: numer_sig <= C01;
                         2: numer_sig <= C02; 
                         3: numer_sig <= C11;
                         4: numer_sig <= C12; 
                         5: numer_sig <= C22;
                    endcase

                    if (wait_cnt == 5) begin // Divider Latency of 4
                        cov_out[step] <= quotient_sig;
                        wait_cnt <= 0;
                        if (step == 5) state <= DONE;
                        else step <= step + 1;
                    end else wait_cnt <= wait_cnt + 1;
                end

                DONE: begin
                    inv_vld <= 1'b1;
                    state   <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule