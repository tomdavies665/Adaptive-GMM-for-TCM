`timescale 1ns / 1ps

module tb_adcScale;

    // Signals to connect to the module
    logic               clk50;
    logic               rst_n;
    logic               valid_in;
    logic signed [12:0] data_in;
    
    logic signed [17:0] data_out;
    logic               sample_vld;

    // Instantiate your module (Device Under Test)
    adcScale dut (
        .clk50(clk50), 
        .rst_n(rst_n), 
        .valid_in(valid_in), 
        .data_in(data_in), 
        .data_out(data_out), 
        .sample_vld(sample_vld)
    );

    // Generate 50 MHz Clock (20ns period -> toggles every 10ns)
    always #10 clk50 = ~clk50;

    initial begin
        // Setup waveform dumping for GTKWave or ModelSim
        $dumpfile("adc_waves.vcd");
        $dumpvars(0, tb_adcScale);

        // 1. Initialize Inputs
        clk50    = 0;
        rst_n    = 0;
        valid_in = 0;
        data_in  = 0;

        // 2. Apply Reset
        #50; 
        rst_n = 1; // Release active-low reset
        #30;       // Wait a bit to align with clock edges

        // 3. Run Test Cases using the task below
        // Test 1: Zero input -> Should output 0
        send_adc_data(13'sd0);

        // Test 2: Max positive (+4095) -> Should output ~54067 (which is 3.3 in Q3.14)
        send_adc_data(13'sd4095);

        // Test 3: Mid-point (+2048) -> Should output ~27033 (which is 1.65 in Q3.14)
        send_adc_data(13'sd2048);

        // Test 4: Min negative (-4096) -> Should output ~ -54067 (which is -3.3 in Q3.14)
        send_adc_data(-13'sd4096);

        // Let the simulation run for a few more clocks then stop
        #100;
        $stop;
    end

    // A helpful task to pulse the valid signal and inject data
    task send_adc_data(input logic signed [12:0] test_val);
        begin
            data_in  = test_val;
            valid_in = 1'b1;
            #20; // Hold for 1 clock cycle (20ns)
            valid_in = 1'b0;
            #60; // Wait 3 clock cycles to observe the pipelined output
        end
    endtask

endmodule