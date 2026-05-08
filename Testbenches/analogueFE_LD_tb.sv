`timescale 1ns / 1ps

module tb_analogue_front_end;

    // Clock and Reset Signals
    logic clk50;
    logic rst_n;
    logic start_acq;

    // DUT Outputs
    logic  [16:0] sample_out;
    logic sample_vld;

    // File IO Variables
    integer file_in;
    integer scan_result;
    logic [11:0] data_ch0, data_ch1, data_ch2, data_ch3;

    // Instantiate the DUT (Device Under Test)
    analogue_front_end dut (
        .clk50(clk50),
        .rst_n(rst_n),
        .start_acq(start_acq),
        .sample_out(sample_out),
        .sample_vld(sample_vld)
    );

    // Generate 50 MHz Clock (20 ns period)
    initial begin
        clk50 = 0;
        forever #10 clk50 = ~clk50;
    end

    // Testbench Stimulus
    initial begin
        // Initialize Inputs
        rst_n = 0;
        start_acq = 0;
        
        // Because we are mocking the ADC and PLL, we force the PLL locked signal high
        // This ensures the DUT state machine comes out of reset
        force dut.pll_locked = 1'b1;
        force dut.raw_adc_valid = 1'b0;
        force dut.raw_adc_data = 12'd0;
        force dut.adc_channel = 5'd0;

        // Open the text file you created
        file_in = $fopen("C:/FPGA_Projects/GMM/data/Inc3Pass1_testbench.txt", "r");
        if (file_in == 0) begin
            $display("FATAL ERROR: Could not open Inc3Pass1_testbench.txt");
            $stop;
        end

        // Release Reset
        #50;
        rst_n = 1;
        #20;
        
        // Trigger the ADC to start sampling
        start_acq = 1;

        // Process File Data Line by Line
        while (!$feof(file_in)) begin
            // Read 4 integer columns from the file
            scan_result = $fscanf(file_in, "%d %d %d %d\n", data_ch0, data_ch1, data_ch2, data_ch3);
            
            if (scan_result == 4) begin
                
                // Stream the 4 channels back-to-back, asserting valid
                // Channel 0
                force dut.raw_adc_valid = 1'b1;
                force dut.adc_channel   = 5'd0;
                force dut.raw_adc_data  = data_ch0;
                @(posedge clk50);
                
                // Channel 1
                force dut.adc_channel   = 5'd1;
                force dut.raw_adc_data  = data_ch1;
                @(posedge clk50);
                
                // Channel 2
                force dut.adc_channel   = 5'd2;
                force dut.raw_adc_data  = data_ch2;
                @(posedge clk50);
                
                // Channel 3
                force dut.adc_channel   = 5'd3;
                force dut.raw_adc_data  = data_ch3;
                @(posedge clk50);
                
                // End of Avalon stream
                force dut.raw_adc_valid = 1'b0;
                
                // Emulate a 1 MSPS ADC (1 microsecond delay = 50 clock cycles at 50MHz)
                // We already used 4 clock cycles to stream the data, so wait 46 more.
                repeat(46) @(posedge clk50);
            end
        end

        $display("Testbench Completed: End of data file reached.");
        $fclose(file_in);
        $stop;
    end

    // Output Monitoring
    always @(posedge clk50) begin
        // Monitor when the CORDIC is triggered to see the results
        if (sample_vld) begin
            // Wait a few cycles for CORDIC pipeline depth (Adjust based on IP settings)
            // For now, we print exactly when it's ready.
            $display("Time: %0t ns | Euclidean Output: %d", $time, sample_out);
        end
    end

endmodule
	 