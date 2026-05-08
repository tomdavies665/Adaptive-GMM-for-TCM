// dummies.sv - Updated to match all connections in AnalogueFrontEnd.sv

module pll (
    input  logic areset,
    input  logic inclk0,
    output logic c0,
    output logic locked
);
    assign c0 = inclk0; 
    assign locked = 1'b1; // Default to locked so FSM moves
endmodule

module adc (
    input  logic clk_clk,
    input  logic reset_reset_n,
    input  logic modular_adc_0_adc_pll_locked_export,
    input  logic modular_adc_0_adc_pll_clock_clk,
    
    // Control Ports
    input  logic modular_adc_0_sequencer_csr_address,
    input  logic modular_adc_0_sequencer_csr_read,
    input  logic modular_adc_0_sequencer_csr_write,      // MUST BE 1 BIT
    input  logic [31:0] modular_adc_0_sequencer_csr_writedata,
    output logic [31:0] modular_adc_0_sequencer_csr_readdata, // ADD THIS
    
    // Data Ports
    output logic modular_adc_0_response_valid,
    output logic [4:0]  modular_adc_0_response_channel,
    output logic [11:0] modular_adc_0_response_data,
    output logic modular_adc_0_response_startofpacket,
    output logic modular_adc_0_response_endofpacket
);
    assign modular_adc_0_sequencer_csr_readdata = 32'h0;
    // We leave the others floating because the TB 'forces' them anyway
endmodule