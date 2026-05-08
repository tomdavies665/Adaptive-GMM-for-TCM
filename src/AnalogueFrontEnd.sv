// Author: Tom Davies
// This file handles the analogue front end.
// The PLL creates a 2 MHz clock needed for the adc
// The ADC uses Channel 1, samples at 200 KSPS, 
// A basic state machine is used to control the adc with Avalon sequencer
// Channels 0 to 3 are used where channel 0 is dedicated ADC pin
// This calculates the differential of the two wires.
// The CORDIC IP is used to get the ecludian of the two differentials
// This takes 2 clock cycles to complete
//
//  OUTPUT: 14 Unsigned magnitude of the differential signals

module analogue_front_end  (
    input  logic        clk50,           // Main system clock
    input  logic        rst_n,           // Global reset
    input  logic        start_acq,       // Trigger to start ADC sampling
    output logic [13:0] sample_out,      // 14-bit output to account for overflow
    output logic        sample_vld       // Strobe: High for 1 clock when data is ready for GMM
);
    // --- ADC Register Map  ---
    localparam ADC_CSR_ADDR   = 1'b0;          // Control and Status Register
    localparam ADC_START_CMD  = 32'h0000_0001; // Bit 0 starts the sequence
    
    // Internal signals
    logic          pll_clk2;
    logic          pll_locked;
    logic [11:0]   raw_adc_data;
    logic          raw_adc_valid;
    logic          adc_write_pulse;
    logic [4:0]    adc_channel;                        
    
    // Registers for channel data
    logic [11:0]   ch0_data, ch1_data;           // Differential Pair 1
    logic [11:0]   ch2_data, ch3_data;           // Differential Pair 2
    logic          ch0_rx, ch1_rx;               // Recieved Flags D1
    logic          ch2_rx, ch3_rx;               // Recieved Flags D2
    
    // Output Differential results (13-bit to handle signed subtraction)
    // Result = Channel_A - Channel_B
    logic signed [12:0] diff_pair_1, diff_pair_2;
    logic diff1_rx, diff2_rx; //Recieve Flags
    
    logic ecludian_ready;   
    logic [13:0] raw_cordic_mag; // Unsigned 14 bit value, accounting for bit growth due scaling of CORDIC by 1.67
    
    // --- PLL Instantiation ---
    // Converts 50MHz to the 10MHz required by the MAX 10 ADC IP
    pll pll_2 (
        .areset (!rst_n), // ALtera PLLs require Active-High reset
        .inclk0 (clk50),
        .c0     (pll_clk2),
        .locked (pll_locked)
    );
    
    // --- ADC Instantiation (Altera Modular ADC) ---
    adc adc_0 (
        .clk_clk                              (clk50),
        .reset_reset_n                        (pll_locked),
        .modular_adc_0_adc_pll_locked_export  (pll_locked),
        .modular_adc_0_adc_pll_clock_clk      (pll_clk2),
        
        // Avalon Sequencer Control (Starts the ADC)
        .modular_adc_0_sequencer_csr_address  (ADC_CSR_ADDR),
        .modular_adc_0_sequencer_csr_read     (1'b0),
        .modular_adc_0_sequencer_csr_write    (adc_write_pulse),
        .modular_adc_0_sequencer_csr_writedata(ADC_START_CMD), // Start command
        .modular_adc_0_sequencer_csr_readdata (), // Empty parens are fine
        
        // Avalon Streaming Response (Data coming out)
        .modular_adc_0_response_valid         (raw_adc_valid),
        .modular_adc_0_response_data          (raw_adc_data),
        .modular_adc_0_response_channel       (adc_channel),
        .modular_adc_0_response_startofpacket (),
        .modular_adc_0_response_endofpacket   ()
    );
    
    // --- ADC Control State Machine ---
    typedef enum logic [1:0] {IDLE, START, WAIT} state_t;
    state_t state;
    
    // Counter to stretch the Avalon write pulse
    logic [2:0] pulse_counter;

    always_ff @(posedge clk50 or negedge pll_locked) begin
        if (!pll_locked) begin
            state           <= IDLE;
            adc_write_pulse <= 1'b0;
            pulse_counter   <= 3'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (start_acq) begin
                        state           <= START;
                        adc_write_pulse <= 1'b1; // Trigger first conversion
                        pulse_counter   <= 3'b0; // Reset counter
                    end
                end

                START: begin
                    // Hold the write pulse high for 4 clock cycles so the Avalon bus catches it
                    if (pulse_counter == 3'd3) begin
                        adc_write_pulse <= 1'b0; // Clear pulse
                        state           <= WAIT;
                    end else begin
                        pulse_counter   <= pulse_counter + 1'b1;
                    end
                end

                WAIT: begin
                    if (raw_adc_valid) begin
                        if (start_acq) begin
                            // LOOP BACK: Re-trigger immediately for continuous sampling
                            state           <= START;
                            adc_write_pulse <= 1'b1;
                            pulse_counter   <= 3'b0;
                        end else begin
                            // STOP: User de-asserted start_acq
                            state           <= IDLE;
                        end
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
    
    // Channel sorter, when valid data comes out, sends to correct register
    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            {ch0_rx, ch1_rx, ch2_rx, ch3_rx} <= 4'b0; // Reset Status Flags
            {diff_pair_1, diff_pair_2}       <= 26'h0;
            {diff1_rx, diff2_rx}             <= 2'b0;
        end else begin
            // DEFAULT STATE: Reset the pulse every clock cycle
            diff1_rx <= 1'b0;
            diff2_rx <= 1'b0;
            
            // Acquire and Flag
            if (raw_adc_valid) begin                
                case(adc_channel)
                    // adc_channel is 5 bits wide, see ADC datasheet of meaning
                    5'd0: begin ch0_data <= raw_adc_data; ch0_rx <= 1'b1; end                           
                    5'd1: begin ch1_data <= raw_adc_data; ch1_rx <= 1'b1; end                   
                    5'd2: begin ch2_data <= raw_adc_data; ch2_rx <= 1'b1; end                   
                    5'd3: begin ch3_data <= raw_adc_data; ch3_rx <= 1'b1; end
                    default: ;
                endcase
            end
                
            // 2. Process Pair 1
            if (ch0_rx && ch1_rx) begin
                 diff_pair_1 <= $signed({1'b0, ch0_data}) - $signed({1'b0, ch1_data});
                 diff1_rx <= 1'b1;
                 ch0_rx <= 1'b0; // Reset flags
                 ch1_rx <= 1'b0;
            end
            
            // 3. Process Pair 2
            if (ch2_rx && ch3_rx) begin
                 diff_pair_2 <= $signed({1'b0, ch2_data}) - $signed({1'b0, ch3_data});
                 diff2_rx <= 1'b1;
                 ch2_rx <= 1'b0; // Reset channel flags
                 ch3_rx <= 1'b0;
            end             
        end
    end
    
    // Euclidean of differential pairs
    // CORDIC IP used to efficiently take the euclidean
    logic [10:0] dummy_q;
    
    cordic adc_mag (
        .areset (!rst_n),           // areset.reset
        .clk    (clk50),            //    clk.clk
        .q      (dummy_q),          //      q.q
        .r      (raw_cordic_mag),   //      r.r
        .x      (diff_pair_1),      //      x.x
        .y      (diff_pair_2),      //      y.y
        .en     (1'b1)              //     en.en
    );
    
    // Logic to control the Euclidean and pipeline delay
    logic diff1_ready_flag;          
    logic [2:0] valid_shift_reg;     

    always_ff @(posedge clk50 or negedge rst_n) begin
        if (!rst_n) begin
            diff1_ready_flag <= 1'b0;
            valid_shift_reg  <= 3'b0;
            sample_vld       <= 1'b0; 
            sample_out       <= 14'd0; // Reset the output
        end else begin
            // 1. Shift the delay line forward every clock cycle
            valid_shift_reg <= {valid_shift_reg[1:0], 1'b0};
            
            // The top-level output valid strobe goes high when the '1' reaches the end
            sample_vld <= valid_shift_reg[2]; 

            // CATCH AND HOLD THE DATA:
            // Only update the output when the pipeline delay says the data is valid
            if (valid_shift_reg[2]) begin
                sample_out <= raw_cordic_mag;
            end

            // 2. Catch the first valid scaled pulse
            if (diff1_rx) begin
                diff1_ready_flag <= 1'b1;
            end

            // 3. When the second valid scaled pulse arrives, inject a '1'
            if (diff2_rx && diff1_ready_flag) begin
                valid_shift_reg[0] <= 1'b1;  
                diff1_ready_flag   <= 1'b0;  
            end
        end
    end

endmodule
	 
	 