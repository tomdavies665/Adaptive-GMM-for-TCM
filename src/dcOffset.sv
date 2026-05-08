// This file is to remove the DC Offset from the adc
// To prevent Bin 0 of FFT dominating
// 
// 1. Caldulate the time mean, also used for feature extraction
// 2. Save the inputs to a FIFO
// 3. Subtract the mean from the outputs, reading from the FIFO
// 4. Output samples with DC offset applied in input order to FFT

// This file is to remove the DC Offset from the adc
// To prevent Bin 0 of FFT dominating
// 
// 1. Calculate the time mean, also used for feature extraction
// 2. Save the inputs to a FIFO
// 3. Subtract the mean from the outputs, reading from the FIFO
// 4. Output samples with DC offset applied in input order to FFT
//
// This takes 1024 samples and means them and then streams them out taking 1024 cycles
// As effective sample rate is 50 ksps, 1 sample is dropped as only 1000 cycles between samples
// This can be fixed later, however window overlap would be better as data aquisition is much quicker


module dc_offset
#(
    parameter DATA_DEPTH = 1024,
    parameter DATA_WIDTH = 14
)
(
    input  logic                            clk50,      // Main system clock
    input  logic                            rst_n,      // Global reset
    
    // --- Inputs from Analogue Front End ---
    input  logic                            valid_in,   
    input  logic [DATA_WIDTH-1:0]           data_in,    // Unsigned CORDIC magnitude
    
    // --- Outputs to FFT ---
    output logic signed [DATA_WIDTH:0]      dout,       // +1 bit to handle signed subtraction
    output logic signed [DATA_WIDTH:0]      time_mean,
    output logic                            valid_out,  // Required to trigger FFT wrapper
    output logic                            sop,
    output logic                            eop
);

    // Calculate the number of bits needed to count to DATA_DEPTH
    localparam COUNT_WIDTH = $clog2(DATA_DEPTH);
    // Accumulator needs enough bits to prevent overflow: 14 bits + log2(1024) = 24 bits
    localparam ACCUM_WIDTH = DATA_WIDTH + COUNT_WIDTH; 
    
    // Internal Signals
    logic [ACCUM_WIDTH-1:0] accum_sum;
    logic [COUNT_WIDTH-1:0] in_count;
    logic [COUNT_WIDTH-1:0] out_count;
    
    // FIFO signals
    logic                  fifo_wr;
    logic                  fifo_rd;
    logic [DATA_WIDTH-1:0] fifo_q;
    logic                  fifo_empty;
    
    // State Machine
    typedef enum logic [1:0] {ACCUM, CALC, STREAM} state_t;
    state_t state;

    // --- FIFO Instantiation (Altera SCFIFO) ---
    // Uses "Show-ahead" mode so data is ready on the same clock cycle rdreq is asserted
    dc_offset_fifo	dc_offset_fifo_inst (
		.clock ( clk50 ),
		.data ( data_in ),
		.rdreq ( fifo_rd ),
		.sclr ( ~rst_n ),
		.wrreq ( fifo_wr ),
		.empty ( fifo_empty),
		.full (  ),
		.q ( fifo_q ),
		.usedw (  )
	);

    // FIFO Control Logic
    assign fifo_wr = (state == ACCUM) && valid_in;
    assign fifo_rd = (state == STREAM) && !fifo_empty;

    // --- Main State Machine ---
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            state      <= ACCUM;
            accum_sum  <= '0;
            in_count   <= '0;
            out_count  <= '0;
            time_mean  <= '0;
            dout       <= '0;
            valid_out  <= 1'b0;
            sop        <= 1'b0;
            eop        <= 1'b0;
        end else begin
            // Default strobes (pulse for 1 clock cycle)
            valid_out <= 1'b0;
            sop       <= 1'b0;
            eop       <= 1'b0;
            
            case (state)
                // Stage 1: Gather 1024 samples and accumulate the sum
                ACCUM: begin
                    if (valid_in) begin
                        accum_sum <= accum_sum + data_in;
                        in_count  <= in_count + 1'b1;
                        
                        if (in_count == DATA_DEPTH - 1) begin
                            state <= CALC;
                        end
                    end
                end
                
                // Stage 2: Calculate Mean
                CALC: begin
                    // Shift right by COUNT_WIDTH (10 bits for 1024)
                    time_mean <= $signed({1'b0, accum_sum[ACCUM_WIDTH-1 : COUNT_WIDTH]});
                    
                    accum_sum <= '0; // Reset accumulator for the next frame
                    in_count  <= '0;
                    state     <= STREAM;
                end
                
                // Stage 3: Read from FIFO, subtract mean, stream to FFT
                STREAM: begin
                    if (fifo_rd) begin
                        valid_out <= 1'b1;
                        
                        // Convert unsigned FIFO data to signed, then subtract mean
                        dout <= $signed({1'b0, fifo_q}) - time_mean;
                        
                        out_count <= out_count + 1'b1;
                        
                        // Set Avalon Streaming packet boundaries
                        if (out_count == 0) sop <= 1'b1;
                        
                        if (out_count == DATA_DEPTH - 1) begin
                            eop       <= 1'b1;
                            out_count <= '0;
                            state     <= ACCUM; // Return to gathering the next frame
                        end
                    end
                end
                
                default: state <= ACCUM;
            endcase
        end
    end

endmodule
	
	
	
