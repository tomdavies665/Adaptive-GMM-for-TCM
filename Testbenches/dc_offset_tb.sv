`timescale 1ns/1ps

module dc_offset_tb();

    // Parameters
    parameter DATA_DEPTH = 1024;
    parameter DATA_WIDTH = 14;

    // Testbench Signals
    logic                            clk50;
    logic                            rst_n;
    logic                            valid_in;
    logic [DATA_WIDTH-1:0]           data_in;
    
    // Outputs from DUT
    logic signed [DATA_WIDTH:0]      dout;
    logic signed [DATA_WIDTH:0]      time_mean;
    logic                            valid_out;
    logic                            sop;
    logic                            eop;

    // --- Instantiate the Device Under Test (DUT) ---
    dc_offset #(
        .DATA_DEPTH(DATA_DEPTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dut (
        .clk50     (clk50),
        .rst_n     (rst_n),
        .valid_in  (valid_in),
        .data_in   (data_in),
        .dout      (dout),
        .time_mean (time_mean),
        .valid_out (valid_out),
        .sop       (sop),
        .eop       (eop)
    );

    // --- Clock Generation (50 MHz) ---
    initial begin
        clk50 = 1'b0;
        forever #10 clk50 = ~clk50; // 20ns period = 50MHz
    end

    // --- Main Stimulus Block ---
    initial begin
        // 1. Initialize Inputs
        rst_n    = 1'b0;
        valid_in = 1'b0;
        data_in  = '0;

        // 2. Hold reset for a few clock cycles
        #50;
        rst_n = 1'b1;
        #50;

        $display("--- Starting Frame 1: Accumulation ---");
        
        // 3. Feed data 1 to 1024 into the module
        @(posedge clk50);
        for (int i = 1; i <= DATA_DEPTH; i++) begin
            valid_in <= 1'b1;
            data_in  <= i[DATA_WIDTH-1:0];
            @(posedge clk50);
        end
        
        // Stop feeding data
        valid_in <= 1'b0;
        data_in  <= '0;

        $display("--- Accumulation Complete. Waiting for Streaming ---");

        // 4. Wait for the streaming state to finish
        // It takes 1 clock cycle to calculate, and 1024 cycles to stream out.
        #(DATA_DEPTH * 20 + 200);

        $display("--- Simulation Complete ---");
        $stop; // Pause the simulation
    end

    // --- Monitor Data Output ---
    int out_counter = 0;
    always_ff @(posedge clk50) begin
        if (valid_out) begin
            out_counter++;
            if (out_counter <= 5 || out_counter >= DATA_DEPTH - 4) begin
                $display("Time: %0t | Out_Count: %0d | time_mean: %0d | data_out: %0d | SOP: %b | EOP: %b", 
                         $time, out_counter, time_mean, dout, sop, eop);
            end
            if (out_counter == DATA_DEPTH) begin
                out_counter = 0; // Reset for potential next frames
            end
        end
    end

endmodule