// Author: Tom Davies
// This Model is to scale the 13 bit signed differential signal between -3.3 and 3.3V
// it Scales 3.3/4095 * 2^24, this is so that it can do fixed point arithmatic
// QS3.14 is chosen as it fits in a single 18 by 18 multiplier
// To get in that format a bit slice happens, dropping the bottom fractional bits

module adcScale (
    input  logic               clk50,      // Main system clock
    input  logic               rst_n,      // Global reset
    input  logic               valid_in,
    input  logic signed [12:0] data_in,    // Differential value
    output logic signed [17:0] data_out,   // 17-bit output
    output logic               sample_vld  // Strobe
);

    // Scale constant: (3.3 / 4095) * 2^24 = ~13520
    localparam signed [15:0] SCALER = 16'sd13520; 

    // Internal registers
    logic signed [28:0] mult_product;
    logic               valid_d1;

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            mult_product <= 29'd0;
            data_out     <= 18'd0;
            valid_d1     <= 1'b0; 
            sample_vld   <= 1'b0;
        end else begin
            // --- PIPELINE STAGE 1: Multiplication ---
            valid_d1 <= valid_in; 
            
            if (valid_in) begin
                mult_product <= data_in * SCALER;
            end

            // --- PIPELINE STAGE 2: Bit Shift & Output Latch ---
            // The output valid strobe now fires exactly when data_out updates
            sample_vld <= valid_d1; 
            
            if (valid_d1) begin
                data_out <= mult_product[27:10];
            end
        end
    end

endmodule