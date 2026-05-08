`timescale 1ns / 1ps

module analogueFrontEnd_tb;

    // 1. Signals for the DUT
    logic clk50;
    logic rst_n;
    logic start_acq;
    
    // --- UPDATED: 14-bit unsigned output to match the new CORDIC magnitude output ---
    logic [13:0] sample_out; 
    logic sample_vld;

    // 2. DUT Instantiation
    analogue_front_end dut (
        .clk50      (clk50),      
        .rst_n      (rst_n),      
        .start_acq  (start_acq),  
        .sample_out (sample_out), 
        .sample_vld (sample_vld)  
    );

    // 3. Clock Generation
    always #10 clk50 = ~clk50; // Generate 50MHz clock

    // 4. Tasks
    task init();
        clk50 = 0;
        rst_n = 0;
        start_acq = 0;
        force dut.pll_locked = 1'b1;
    endtask
     
    task reset_release();
        repeat(5) @(posedge clk50);
        rst_n = 1;
        $display("[%0t] Reset Released & PLL Forced Locked", $time);
    endtask
     
    task send_adc_sample(input logic [4:0] channel, input logic [11:0] data);
        @(posedge clk50);
        force dut.adc_channel   = channel;
        force dut.raw_adc_data  = data;
        force dut.raw_adc_valid = 1'b1;      
        
        @(posedge clk50);
        force dut.raw_adc_valid = 1'b0;
        
        repeat(2) @(posedge clk50);
    endtask
    
    // --- Continuous ADC Emulator ---
    int sample_count = 0;
    initial begin
        forever begin
            @(posedge clk50);
            
            // Only send data if the acquisition signal is active!
            if (start_acq) begin
                case (sample_count)
                    0: begin // Test 1: Both diffs = 0
                        send_adc_sample(5'd0, 12'd2048);
                        send_adc_sample(5'd1, 12'd2048);
                        send_adc_sample(5'd2, 12'd2048);
                        send_adc_sample(5'd3, 12'd2048);
                    end
                    1: begin // Test 2: Pair 1 = +1000, Pair 2 = 0
                        send_adc_sample(5'd0, 12'd3048);
                        send_adc_sample(5'd1, 12'd2048);
                        send_adc_sample(5'd2, 12'd2048);
                        send_adc_sample(5'd3, 12'd2048);
                    end
                    2: begin // Test 3: Pair 1 = 0, Pair 2 = +1000
                        send_adc_sample(5'd0, 12'd2048);
                        send_adc_sample(5'd1, 12'd2048);
                        send_adc_sample(5'd2, 12'd3048);
                        send_adc_sample(5'd3, 12'd2048);
                    end
                    3: begin // Test 4: Pair 1 = +1000, Pair 2 = +1000
                        send_adc_sample(5'd0, 12'd3048);
                        send_adc_sample(5'd1, 12'd2048);
                        send_adc_sample(5'd2, 12'd3048);
                        send_adc_sample(5'd3, 12'd2048);
                    end
                    4: begin // Test 5: Pair 1 = -1000, Pair 2 = -1000
                        send_adc_sample(5'd0, 12'd1048);
                        send_adc_sample(5'd1, 12'd2048);
                        send_adc_sample(5'd2, 12'd1048);
                        send_adc_sample(5'd3, 12'd2048);
                    end
                endcase
                
                // Cycle through the 5 test cases
                if (sample_count < 4) begin
                    sample_count++;
                end else begin
                    sample_count = 0; 
                end
            end
        end
    end

    // 5. Main Test Sequence
    initial begin
        $dumpfile("afe_waves.vcd");
        $dumpvars(0, analogueFrontEnd_tb);
        
        init();
        reset_release();

        repeat(5) @(posedge clk50);

        // --- TEST 1: Turn ON Acquisition ---
        $display("[%0t] TEST 1: Asserting start_acq (ON)...", $time);
        @(posedge clk50);
        start_acq = 1; 

        // Let it run for a long time to pump LOTS of data through
        #5000; 

        // --- TEST 2: Turn OFF Acquisition ---
        $display("[%0t] TEST 2: De-asserting start_acq (OFF)...", $time);
        @(posedge clk50);
        start_acq = 0; 

        // Wait to prove the data stops flowing
        #1500;

        // --- TEST 3: Turn ON Acquisition Again ---
        $display("[%0t] TEST 3: Asserting start_acq (ON AGAIN)...", $time);
        @(posedge clk50);
        start_acq = 1;

        #3000;

        $display("[%0t] Simulation Finished.", $time);
        $stop;
    end

    // 6. Internal Automatic Checkers
    real v1, v2, expected_mag;

    always @(posedge clk50) begin
        if (dut.diff1_rx) begin
            $display("[%0t] INTERNAL: Diff Pair 1 Calculated! Raw Diff: %0d", $time, $signed(dut.diff_pair_1));
        end
        if (dut.diff2_rx) begin
            $display("[%0t] INTERNAL: Diff Pair 2 Calculated! Raw Diff: %0d", $time, $signed(dut.diff_pair_2));
        end
        
        // --- UPDATED: Watch the Output of the CORDIC ---
        if (sample_vld) begin
            // 1. Get the raw integer differentials
            v1 = $itor($signed(dut.diff_pair_1));
            v2 = $itor($signed(dut.diff_pair_2));

            // 2. Calculate the expected Euclidean magnitude
            // Note: The CORDIC algorithm naturally multiplies the output by ~1.64676
            expected_mag = $sqrt((v1 * v1) + (v2 * v2)) * 1.64676;

            // 3. Print the results for comparison
            $display("---------------------------------------------------------");
            $display("[%0t] CORDIC EUCLIDEAN DATA READY:", $time);
            $display("   -> Diff Pair 1  : %0d Counts", $signed(dut.diff_pair_1));
            $display("   -> Diff Pair 2  : %0d Counts", $signed(dut.diff_pair_2));
            $display("   -> Expected Mag : %f Counts (Including 1.647 CORDIC Gain)", expected_mag);
            $display("   -> ACTUAL MAG   : %0d Counts", sample_out);
            $display("---------------------------------------------------------");
        end
    end

endmodule
