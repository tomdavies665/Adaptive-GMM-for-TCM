// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

// DATE "03/24/2026 11:45:50"

// 
// Device: Altera 10M50DAF484C6GES Package FBGA484
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module adc (
	clk_clk,
	modular_adc_0_adc_pll_clock_clk,
	modular_adc_0_adc_pll_locked_export,
	modular_adc_0_response_valid,
	modular_adc_0_response_channel,
	modular_adc_0_response_data,
	modular_adc_0_response_startofpacket,
	modular_adc_0_response_endofpacket,
	modular_adc_0_sequencer_csr_address,
	modular_adc_0_sequencer_csr_read,
	modular_adc_0_sequencer_csr_write,
	modular_adc_0_sequencer_csr_writedata,
	modular_adc_0_sequencer_csr_readdata,
	reset_reset_n)/* synthesis synthesis_greybox=0 */;
input 	clk_clk;
input 	modular_adc_0_adc_pll_clock_clk;
input 	modular_adc_0_adc_pll_locked_export;
output 	modular_adc_0_response_valid;
output 	[4:0] modular_adc_0_response_channel;
output 	[11:0] modular_adc_0_response_data;
output 	modular_adc_0_response_startofpacket;
output 	modular_adc_0_response_endofpacket;
input 	modular_adc_0_sequencer_csr_address;
input 	modular_adc_0_sequencer_csr_read;
input 	modular_adc_0_sequencer_csr_write;
input 	[31:0] modular_adc_0_sequencer_csr_writedata;
output 	[31:0] modular_adc_0_sequencer_csr_readdata;
input 	reset_reset_n;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \modular_adc_0|control_internal|u_control_fsm|rsp_valid~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_channel[0]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_channel[1]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_channel[2]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_channel[3]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_channel[4]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[0]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[1]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[2]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[3]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[4]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[5]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[6]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[7]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[8]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[9]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[10]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_data[11]~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_sop~q ;
wire \modular_adc_0|control_internal|u_control_fsm|rsp_eop~q ;
wire \modular_adc_0|sequencer_internal|u_seq_csr|readdata[0]~q ;
wire \modular_adc_0|sequencer_internal|u_seq_csr|readdata[1]~q ;
wire \modular_adc_0|sequencer_internal|u_seq_csr|readdata[2]~q ;
wire \modular_adc_0|sequencer_internal|u_seq_csr|readdata[3]~q ;
wire \rst_controller|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out~q ;
wire \~GND~combout ;
wire \modular_adc_0_sequencer_csr_writedata[4]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[5]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[6]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[7]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[8]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[9]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[10]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[11]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[12]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[13]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[14]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[15]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[16]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[17]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[18]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[19]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[20]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[21]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[22]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[23]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[24]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[25]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[26]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[27]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[28]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[29]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[30]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[31]~input_o ;
wire \clk_clk~input_o ;
wire \modular_adc_0_sequencer_csr_read~input_o ;
wire \modular_adc_0_sequencer_csr_address~input_o ;
wire \reset_reset_n~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[0]~input_o ;
wire \modular_adc_0_sequencer_csr_write~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[1]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[2]~input_o ;
wire \modular_adc_0_sequencer_csr_writedata[3]~input_o ;
wire \modular_adc_0_adc_pll_locked_export~input_o ;
wire \modular_adc_0_adc_pll_clock_clk~input_o ;


adc_adc_modular_adc_0 modular_adc_0(
	.response_valid(\modular_adc_0|control_internal|u_control_fsm|rsp_valid~q ),
	.rsp_channel_0(\modular_adc_0|control_internal|u_control_fsm|rsp_channel[0]~q ),
	.rsp_channel_1(\modular_adc_0|control_internal|u_control_fsm|rsp_channel[1]~q ),
	.rsp_channel_2(\modular_adc_0|control_internal|u_control_fsm|rsp_channel[2]~q ),
	.rsp_channel_3(\modular_adc_0|control_internal|u_control_fsm|rsp_channel[3]~q ),
	.rsp_channel_4(\modular_adc_0|control_internal|u_control_fsm|rsp_channel[4]~q ),
	.rsp_data_0(\modular_adc_0|control_internal|u_control_fsm|rsp_data[0]~q ),
	.rsp_data_1(\modular_adc_0|control_internal|u_control_fsm|rsp_data[1]~q ),
	.rsp_data_2(\modular_adc_0|control_internal|u_control_fsm|rsp_data[2]~q ),
	.rsp_data_3(\modular_adc_0|control_internal|u_control_fsm|rsp_data[3]~q ),
	.rsp_data_4(\modular_adc_0|control_internal|u_control_fsm|rsp_data[4]~q ),
	.rsp_data_5(\modular_adc_0|control_internal|u_control_fsm|rsp_data[5]~q ),
	.rsp_data_6(\modular_adc_0|control_internal|u_control_fsm|rsp_data[6]~q ),
	.rsp_data_7(\modular_adc_0|control_internal|u_control_fsm|rsp_data[7]~q ),
	.rsp_data_8(\modular_adc_0|control_internal|u_control_fsm|rsp_data[8]~q ),
	.rsp_data_9(\modular_adc_0|control_internal|u_control_fsm|rsp_data[9]~q ),
	.rsp_data_10(\modular_adc_0|control_internal|u_control_fsm|rsp_data[10]~q ),
	.rsp_data_11(\modular_adc_0|control_internal|u_control_fsm|rsp_data[11]~q ),
	.response_startofpacket(\modular_adc_0|control_internal|u_control_fsm|rsp_sop~q ),
	.response_endofpacket(\modular_adc_0|control_internal|u_control_fsm|rsp_eop~q ),
	.readdata_0(\modular_adc_0|sequencer_internal|u_seq_csr|readdata[0]~q ),
	.readdata_1(\modular_adc_0|sequencer_internal|u_seq_csr|readdata[1]~q ),
	.readdata_2(\modular_adc_0|sequencer_internal|u_seq_csr|readdata[2]~q ),
	.readdata_3(\modular_adc_0|sequencer_internal|u_seq_csr|readdata[3]~q ),
	.altera_reset_synchronizer_int_chain_out(\rst_controller|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out~q ),
	.GND_port(\~GND~combout ),
	.clk_clk(\clk_clk~input_o ),
	.modular_adc_0_sequencer_csr_read(\modular_adc_0_sequencer_csr_read~input_o ),
	.modular_adc_0_sequencer_csr_address(\modular_adc_0_sequencer_csr_address~input_o ),
	.modular_adc_0_sequencer_csr_writedata_0(\modular_adc_0_sequencer_csr_writedata[0]~input_o ),
	.modular_adc_0_sequencer_csr_write(\modular_adc_0_sequencer_csr_write~input_o ),
	.modular_adc_0_sequencer_csr_writedata_1(\modular_adc_0_sequencer_csr_writedata[1]~input_o ),
	.modular_adc_0_sequencer_csr_writedata_2(\modular_adc_0_sequencer_csr_writedata[2]~input_o ),
	.modular_adc_0_sequencer_csr_writedata_3(\modular_adc_0_sequencer_csr_writedata[3]~input_o ),
	.modular_adc_0_adc_pll_locked_export(\modular_adc_0_adc_pll_locked_export~input_o ),
	.modular_adc_0_adc_pll_clock_clk(\modular_adc_0_adc_pll_clock_clk~input_o ));

adc_altera_reset_controller rst_controller(
	.altera_reset_synchronizer_int_chain_out(\rst_controller|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out~q ),
	.clk_clk(\clk_clk~input_o ),
	.reset_reset_n(\reset_reset_n~input_o ));

fiftyfivenm_lcell_comb \~GND (
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\~GND~combout ),
	.cout());
defparam \~GND .lut_mask = 16'h0000;
defparam \~GND .sum_lutc_input = "datac";

assign \clk_clk~input_o  = clk_clk;

assign \modular_adc_0_sequencer_csr_read~input_o  = modular_adc_0_sequencer_csr_read;

assign \modular_adc_0_sequencer_csr_address~input_o  = modular_adc_0_sequencer_csr_address;

assign \reset_reset_n~input_o  = reset_reset_n;

assign \modular_adc_0_sequencer_csr_writedata[0]~input_o  = modular_adc_0_sequencer_csr_writedata[0];

assign \modular_adc_0_sequencer_csr_write~input_o  = modular_adc_0_sequencer_csr_write;

assign \modular_adc_0_sequencer_csr_writedata[1]~input_o  = modular_adc_0_sequencer_csr_writedata[1];

assign \modular_adc_0_sequencer_csr_writedata[2]~input_o  = modular_adc_0_sequencer_csr_writedata[2];

assign \modular_adc_0_sequencer_csr_writedata[3]~input_o  = modular_adc_0_sequencer_csr_writedata[3];

assign \modular_adc_0_adc_pll_locked_export~input_o  = modular_adc_0_adc_pll_locked_export;

assign \modular_adc_0_adc_pll_clock_clk~input_o  = modular_adc_0_adc_pll_clock_clk;

assign modular_adc_0_response_valid = \modular_adc_0|control_internal|u_control_fsm|rsp_valid~q ;

assign modular_adc_0_response_channel[0] = \modular_adc_0|control_internal|u_control_fsm|rsp_channel[0]~q ;

assign modular_adc_0_response_channel[1] = \modular_adc_0|control_internal|u_control_fsm|rsp_channel[1]~q ;

assign modular_adc_0_response_channel[2] = \modular_adc_0|control_internal|u_control_fsm|rsp_channel[2]~q ;

assign modular_adc_0_response_channel[3] = \modular_adc_0|control_internal|u_control_fsm|rsp_channel[3]~q ;

assign modular_adc_0_response_channel[4] = \modular_adc_0|control_internal|u_control_fsm|rsp_channel[4]~q ;

assign modular_adc_0_response_data[0] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[0]~q ;

assign modular_adc_0_response_data[1] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[1]~q ;

assign modular_adc_0_response_data[2] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[2]~q ;

assign modular_adc_0_response_data[3] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[3]~q ;

assign modular_adc_0_response_data[4] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[4]~q ;

assign modular_adc_0_response_data[5] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[5]~q ;

assign modular_adc_0_response_data[6] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[6]~q ;

assign modular_adc_0_response_data[7] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[7]~q ;

assign modular_adc_0_response_data[8] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[8]~q ;

assign modular_adc_0_response_data[9] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[9]~q ;

assign modular_adc_0_response_data[10] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[10]~q ;

assign modular_adc_0_response_data[11] = \modular_adc_0|control_internal|u_control_fsm|rsp_data[11]~q ;

assign modular_adc_0_response_startofpacket = \modular_adc_0|control_internal|u_control_fsm|rsp_sop~q ;

assign modular_adc_0_response_endofpacket = \modular_adc_0|control_internal|u_control_fsm|rsp_eop~q ;

assign modular_adc_0_sequencer_csr_readdata[0] = \modular_adc_0|sequencer_internal|u_seq_csr|readdata[0]~q ;

assign modular_adc_0_sequencer_csr_readdata[1] = \modular_adc_0|sequencer_internal|u_seq_csr|readdata[1]~q ;

assign modular_adc_0_sequencer_csr_readdata[2] = \modular_adc_0|sequencer_internal|u_seq_csr|readdata[2]~q ;

assign modular_adc_0_sequencer_csr_readdata[3] = \modular_adc_0|sequencer_internal|u_seq_csr|readdata[3]~q ;

assign modular_adc_0_sequencer_csr_readdata[4] = gnd;

assign modular_adc_0_sequencer_csr_readdata[5] = gnd;

assign modular_adc_0_sequencer_csr_readdata[6] = gnd;

assign modular_adc_0_sequencer_csr_readdata[7] = gnd;

assign modular_adc_0_sequencer_csr_readdata[8] = gnd;

assign modular_adc_0_sequencer_csr_readdata[9] = gnd;

assign modular_adc_0_sequencer_csr_readdata[10] = gnd;

assign modular_adc_0_sequencer_csr_readdata[11] = gnd;

assign modular_adc_0_sequencer_csr_readdata[12] = gnd;

assign modular_adc_0_sequencer_csr_readdata[13] = gnd;

assign modular_adc_0_sequencer_csr_readdata[14] = gnd;

assign modular_adc_0_sequencer_csr_readdata[15] = gnd;

assign modular_adc_0_sequencer_csr_readdata[16] = gnd;

assign modular_adc_0_sequencer_csr_readdata[17] = gnd;

assign modular_adc_0_sequencer_csr_readdata[18] = gnd;

assign modular_adc_0_sequencer_csr_readdata[19] = gnd;

assign modular_adc_0_sequencer_csr_readdata[20] = gnd;

assign modular_adc_0_sequencer_csr_readdata[21] = gnd;

assign modular_adc_0_sequencer_csr_readdata[22] = gnd;

assign modular_adc_0_sequencer_csr_readdata[23] = gnd;

assign modular_adc_0_sequencer_csr_readdata[24] = gnd;

assign modular_adc_0_sequencer_csr_readdata[25] = gnd;

assign modular_adc_0_sequencer_csr_readdata[26] = gnd;

assign modular_adc_0_sequencer_csr_readdata[27] = gnd;

assign modular_adc_0_sequencer_csr_readdata[28] = gnd;

assign modular_adc_0_sequencer_csr_readdata[29] = gnd;

assign modular_adc_0_sequencer_csr_readdata[30] = gnd;

assign modular_adc_0_sequencer_csr_readdata[31] = gnd;

assign \modular_adc_0_sequencer_csr_writedata[4]~input_o  = modular_adc_0_sequencer_csr_writedata[4];

assign \modular_adc_0_sequencer_csr_writedata[5]~input_o  = modular_adc_0_sequencer_csr_writedata[5];

assign \modular_adc_0_sequencer_csr_writedata[6]~input_o  = modular_adc_0_sequencer_csr_writedata[6];

assign \modular_adc_0_sequencer_csr_writedata[7]~input_o  = modular_adc_0_sequencer_csr_writedata[7];

assign \modular_adc_0_sequencer_csr_writedata[8]~input_o  = modular_adc_0_sequencer_csr_writedata[8];

assign \modular_adc_0_sequencer_csr_writedata[9]~input_o  = modular_adc_0_sequencer_csr_writedata[9];

assign \modular_adc_0_sequencer_csr_writedata[10]~input_o  = modular_adc_0_sequencer_csr_writedata[10];

assign \modular_adc_0_sequencer_csr_writedata[11]~input_o  = modular_adc_0_sequencer_csr_writedata[11];

assign \modular_adc_0_sequencer_csr_writedata[12]~input_o  = modular_adc_0_sequencer_csr_writedata[12];

assign \modular_adc_0_sequencer_csr_writedata[13]~input_o  = modular_adc_0_sequencer_csr_writedata[13];

assign \modular_adc_0_sequencer_csr_writedata[14]~input_o  = modular_adc_0_sequencer_csr_writedata[14];

assign \modular_adc_0_sequencer_csr_writedata[15]~input_o  = modular_adc_0_sequencer_csr_writedata[15];

assign \modular_adc_0_sequencer_csr_writedata[16]~input_o  = modular_adc_0_sequencer_csr_writedata[16];

assign \modular_adc_0_sequencer_csr_writedata[17]~input_o  = modular_adc_0_sequencer_csr_writedata[17];

assign \modular_adc_0_sequencer_csr_writedata[18]~input_o  = modular_adc_0_sequencer_csr_writedata[18];

assign \modular_adc_0_sequencer_csr_writedata[19]~input_o  = modular_adc_0_sequencer_csr_writedata[19];

assign \modular_adc_0_sequencer_csr_writedata[20]~input_o  = modular_adc_0_sequencer_csr_writedata[20];

assign \modular_adc_0_sequencer_csr_writedata[21]~input_o  = modular_adc_0_sequencer_csr_writedata[21];

assign \modular_adc_0_sequencer_csr_writedata[22]~input_o  = modular_adc_0_sequencer_csr_writedata[22];

assign \modular_adc_0_sequencer_csr_writedata[23]~input_o  = modular_adc_0_sequencer_csr_writedata[23];

assign \modular_adc_0_sequencer_csr_writedata[24]~input_o  = modular_adc_0_sequencer_csr_writedata[24];

assign \modular_adc_0_sequencer_csr_writedata[25]~input_o  = modular_adc_0_sequencer_csr_writedata[25];

assign \modular_adc_0_sequencer_csr_writedata[26]~input_o  = modular_adc_0_sequencer_csr_writedata[26];

assign \modular_adc_0_sequencer_csr_writedata[27]~input_o  = modular_adc_0_sequencer_csr_writedata[27];

assign \modular_adc_0_sequencer_csr_writedata[28]~input_o  = modular_adc_0_sequencer_csr_writedata[28];

assign \modular_adc_0_sequencer_csr_writedata[29]~input_o  = modular_adc_0_sequencer_csr_writedata[29];

assign \modular_adc_0_sequencer_csr_writedata[30]~input_o  = modular_adc_0_sequencer_csr_writedata[30];

assign \modular_adc_0_sequencer_csr_writedata[31]~input_o  = modular_adc_0_sequencer_csr_writedata[31];

endmodule

module adc_adc_modular_adc_0 (
	response_valid,
	rsp_channel_0,
	rsp_channel_1,
	rsp_channel_2,
	rsp_channel_3,
	rsp_channel_4,
	rsp_data_0,
	rsp_data_1,
	rsp_data_2,
	rsp_data_3,
	rsp_data_4,
	rsp_data_5,
	rsp_data_6,
	rsp_data_7,
	rsp_data_8,
	rsp_data_9,
	rsp_data_10,
	rsp_data_11,
	response_startofpacket,
	response_endofpacket,
	readdata_0,
	readdata_1,
	readdata_2,
	readdata_3,
	altera_reset_synchronizer_int_chain_out,
	GND_port,
	clk_clk,
	modular_adc_0_sequencer_csr_read,
	modular_adc_0_sequencer_csr_address,
	modular_adc_0_sequencer_csr_writedata_0,
	modular_adc_0_sequencer_csr_write,
	modular_adc_0_sequencer_csr_writedata_1,
	modular_adc_0_sequencer_csr_writedata_2,
	modular_adc_0_sequencer_csr_writedata_3,
	modular_adc_0_adc_pll_locked_export,
	modular_adc_0_adc_pll_clock_clk)/* synthesis synthesis_greybox=0 */;
output 	response_valid;
output 	rsp_channel_0;
output 	rsp_channel_1;
output 	rsp_channel_2;
output 	rsp_channel_3;
output 	rsp_channel_4;
output 	rsp_data_0;
output 	rsp_data_1;
output 	rsp_data_2;
output 	rsp_data_3;
output 	rsp_data_4;
output 	rsp_data_5;
output 	rsp_data_6;
output 	rsp_data_7;
output 	rsp_data_8;
output 	rsp_data_9;
output 	rsp_data_10;
output 	rsp_data_11;
output 	response_startofpacket;
output 	response_endofpacket;
output 	readdata_0;
output 	readdata_1;
output 	readdata_2;
output 	readdata_3;
input 	altera_reset_synchronizer_int_chain_out;
input 	GND_port;
input 	clk_clk;
input 	modular_adc_0_sequencer_csr_read;
input 	modular_adc_0_sequencer_csr_address;
input 	modular_adc_0_sequencer_csr_writedata_0;
input 	modular_adc_0_sequencer_csr_write;
input 	modular_adc_0_sequencer_csr_writedata_1;
input 	modular_adc_0_sequencer_csr_writedata_2;
input 	modular_adc_0_sequencer_csr_writedata_3;
input 	modular_adc_0_adc_pll_locked_export;
input 	modular_adc_0_adc_pll_clock_clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \sequencer_internal|u_seq_ctrl|cmd_channel[1]~q ;
wire \sequencer_internal|u_seq_ctrl|cmd_channel[4]~q ;
wire \sequencer_internal|u_seq_ctrl|cmd_channel[0]~q ;
wire \control_internal|u_control_fsm|cmd_ready~q ;
wire \sequencer_internal|u_seq_ctrl|cmd_sop~q ;
wire \sequencer_internal|u_seq_ctrl|cmd_eop~q ;
wire \sequencer_internal|u_seq_ctrl|cmd_valid~q ;


adc_altera_modular_adc_control control_internal(
	.cmd_channel_1(\sequencer_internal|u_seq_ctrl|cmd_channel[1]~q ),
	.rsp_valid(response_valid),
	.rsp_channel_0(rsp_channel_0),
	.rsp_channel_1(rsp_channel_1),
	.rsp_channel_2(rsp_channel_2),
	.rsp_channel_3(rsp_channel_3),
	.rsp_channel_4(rsp_channel_4),
	.rsp_data_0(rsp_data_0),
	.rsp_data_1(rsp_data_1),
	.rsp_data_2(rsp_data_2),
	.rsp_data_3(rsp_data_3),
	.rsp_data_4(rsp_data_4),
	.rsp_data_5(rsp_data_5),
	.rsp_data_6(rsp_data_6),
	.rsp_data_7(rsp_data_7),
	.rsp_data_8(rsp_data_8),
	.rsp_data_9(rsp_data_9),
	.rsp_data_10(rsp_data_10),
	.rsp_data_11(rsp_data_11),
	.rsp_sop(response_startofpacket),
	.rsp_eop(response_endofpacket),
	.cmd_channel_4(\sequencer_internal|u_seq_ctrl|cmd_channel[4]~q ),
	.cmd_channel_0(\sequencer_internal|u_seq_ctrl|cmd_channel[0]~q ),
	.altera_reset_synchronizer_int_chain_out(altera_reset_synchronizer_int_chain_out),
	.cmd_ready(\control_internal|u_control_fsm|cmd_ready~q ),
	.cmd_sop(\sequencer_internal|u_seq_ctrl|cmd_sop~q ),
	.cmd_eop(\sequencer_internal|u_seq_ctrl|cmd_eop~q ),
	.cmd_valid(\sequencer_internal|u_seq_ctrl|cmd_valid~q ),
	.GND_port(GND_port),
	.clk_clk(clk_clk),
	.modular_adc_0_adc_pll_locked_export(modular_adc_0_adc_pll_locked_export),
	.modular_adc_0_adc_pll_clock_clk(modular_adc_0_adc_pll_clock_clk));

adc_altera_modular_adc_sequencer sequencer_internal(
	.cmd_channel_1(\sequencer_internal|u_seq_ctrl|cmd_channel[1]~q ),
	.readdata_0(readdata_0),
	.readdata_1(readdata_1),
	.readdata_2(readdata_2),
	.readdata_3(readdata_3),
	.cmd_channel_4(\sequencer_internal|u_seq_ctrl|cmd_channel[4]~q ),
	.cmd_channel_0(\sequencer_internal|u_seq_ctrl|cmd_channel[0]~q ),
	.altera_reset_synchronizer_int_chain_out(altera_reset_synchronizer_int_chain_out),
	.cmd_ready(\control_internal|u_control_fsm|cmd_ready~q ),
	.cmd_sop(\sequencer_internal|u_seq_ctrl|cmd_sop~q ),
	.cmd_eop(\sequencer_internal|u_seq_ctrl|cmd_eop~q ),
	.cmd_valid(\sequencer_internal|u_seq_ctrl|cmd_valid~q ),
	.clk_clk(clk_clk),
	.modular_adc_0_sequencer_csr_read(modular_adc_0_sequencer_csr_read),
	.modular_adc_0_sequencer_csr_address(modular_adc_0_sequencer_csr_address),
	.modular_adc_0_sequencer_csr_writedata_0(modular_adc_0_sequencer_csr_writedata_0),
	.modular_adc_0_sequencer_csr_write(modular_adc_0_sequencer_csr_write),
	.modular_adc_0_sequencer_csr_writedata_1(modular_adc_0_sequencer_csr_writedata_1),
	.modular_adc_0_sequencer_csr_writedata_2(modular_adc_0_sequencer_csr_writedata_2),
	.modular_adc_0_sequencer_csr_writedata_3(modular_adc_0_sequencer_csr_writedata_3));

endmodule

module adc_altera_modular_adc_control (
	cmd_channel_1,
	rsp_valid,
	rsp_channel_0,
	rsp_channel_1,
	rsp_channel_2,
	rsp_channel_3,
	rsp_channel_4,
	rsp_data_0,
	rsp_data_1,
	rsp_data_2,
	rsp_data_3,
	rsp_data_4,
	rsp_data_5,
	rsp_data_6,
	rsp_data_7,
	rsp_data_8,
	rsp_data_9,
	rsp_data_10,
	rsp_data_11,
	rsp_sop,
	rsp_eop,
	cmd_channel_4,
	cmd_channel_0,
	altera_reset_synchronizer_int_chain_out,
	cmd_ready,
	cmd_sop,
	cmd_eop,
	cmd_valid,
	GND_port,
	clk_clk,
	modular_adc_0_adc_pll_locked_export,
	modular_adc_0_adc_pll_clock_clk)/* synthesis synthesis_greybox=0 */;
input 	cmd_channel_1;
output 	rsp_valid;
output 	rsp_channel_0;
output 	rsp_channel_1;
output 	rsp_channel_2;
output 	rsp_channel_3;
output 	rsp_channel_4;
output 	rsp_data_0;
output 	rsp_data_1;
output 	rsp_data_2;
output 	rsp_data_3;
output 	rsp_data_4;
output 	rsp_data_5;
output 	rsp_data_6;
output 	rsp_data_7;
output 	rsp_data_8;
output 	rsp_data_9;
output 	rsp_data_10;
output 	rsp_data_11;
output 	rsp_sop;
output 	rsp_eop;
input 	cmd_channel_4;
input 	cmd_channel_0;
input 	altera_reset_synchronizer_int_chain_out;
output 	cmd_ready;
input 	cmd_sop;
input 	cmd_eop;
input 	cmd_valid;
input 	GND_port;
input 	clk_clk;
input 	modular_adc_0_adc_pll_locked_export;
input 	modular_adc_0_adc_pll_clock_clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \adc_inst|adcblock_instance|eoc ;
wire \adc_inst|adcblock_instance|clkout_adccore ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[0] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[1] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[2] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[3] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[4] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[5] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[6] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[7] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[8] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[9] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[10] ;
wire \adc_inst|adcblock_instance|wire_from_adc_dout[11] ;
wire \u_control_fsm|soc~q ;
wire \u_control_fsm|chsel[0]~q ;
wire \u_control_fsm|chsel[1]~q ;
wire \u_control_fsm|chsel[2]~q ;
wire \u_control_fsm|chsel[4]~q ;
wire \u_control_fsm|usr_pwd~_wirecell_combout ;


adc_altera_modular_adc_control_fsm u_control_fsm(
	.cmd_channel({cmd_channel_4,gnd,gnd,cmd_channel_1,cmd_channel_0}),
	.eoc(\adc_inst|adcblock_instance|eoc ),
	.clkout_adccore(\adc_inst|adcblock_instance|clkout_adccore ),
	.wire_from_adc_dout_0(\adc_inst|adcblock_instance|wire_from_adc_dout[0] ),
	.wire_from_adc_dout_1(\adc_inst|adcblock_instance|wire_from_adc_dout[1] ),
	.wire_from_adc_dout_2(\adc_inst|adcblock_instance|wire_from_adc_dout[2] ),
	.wire_from_adc_dout_3(\adc_inst|adcblock_instance|wire_from_adc_dout[3] ),
	.wire_from_adc_dout_4(\adc_inst|adcblock_instance|wire_from_adc_dout[4] ),
	.wire_from_adc_dout_5(\adc_inst|adcblock_instance|wire_from_adc_dout[5] ),
	.wire_from_adc_dout_6(\adc_inst|adcblock_instance|wire_from_adc_dout[6] ),
	.wire_from_adc_dout_7(\adc_inst|adcblock_instance|wire_from_adc_dout[7] ),
	.wire_from_adc_dout_8(\adc_inst|adcblock_instance|wire_from_adc_dout[8] ),
	.wire_from_adc_dout_9(\adc_inst|adcblock_instance|wire_from_adc_dout[9] ),
	.wire_from_adc_dout_10(\adc_inst|adcblock_instance|wire_from_adc_dout[10] ),
	.wire_from_adc_dout_11(\adc_inst|adcblock_instance|wire_from_adc_dout[11] ),
	.rsp_valid1(rsp_valid),
	.rsp_channel_0(rsp_channel_0),
	.rsp_channel_1(rsp_channel_1),
	.rsp_channel_2(rsp_channel_2),
	.rsp_channel_3(rsp_channel_3),
	.rsp_channel_4(rsp_channel_4),
	.rsp_data_0(rsp_data_0),
	.rsp_data_1(rsp_data_1),
	.rsp_data_2(rsp_data_2),
	.rsp_data_3(rsp_data_3),
	.rsp_data_4(rsp_data_4),
	.rsp_data_5(rsp_data_5),
	.rsp_data_6(rsp_data_6),
	.rsp_data_7(rsp_data_7),
	.rsp_data_8(rsp_data_8),
	.rsp_data_9(rsp_data_9),
	.rsp_data_10(rsp_data_10),
	.rsp_data_11(rsp_data_11),
	.rsp_sop1(rsp_sop),
	.rsp_eop1(rsp_eop),
	.altera_reset_synchronizer_int_chain_out(altera_reset_synchronizer_int_chain_out),
	.cmd_ready1(cmd_ready),
	.cmd_sop(cmd_sop),
	.cmd_eop(cmd_eop),
	.soc1(\u_control_fsm|soc~q ),
	.chsel_0(\u_control_fsm|chsel[0]~q ),
	.chsel_1(\u_control_fsm|chsel[1]~q ),
	.chsel_2(\u_control_fsm|chsel[2]~q ),
	.chsel_4(\u_control_fsm|chsel[4]~q ),
	.cmd_valid(cmd_valid),
	.usr_pwd1(\u_control_fsm|usr_pwd~_wirecell_combout ),
	.clk_clk(clk_clk),
	.modular_adc_0_adc_pll_locked_export(modular_adc_0_adc_pll_locked_export));

adc_fiftyfivenm_adcblock_top_wrapper adc_inst(
	.eoc(\adc_inst|adcblock_instance|eoc ),
	.clkout_adccore(\adc_inst|adcblock_instance|clkout_adccore ),
	.wire_from_adc_dout_0(\adc_inst|adcblock_instance|wire_from_adc_dout[0] ),
	.wire_from_adc_dout_1(\adc_inst|adcblock_instance|wire_from_adc_dout[1] ),
	.wire_from_adc_dout_2(\adc_inst|adcblock_instance|wire_from_adc_dout[2] ),
	.wire_from_adc_dout_3(\adc_inst|adcblock_instance|wire_from_adc_dout[3] ),
	.wire_from_adc_dout_4(\adc_inst|adcblock_instance|wire_from_adc_dout[4] ),
	.wire_from_adc_dout_5(\adc_inst|adcblock_instance|wire_from_adc_dout[5] ),
	.wire_from_adc_dout_6(\adc_inst|adcblock_instance|wire_from_adc_dout[6] ),
	.wire_from_adc_dout_7(\adc_inst|adcblock_instance|wire_from_adc_dout[7] ),
	.wire_from_adc_dout_8(\adc_inst|adcblock_instance|wire_from_adc_dout[8] ),
	.wire_from_adc_dout_9(\adc_inst|adcblock_instance|wire_from_adc_dout[9] ),
	.wire_from_adc_dout_10(\adc_inst|adcblock_instance|wire_from_adc_dout[10] ),
	.wire_from_adc_dout_11(\adc_inst|adcblock_instance|wire_from_adc_dout[11] ),
	.soc(\u_control_fsm|soc~q ),
	.chsel_0(\u_control_fsm|chsel[0]~q ),
	.chsel_1(\u_control_fsm|chsel[1]~q ),
	.chsel_2(\u_control_fsm|chsel[2]~q ),
	.chsel_4(\u_control_fsm|chsel[4]~q ),
	.GND_port(GND_port),
	.usr_pwd(\u_control_fsm|usr_pwd~_wirecell_combout ),
	.modular_adc_0_adc_pll_clock_clk(modular_adc_0_adc_pll_clock_clk));

endmodule

module adc_altera_modular_adc_control_fsm (
	cmd_channel,
	eoc,
	clkout_adccore,
	wire_from_adc_dout_0,
	wire_from_adc_dout_1,
	wire_from_adc_dout_2,
	wire_from_adc_dout_3,
	wire_from_adc_dout_4,
	wire_from_adc_dout_5,
	wire_from_adc_dout_6,
	wire_from_adc_dout_7,
	wire_from_adc_dout_8,
	wire_from_adc_dout_9,
	wire_from_adc_dout_10,
	wire_from_adc_dout_11,
	rsp_valid1,
	rsp_channel_0,
	rsp_channel_1,
	rsp_channel_2,
	rsp_channel_3,
	rsp_channel_4,
	rsp_data_0,
	rsp_data_1,
	rsp_data_2,
	rsp_data_3,
	rsp_data_4,
	rsp_data_5,
	rsp_data_6,
	rsp_data_7,
	rsp_data_8,
	rsp_data_9,
	rsp_data_10,
	rsp_data_11,
	rsp_sop1,
	rsp_eop1,
	altera_reset_synchronizer_int_chain_out,
	cmd_ready1,
	cmd_sop,
	cmd_eop,
	soc1,
	chsel_0,
	chsel_1,
	chsel_2,
	chsel_4,
	cmd_valid,
	usr_pwd1,
	clk_clk,
	modular_adc_0_adc_pll_locked_export)/* synthesis synthesis_greybox=0 */;
input 	[4:0] cmd_channel;
input 	eoc;
input 	clkout_adccore;
input 	wire_from_adc_dout_0;
input 	wire_from_adc_dout_1;
input 	wire_from_adc_dout_2;
input 	wire_from_adc_dout_3;
input 	wire_from_adc_dout_4;
input 	wire_from_adc_dout_5;
input 	wire_from_adc_dout_6;
input 	wire_from_adc_dout_7;
input 	wire_from_adc_dout_8;
input 	wire_from_adc_dout_9;
input 	wire_from_adc_dout_10;
input 	wire_from_adc_dout_11;
output 	rsp_valid1;
output 	rsp_channel_0;
output 	rsp_channel_1;
output 	rsp_channel_2;
output 	rsp_channel_3;
output 	rsp_channel_4;
output 	rsp_data_0;
output 	rsp_data_1;
output 	rsp_data_2;
output 	rsp_data_3;
output 	rsp_data_4;
output 	rsp_data_5;
output 	rsp_data_6;
output 	rsp_data_7;
output 	rsp_data_8;
output 	rsp_data_9;
output 	rsp_data_10;
output 	rsp_data_11;
output 	rsp_sop1;
output 	rsp_eop1;
input 	altera_reset_synchronizer_int_chain_out;
output 	cmd_ready1;
input 	cmd_sop;
input 	cmd_eop;
output 	soc1;
output 	chsel_0;
output 	chsel_1;
output 	chsel_2;
output 	chsel_4;
input 	cmd_valid;
output 	usr_pwd1;
input 	clk_clk;
input 	modular_adc_0_adc_pll_locked_export;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \u_eoc_synchronizer|dreg[0]~q ;
wire \u_clk_dft_synchronizer|dreg[0]~q ;
wire \eoc_synch_dly~q ;
wire \Selector5~0_combout ;
wire \Add0~0_combout ;
wire \ctrl_state.PUTRESP_DLY2~q ;
wire \ctrl_state.PUTRESP_DLY3~q ;
wire \Selector7~1_combout ;
wire \ctrl_state.GETCMD~q ;
wire \cmd_fetched~3_combout ;
wire \Selector1~0_combout ;
wire \ctrl_state.PWRDWN~q ;
wire \Selector0~0_combout ;
wire \ctrl_state.IDLE~q ;
wire \Selector1~1_combout ;
wire \Selector1~2_combout ;
wire \load_int_timer~0_combout ;
wire \int_timer~8_combout ;
wire \arc_to_conv~combout ;
wire \int_timer[4]~0_combout ;
wire \int_timer[4]~3_combout ;
wire \int_timer[0]~q ;
wire \Add0~1 ;
wire \Add0~2_combout ;
wire \int_timer~7_combout ;
wire \int_timer[1]~q ;
wire \Add0~3 ;
wire \Add0~4_combout ;
wire \int_timer~6_combout ;
wire \int_timer[2]~q ;
wire \Add0~5 ;
wire \Add0~6_combout ;
wire \int_timer~5_combout ;
wire \int_timer[3]~q ;
wire \Add0~7 ;
wire \Add0~8_combout ;
wire \int_timer~4_combout ;
wire \int_timer[4]~q ;
wire \Add0~9 ;
wire \Add0~10_combout ;
wire \int_timer~2_combout ;
wire \int_timer[5]~q ;
wire \Add0~11 ;
wire \Add0~12_combout ;
wire \int_timer[6]~1_combout ;
wire \int_timer[6]~q ;
wire \Add0~13 ;
wire \Add0~14_combout ;
wire \int_timer~9_combout ;
wire \int_timer[7]~q ;
wire \Selector2~0_combout ;
wire \ctrl_state.PWRDWN_TSEN~q ;
wire \Selector3~0_combout ;
wire \clk_dft_synch_dly~q ;
wire \Selector3~1_combout ;
wire \ctrl_state.PWRDWN_DONE~q ;
wire \Selector4~0_combout ;
wire \ctrl_state.PWRUP_CH~q ;
wire \Selector5~1_combout ;
wire \ctrl_state.PWRUP_SOC~q ;
wire \cmd_fetched~2_combout ;
wire \cmd_fetched~4_combout ;
wire \cmd_fetched~q ;
wire \Selector7~0_combout ;
wire \Selector6~0_combout ;
wire \Selector6~1_combout ;
wire \ctrl_state.WAIT~q ;
wire \ctrl_state_nxt.GETCMD_W~0_combout ;
wire \ctrl_state.GETCMD_W~q ;
wire \Equal1~0_combout ;
wire \eoc_hl~combout ;
wire \Selector8~0_combout ;
wire \ctrl_state.PRE_CONV~q ;
wire \Selector9~0_combout ;
wire \Selector10~0_combout ;
wire \Selector9~1_combout ;
wire \ctrl_state.CONV~q ;
wire \ctrl_state_nxt.CONV_DLY1~0_combout ;
wire \ctrl_state.CONV_DLY1~q ;
wire \conv_dly1_s_flp~q ;
wire \pend~0_combout ;
wire \pend~q ;
wire \Selector11~0_combout ;
wire \Selector11~1_combout ;
wire \ctrl_state.WAIT_PEND~q ;
wire \ctrl_state_nxt.WAIT_PEND_DLY1~0_combout ;
wire \ctrl_state.WAIT_PEND_DLY1~q ;
wire \ctrl_state.PUTRESP_PEND~q ;
wire \Selector10~1_combout ;
wire \ctrl_state.PUTRESP~q ;
wire \load_rsp~combout ;
wire \cmd_channel_dly[0]~q ;
wire \load_rsp~0_combout ;
wire \rsp_channel~0_combout ;
wire \cmd_channel_dly[1]~q ;
wire \rsp_channel~1_combout ;
wire \cmd_channel_dly[4]~q ;
wire \rsp_channel~2_combout ;
wire \load_dout~0_combout ;
wire \dout_flp[0]~q ;
wire \rsp_data~0_combout ;
wire \dout_flp[1]~q ;
wire \rsp_data~1_combout ;
wire \dout_flp[2]~q ;
wire \rsp_data~2_combout ;
wire \dout_flp[3]~q ;
wire \rsp_data~3_combout ;
wire \dout_flp[4]~q ;
wire \rsp_data~4_combout ;
wire \dout_flp[5]~q ;
wire \rsp_data~5_combout ;
wire \dout_flp[6]~q ;
wire \rsp_data~6_combout ;
wire \dout_flp[7]~q ;
wire \rsp_data~7_combout ;
wire \dout_flp[8]~q ;
wire \rsp_data~8_combout ;
wire \dout_flp[9]~q ;
wire \rsp_data~9_combout ;
wire \dout_flp[10]~q ;
wire \rsp_data~10_combout ;
wire \dout_flp[11]~q ;
wire \rsp_data~11_combout ;
wire \cmd_sop_dly~q ;
wire \rsp_sop~0_combout ;
wire \cmd_eop_dly~q ;
wire \rsp_eop~0_combout ;
wire \WideOr12~2_combout ;
wire \WideOr12~3_combout ;
wire \WideOr12~4_combout ;
wire \WideOr12~5_combout ;
wire \WideOr13~2_combout ;
wire \WideOr15~0_combout ;
wire \Selector17~0_combout ;
wire \WideOr12~6_combout ;
wire \WideOr12~combout ;
wire \Selector16~0_combout ;
wire \Selector15~0_combout ;
wire \Selector14~0_combout ;
wire \Selector12~0_combout ;
wire \Selector18~0_combout ;
wire \Selector18~1_combout ;
wire \usr_pwd~q ;


adc_altera_std_synchronizer u_clk_dft_synchronizer(
	.din(clkout_adccore),
	.reset_n(altera_reset_synchronizer_int_chain_out),
	.dreg_0(\u_clk_dft_synchronizer|dreg[0]~q ),
	.clk(clk_clk));

adc_altera_std_synchronizer_1 u_eoc_synchronizer(
	.din(eoc),
	.reset_n(altera_reset_synchronizer_int_chain_out),
	.dreg_0(\u_eoc_synchronizer|dreg[0]~q ),
	.clk(clk_clk));

dffeas rsp_valid(
	.clk(clk_clk),
	.d(\load_rsp~combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_valid1),
	.prn(vcc));
defparam rsp_valid.is_wysiwyg = "true";
defparam rsp_valid.power_up = "low";

dffeas \rsp_channel[0] (
	.clk(clk_clk),
	.d(\rsp_channel~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_channel_0),
	.prn(vcc));
defparam \rsp_channel[0] .is_wysiwyg = "true";
defparam \rsp_channel[0] .power_up = "low";

dffeas \rsp_channel[1] (
	.clk(clk_clk),
	.d(\rsp_channel~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_channel_1),
	.prn(vcc));
defparam \rsp_channel[1] .is_wysiwyg = "true";
defparam \rsp_channel[1] .power_up = "low";

dffeas \rsp_channel[2] (
	.clk(clk_clk),
	.d(\rsp_channel~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_channel_2),
	.prn(vcc));
defparam \rsp_channel[2] .is_wysiwyg = "true";
defparam \rsp_channel[2] .power_up = "low";

dffeas \rsp_channel[3] (
	.clk(clk_clk),
	.d(\rsp_channel~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_channel_3),
	.prn(vcc));
defparam \rsp_channel[3] .is_wysiwyg = "true";
defparam \rsp_channel[3] .power_up = "low";

dffeas \rsp_channel[4] (
	.clk(clk_clk),
	.d(\rsp_channel~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_channel_4),
	.prn(vcc));
defparam \rsp_channel[4] .is_wysiwyg = "true";
defparam \rsp_channel[4] .power_up = "low";

dffeas \rsp_data[0] (
	.clk(clk_clk),
	.d(\rsp_data~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_0),
	.prn(vcc));
defparam \rsp_data[0] .is_wysiwyg = "true";
defparam \rsp_data[0] .power_up = "low";

dffeas \rsp_data[1] (
	.clk(clk_clk),
	.d(\rsp_data~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_1),
	.prn(vcc));
defparam \rsp_data[1] .is_wysiwyg = "true";
defparam \rsp_data[1] .power_up = "low";

dffeas \rsp_data[2] (
	.clk(clk_clk),
	.d(\rsp_data~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_2),
	.prn(vcc));
defparam \rsp_data[2] .is_wysiwyg = "true";
defparam \rsp_data[2] .power_up = "low";

dffeas \rsp_data[3] (
	.clk(clk_clk),
	.d(\rsp_data~3_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_3),
	.prn(vcc));
defparam \rsp_data[3] .is_wysiwyg = "true";
defparam \rsp_data[3] .power_up = "low";

dffeas \rsp_data[4] (
	.clk(clk_clk),
	.d(\rsp_data~4_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_4),
	.prn(vcc));
defparam \rsp_data[4] .is_wysiwyg = "true";
defparam \rsp_data[4] .power_up = "low";

dffeas \rsp_data[5] (
	.clk(clk_clk),
	.d(\rsp_data~5_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_5),
	.prn(vcc));
defparam \rsp_data[5] .is_wysiwyg = "true";
defparam \rsp_data[5] .power_up = "low";

dffeas \rsp_data[6] (
	.clk(clk_clk),
	.d(\rsp_data~6_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_6),
	.prn(vcc));
defparam \rsp_data[6] .is_wysiwyg = "true";
defparam \rsp_data[6] .power_up = "low";

dffeas \rsp_data[7] (
	.clk(clk_clk),
	.d(\rsp_data~7_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_7),
	.prn(vcc));
defparam \rsp_data[7] .is_wysiwyg = "true";
defparam \rsp_data[7] .power_up = "low";

dffeas \rsp_data[8] (
	.clk(clk_clk),
	.d(\rsp_data~8_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_8),
	.prn(vcc));
defparam \rsp_data[8] .is_wysiwyg = "true";
defparam \rsp_data[8] .power_up = "low";

dffeas \rsp_data[9] (
	.clk(clk_clk),
	.d(\rsp_data~9_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_9),
	.prn(vcc));
defparam \rsp_data[9] .is_wysiwyg = "true";
defparam \rsp_data[9] .power_up = "low";

dffeas \rsp_data[10] (
	.clk(clk_clk),
	.d(\rsp_data~10_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_10),
	.prn(vcc));
defparam \rsp_data[10] .is_wysiwyg = "true";
defparam \rsp_data[10] .power_up = "low";

dffeas \rsp_data[11] (
	.clk(clk_clk),
	.d(\rsp_data~11_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_data_11),
	.prn(vcc));
defparam \rsp_data[11] .is_wysiwyg = "true";
defparam \rsp_data[11] .power_up = "low";

dffeas rsp_sop(
	.clk(clk_clk),
	.d(\rsp_sop~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_sop1),
	.prn(vcc));
defparam rsp_sop.is_wysiwyg = "true";
defparam rsp_sop.power_up = "low";

dffeas rsp_eop(
	.clk(clk_clk),
	.d(\rsp_eop~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rsp_eop1),
	.prn(vcc));
defparam rsp_eop.is_wysiwyg = "true";
defparam rsp_eop.power_up = "low";

dffeas cmd_ready(
	.clk(clk_clk),
	.d(\ctrl_state.PUTRESP~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(cmd_ready1),
	.prn(vcc));
defparam cmd_ready.is_wysiwyg = "true";
defparam cmd_ready.power_up = "low";

dffeas soc(
	.clk(clk_clk),
	.d(\Selector17~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(soc1),
	.prn(vcc));
defparam soc.is_wysiwyg = "true";
defparam soc.power_up = "low";

dffeas \chsel[0] (
	.clk(clk_clk),
	.d(\Selector16~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(chsel_0),
	.prn(vcc));
defparam \chsel[0] .is_wysiwyg = "true";
defparam \chsel[0] .power_up = "low";

dffeas \chsel[1] (
	.clk(clk_clk),
	.d(\Selector15~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr12~combout ),
	.q(chsel_1),
	.prn(vcc));
defparam \chsel[1] .is_wysiwyg = "true";
defparam \chsel[1] .power_up = "low";

dffeas \chsel[2] (
	.clk(clk_clk),
	.d(\Selector14~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\WideOr12~combout ),
	.q(chsel_2),
	.prn(vcc));
defparam \chsel[2] .is_wysiwyg = "true";
defparam \chsel[2] .power_up = "low";

dffeas \chsel[4] (
	.clk(clk_clk),
	.d(\Selector12~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(chsel_4),
	.prn(vcc));
defparam \chsel[4] .is_wysiwyg = "true";
defparam \chsel[4] .power_up = "low";

fiftyfivenm_lcell_comb \usr_pwd~_wirecell (
	.dataa(\usr_pwd~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(usr_pwd1),
	.cout());
defparam \usr_pwd~_wirecell .lut_mask = 16'h5555;
defparam \usr_pwd~_wirecell .sum_lutc_input = "datac";

dffeas eoc_synch_dly(
	.clk(clk_clk),
	.d(\u_eoc_synchronizer|dreg[0]~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\eoc_synch_dly~q ),
	.prn(vcc));
defparam eoc_synch_dly.is_wysiwyg = "true";
defparam eoc_synch_dly.power_up = "low";

fiftyfivenm_lcell_comb \Selector5~0 (
	.dataa(\ctrl_state.PWRUP_SOC~q ),
	.datab(\u_eoc_synchronizer|dreg[0]~q ),
	.datac(gnd),
	.datad(\eoc_synch_dly~q ),
	.cin(gnd),
	.combout(\Selector5~0_combout ),
	.cout());
defparam \Selector5~0 .lut_mask = 16'h88AA;
defparam \Selector5~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Add0~0 (
	.dataa(\int_timer[0]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(gnd),
	.combout(\Add0~0_combout ),
	.cout(\Add0~1 ));
defparam \Add0~0 .lut_mask = 16'h55AA;
defparam \Add0~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.PUTRESP_DLY2 (
	.clk(clk_clk),
	.d(cmd_ready1),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PUTRESP_DLY2~q ),
	.prn(vcc));
defparam \ctrl_state.PUTRESP_DLY2 .is_wysiwyg = "true";
defparam \ctrl_state.PUTRESP_DLY2 .power_up = "low";

dffeas \ctrl_state.PUTRESP_DLY3 (
	.clk(clk_clk),
	.d(\ctrl_state.PUTRESP_DLY2~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PUTRESP_DLY3~q ),
	.prn(vcc));
defparam \ctrl_state.PUTRESP_DLY3 .is_wysiwyg = "true";
defparam \ctrl_state.PUTRESP_DLY3 .power_up = "low";

fiftyfivenm_lcell_comb \Selector7~1 (
	.dataa(cmd_valid),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP_DLY3~q ),
	.datad(\Selector7~0_combout ),
	.cin(gnd),
	.combout(\Selector7~1_combout ),
	.cout());
defparam \Selector7~1 .lut_mask = 16'hAAA8;
defparam \Selector7~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.GETCMD (
	.clk(clk_clk),
	.d(\Selector7~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.GETCMD~q ),
	.prn(vcc));
defparam \ctrl_state.GETCMD .is_wysiwyg = "true";
defparam \ctrl_state.GETCMD .power_up = "low";

fiftyfivenm_lcell_comb \cmd_fetched~3 (
	.dataa(\ctrl_state.GETCMD~q ),
	.datab(\ctrl_state.GETCMD_W~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\cmd_fetched~3_combout ),
	.cout());
defparam \cmd_fetched~3 .lut_mask = 16'hEEEE;
defparam \cmd_fetched~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector1~0 (
	.dataa(cmd_channel[0]),
	.datab(\ctrl_state.GETCMD_W~q ),
	.datac(\ctrl_state.GETCMD~q ),
	.datad(\pend~q ),
	.cin(gnd),
	.combout(\Selector1~0_combout ),
	.cout());
defparam \Selector1~0 .lut_mask = 16'h88A8;
defparam \Selector1~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.PWRDWN (
	.clk(clk_clk),
	.d(\Selector1~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PWRDWN~q ),
	.prn(vcc));
defparam \ctrl_state.PWRDWN .is_wysiwyg = "true";
defparam \ctrl_state.PWRDWN .power_up = "low";

fiftyfivenm_lcell_comb \Selector0~0 (
	.dataa(modular_adc_0_adc_pll_locked_export),
	.datab(\ctrl_state.IDLE~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector0~0_combout ),
	.cout());
defparam \Selector0~0 .lut_mask = 16'hEEEE;
defparam \Selector0~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.IDLE (
	.clk(clk_clk),
	.d(\Selector0~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.IDLE~q ),
	.prn(vcc));
defparam \ctrl_state.IDLE .is_wysiwyg = "true";
defparam \ctrl_state.IDLE .power_up = "low";

fiftyfivenm_lcell_comb \Selector1~1 (
	.dataa(\ctrl_state.PWRDWN~q ),
	.datab(modular_adc_0_adc_pll_locked_export),
	.datac(\int_timer[6]~q ),
	.datad(\ctrl_state.IDLE~q ),
	.cin(gnd),
	.combout(\Selector1~1_combout ),
	.cout());
defparam \Selector1~1 .lut_mask = 16'h0ACE;
defparam \Selector1~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector1~2 (
	.dataa(cmd_channel[4]),
	.datab(cmd_channel[1]),
	.datac(\Selector1~0_combout ),
	.datad(\Selector1~1_combout ),
	.cin(gnd),
	.combout(\Selector1~2_combout ),
	.cout());
defparam \Selector1~2 .lut_mask = 16'hFF80;
defparam \Selector1~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \load_int_timer~0 (
	.dataa(\cmd_fetched~3_combout ),
	.datab(\Selector1~2_combout ),
	.datac(\Selector9~1_combout ),
	.datad(\ctrl_state.CONV~q ),
	.cin(gnd),
	.combout(\load_int_timer~0_combout ),
	.cout());
defparam \load_int_timer~0 .lut_mask = 16'h88F8;
defparam \load_int_timer~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \int_timer~8 (
	.dataa(\Add0~0_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~8_combout ),
	.cout());
defparam \int_timer~8 .lut_mask = 16'h00AA;
defparam \int_timer~8 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb arc_to_conv(
	.dataa(\Selector9~1_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\ctrl_state.CONV~q ),
	.cin(gnd),
	.combout(\arc_to_conv~combout ),
	.cout());
defparam arc_to_conv.lut_mask = 16'h00AA;
defparam arc_to_conv.sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \int_timer[4]~0 (
	.dataa(\ctrl_state.PWRDWN~q ),
	.datab(\ctrl_state.PWRDWN_TSEN~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\int_timer[4]~0_combout ),
	.cout());
defparam \int_timer[4]~0 .lut_mask = 16'hEEEE;
defparam \int_timer[4]~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \int_timer[4]~3 (
	.dataa(\arc_to_conv~combout ),
	.datab(\int_timer[4]~0_combout ),
	.datac(\cmd_fetched~3_combout ),
	.datad(\Selector1~2_combout ),
	.cin(gnd),
	.combout(\int_timer[4]~3_combout ),
	.cout());
defparam \int_timer[4]~3 .lut_mask = 16'hFEEE;
defparam \int_timer[4]~3 .sum_lutc_input = "datac";

dffeas \int_timer[0] (
	.clk(clk_clk),
	.d(\int_timer~8_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[0]~q ),
	.prn(vcc));
defparam \int_timer[0] .is_wysiwyg = "true";
defparam \int_timer[0] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~2 (
	.dataa(\int_timer[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~1 ),
	.combout(\Add0~2_combout ),
	.cout(\Add0~3 ));
defparam \Add0~2 .lut_mask = 16'h5A5F;
defparam \Add0~2 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~7 (
	.dataa(\Add0~2_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~7_combout ),
	.cout());
defparam \int_timer~7 .lut_mask = 16'h00AA;
defparam \int_timer~7 .sum_lutc_input = "datac";

dffeas \int_timer[1] (
	.clk(clk_clk),
	.d(\int_timer~7_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[1]~q ),
	.prn(vcc));
defparam \int_timer[1] .is_wysiwyg = "true";
defparam \int_timer[1] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~4 (
	.dataa(\int_timer[2]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~3 ),
	.combout(\Add0~4_combout ),
	.cout(\Add0~5 ));
defparam \Add0~4 .lut_mask = 16'hA50A;
defparam \Add0~4 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~6 (
	.dataa(\Add0~4_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~6_combout ),
	.cout());
defparam \int_timer~6 .lut_mask = 16'h00AA;
defparam \int_timer~6 .sum_lutc_input = "datac";

dffeas \int_timer[2] (
	.clk(clk_clk),
	.d(\int_timer~6_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[2]~q ),
	.prn(vcc));
defparam \int_timer[2] .is_wysiwyg = "true";
defparam \int_timer[2] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~6 (
	.dataa(\int_timer[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~5 ),
	.combout(\Add0~6_combout ),
	.cout(\Add0~7 ));
defparam \Add0~6 .lut_mask = 16'h5A5F;
defparam \Add0~6 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~5 (
	.dataa(\Add0~6_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~5_combout ),
	.cout());
defparam \int_timer~5 .lut_mask = 16'h00AA;
defparam \int_timer~5 .sum_lutc_input = "datac";

dffeas \int_timer[3] (
	.clk(clk_clk),
	.d(\int_timer~5_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[3]~q ),
	.prn(vcc));
defparam \int_timer[3] .is_wysiwyg = "true";
defparam \int_timer[3] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~8 (
	.dataa(\int_timer[4]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~7 ),
	.combout(\Add0~8_combout ),
	.cout(\Add0~9 ));
defparam \Add0~8 .lut_mask = 16'hA50A;
defparam \Add0~8 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~4 (
	.dataa(\Add0~8_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~4_combout ),
	.cout());
defparam \int_timer~4 .lut_mask = 16'h00AA;
defparam \int_timer~4 .sum_lutc_input = "datac";

dffeas \int_timer[4] (
	.clk(clk_clk),
	.d(\int_timer~4_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[4]~q ),
	.prn(vcc));
defparam \int_timer[4] .is_wysiwyg = "true";
defparam \int_timer[4] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~10 (
	.dataa(\int_timer[5]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~9 ),
	.combout(\Add0~10_combout ),
	.cout(\Add0~11 ));
defparam \Add0~10 .lut_mask = 16'h5A5F;
defparam \Add0~10 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~2 (
	.dataa(\Add0~10_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~2_combout ),
	.cout());
defparam \int_timer~2 .lut_mask = 16'h00AA;
defparam \int_timer~2 .sum_lutc_input = "datac";

dffeas \int_timer[5] (
	.clk(clk_clk),
	.d(\int_timer~2_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[5]~q ),
	.prn(vcc));
defparam \int_timer[5] .is_wysiwyg = "true";
defparam \int_timer[5] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~12 (
	.dataa(\int_timer[6]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(vcc),
	.cin(\Add0~11 ),
	.combout(\Add0~12_combout ),
	.cout(\Add0~13 ));
defparam \Add0~12 .lut_mask = 16'hA50A;
defparam \Add0~12 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer[6]~1 (
	.dataa(\Add0~12_combout ),
	.datab(\int_timer[6]~q ),
	.datac(\int_timer[4]~0_combout ),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer[6]~1_combout ),
	.cout());
defparam \int_timer[6]~1 .lut_mask = 16'h00AC;
defparam \int_timer[6]~1 .sum_lutc_input = "datac";

dffeas \int_timer[6] (
	.clk(clk_clk),
	.d(\int_timer[6]~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\int_timer[6]~q ),
	.prn(vcc));
defparam \int_timer[6] .is_wysiwyg = "true";
defparam \int_timer[6] .power_up = "low";

fiftyfivenm_lcell_comb \Add0~14 (
	.dataa(\int_timer[7]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(\Add0~13 ),
	.combout(\Add0~14_combout ),
	.cout());
defparam \Add0~14 .lut_mask = 16'h5A5A;
defparam \Add0~14 .sum_lutc_input = "cin";

fiftyfivenm_lcell_comb \int_timer~9 (
	.dataa(\Add0~14_combout ),
	.datab(gnd),
	.datac(gnd),
	.datad(\load_int_timer~0_combout ),
	.cin(gnd),
	.combout(\int_timer~9_combout ),
	.cout());
defparam \int_timer~9 .lut_mask = 16'h00AA;
defparam \int_timer~9 .sum_lutc_input = "datac";

dffeas \int_timer[7] (
	.clk(clk_clk),
	.d(\int_timer~9_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\int_timer[4]~3_combout ),
	.q(\int_timer[7]~q ),
	.prn(vcc));
defparam \int_timer[7] .is_wysiwyg = "true";
defparam \int_timer[7] .power_up = "low";

fiftyfivenm_lcell_comb \Selector2~0 (
	.dataa(\int_timer[6]~q ),
	.datab(\ctrl_state.PWRDWN~q ),
	.datac(\ctrl_state.PWRDWN_TSEN~q ),
	.datad(\int_timer[7]~q ),
	.cin(gnd),
	.combout(\Selector2~0_combout ),
	.cout());
defparam \Selector2~0 .lut_mask = 16'h88F8;
defparam \Selector2~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.PWRDWN_TSEN (
	.clk(clk_clk),
	.d(\Selector2~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PWRDWN_TSEN~q ),
	.prn(vcc));
defparam \ctrl_state.PWRDWN_TSEN .is_wysiwyg = "true";
defparam \ctrl_state.PWRDWN_TSEN .power_up = "low";

fiftyfivenm_lcell_comb \Selector3~0 (
	.dataa(\ctrl_state.PWRDWN_TSEN~q ),
	.datab(\int_timer[7]~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector3~0_combout ),
	.cout());
defparam \Selector3~0 .lut_mask = 16'h8888;
defparam \Selector3~0 .sum_lutc_input = "datac";

dffeas clk_dft_synch_dly(
	.clk(clk_clk),
	.d(\u_clk_dft_synchronizer|dreg[0]~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\clk_dft_synch_dly~q ),
	.prn(vcc));
defparam clk_dft_synch_dly.is_wysiwyg = "true";
defparam clk_dft_synch_dly.power_up = "low";

fiftyfivenm_lcell_comb \Selector3~1 (
	.dataa(\Selector3~0_combout ),
	.datab(\ctrl_state.PWRDWN_DONE~q ),
	.datac(\clk_dft_synch_dly~q ),
	.datad(\u_clk_dft_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\Selector3~1_combout ),
	.cout());
defparam \Selector3~1 .lut_mask = 16'hEAEE;
defparam \Selector3~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.PWRDWN_DONE (
	.clk(clk_clk),
	.d(\Selector3~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PWRDWN_DONE~q ),
	.prn(vcc));
defparam \ctrl_state.PWRDWN_DONE .is_wysiwyg = "true";
defparam \ctrl_state.PWRDWN_DONE .power_up = "low";

fiftyfivenm_lcell_comb \Selector4~0 (
	.dataa(\ctrl_state.PWRUP_CH~q ),
	.datab(\u_clk_dft_synchronizer|dreg[0]~q ),
	.datac(\ctrl_state.PWRDWN_DONE~q ),
	.datad(\clk_dft_synch_dly~q ),
	.cin(gnd),
	.combout(\Selector4~0_combout ),
	.cout());
defparam \Selector4~0 .lut_mask = 16'h88EA;
defparam \Selector4~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.PWRUP_CH (
	.clk(clk_clk),
	.d(\Selector4~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PWRUP_CH~q ),
	.prn(vcc));
defparam \ctrl_state.PWRUP_CH .is_wysiwyg = "true";
defparam \ctrl_state.PWRUP_CH .power_up = "low";

fiftyfivenm_lcell_comb \Selector5~1 (
	.dataa(\Selector5~0_combout ),
	.datab(\ctrl_state.PWRUP_CH~q ),
	.datac(\clk_dft_synch_dly~q ),
	.datad(\u_clk_dft_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\Selector5~1_combout ),
	.cout());
defparam \Selector5~1 .lut_mask = 16'hAAEA;
defparam \Selector5~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.PWRUP_SOC (
	.clk(clk_clk),
	.d(\Selector5~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PWRUP_SOC~q ),
	.prn(vcc));
defparam \ctrl_state.PWRUP_SOC .is_wysiwyg = "true";
defparam \ctrl_state.PWRUP_SOC .power_up = "low";

fiftyfivenm_lcell_comb \cmd_fetched~2 (
	.dataa(\cmd_fetched~q ),
	.datab(\u_eoc_synchronizer|dreg[0]~q ),
	.datac(\eoc_synch_dly~q ),
	.datad(\ctrl_state.PWRUP_SOC~q ),
	.cin(gnd),
	.combout(\cmd_fetched~2_combout ),
	.cout());
defparam \cmd_fetched~2 .lut_mask = 16'h8AAA;
defparam \cmd_fetched~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_fetched~4 (
	.dataa(\ctrl_state.GETCMD~q ),
	.datab(\ctrl_state.GETCMD_W~q ),
	.datac(\cmd_fetched~2_combout ),
	.datad(\Selector1~2_combout ),
	.cin(gnd),
	.combout(\cmd_fetched~4_combout ),
	.cout());
defparam \cmd_fetched~4 .lut_mask = 16'hFEF0;
defparam \cmd_fetched~4 .sum_lutc_input = "datac";

dffeas cmd_fetched(
	.clk(clk_clk),
	.d(\cmd_fetched~4_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\cmd_fetched~q ),
	.prn(vcc));
defparam cmd_fetched.is_wysiwyg = "true";
defparam cmd_fetched.power_up = "low";

fiftyfivenm_lcell_comb \Selector7~0 (
	.dataa(\eoc_synch_dly~q ),
	.datab(\ctrl_state.PWRUP_SOC~q ),
	.datac(\cmd_fetched~q ),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\Selector7~0_combout ),
	.cout());
defparam \Selector7~0 .lut_mask = 16'h0008;
defparam \Selector7~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector6~0 (
	.dataa(\ctrl_state.WAIT~q ),
	.datab(\ctrl_state.PUTRESP_DLY3~q ),
	.datac(gnd),
	.datad(\pend~q ),
	.cin(gnd),
	.combout(\Selector6~0_combout ),
	.cout());
defparam \Selector6~0 .lut_mask = 16'hAAEE;
defparam \Selector6~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector6~1 (
	.dataa(\ctrl_state.PUTRESP_PEND~q ),
	.datab(\Selector7~0_combout ),
	.datac(\Selector6~0_combout ),
	.datad(cmd_valid),
	.cin(gnd),
	.combout(\Selector6~1_combout ),
	.cout());
defparam \Selector6~1 .lut_mask = 16'h00FE;
defparam \Selector6~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.WAIT (
	.clk(clk_clk),
	.d(\Selector6~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.WAIT~q ),
	.prn(vcc));
defparam \ctrl_state.WAIT .is_wysiwyg = "true";
defparam \ctrl_state.WAIT .power_up = "low";

fiftyfivenm_lcell_comb \ctrl_state_nxt.GETCMD_W~0 (
	.dataa(cmd_valid),
	.datab(\ctrl_state.WAIT~q ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\ctrl_state_nxt.GETCMD_W~0_combout ),
	.cout());
defparam \ctrl_state_nxt.GETCMD_W~0 .lut_mask = 16'h8888;
defparam \ctrl_state_nxt.GETCMD_W~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.GETCMD_W (
	.clk(clk_clk),
	.d(\ctrl_state_nxt.GETCMD_W~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.GETCMD_W~q ),
	.prn(vcc));
defparam \ctrl_state.GETCMD_W .is_wysiwyg = "true";
defparam \ctrl_state.GETCMD_W .power_up = "low";

fiftyfivenm_lcell_comb \Equal1~0 (
	.dataa(cmd_channel[4]),
	.datab(cmd_channel[0]),
	.datac(cmd_channel[1]),
	.datad(gnd),
	.cin(gnd),
	.combout(\Equal1~0_combout ),
	.cout());
defparam \Equal1~0 .lut_mask = 16'h8080;
defparam \Equal1~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb eoc_hl(
	.dataa(\eoc_synch_dly~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\eoc_hl~combout ),
	.cout());
defparam eoc_hl.lut_mask = 16'h00AA;
defparam eoc_hl.sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector8~0 (
	.dataa(\ctrl_state.GETCMD_W~q ),
	.datab(\ctrl_state.PRE_CONV~q ),
	.datac(\Equal1~0_combout ),
	.datad(\eoc_hl~combout ),
	.cin(gnd),
	.combout(\Selector8~0_combout ),
	.cout());
defparam \Selector8~0 .lut_mask = 16'h0ACE;
defparam \Selector8~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.PRE_CONV (
	.clk(clk_clk),
	.d(\Selector8~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PRE_CONV~q ),
	.prn(vcc));
defparam \ctrl_state.PRE_CONV .is_wysiwyg = "true";
defparam \ctrl_state.PRE_CONV .power_up = "low";

fiftyfivenm_lcell_comb \Selector9~0 (
	.dataa(\ctrl_state.CONV~q ),
	.datab(\ctrl_state.PRE_CONV~q ),
	.datac(\eoc_synch_dly~q ),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\Selector9~0_combout ),
	.cout());
defparam \Selector9~0 .lut_mask = 16'hAACA;
defparam \Selector9~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector10~0 (
	.dataa(\cmd_fetched~q ),
	.datab(\eoc_synch_dly~q ),
	.datac(\ctrl_state.PWRUP_SOC~q ),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\Selector10~0_combout ),
	.cout());
defparam \Selector10~0 .lut_mask = 16'h0080;
defparam \Selector10~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector9~1 (
	.dataa(\Selector9~0_combout ),
	.datab(\Selector10~0_combout ),
	.datac(\ctrl_state.GETCMD~q ),
	.datad(\Equal1~0_combout ),
	.cin(gnd),
	.combout(\Selector9~1_combout ),
	.cout());
defparam \Selector9~1 .lut_mask = 16'hAAFE;
defparam \Selector9~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.CONV (
	.clk(clk_clk),
	.d(\Selector9~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.CONV~q ),
	.prn(vcc));
defparam \ctrl_state.CONV .is_wysiwyg = "true";
defparam \ctrl_state.CONV .power_up = "low";

fiftyfivenm_lcell_comb \ctrl_state_nxt.CONV_DLY1~0 (
	.dataa(\eoc_synch_dly~q ),
	.datab(\ctrl_state.CONV~q ),
	.datac(gnd),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\ctrl_state_nxt.CONV_DLY1~0_combout ),
	.cout());
defparam \ctrl_state_nxt.CONV_DLY1~0 .lut_mask = 16'h0088;
defparam \ctrl_state_nxt.CONV_DLY1~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.CONV_DLY1 (
	.clk(clk_clk),
	.d(\ctrl_state_nxt.CONV_DLY1~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.CONV_DLY1~q ),
	.prn(vcc));
defparam \ctrl_state.CONV_DLY1 .is_wysiwyg = "true";
defparam \ctrl_state.CONV_DLY1 .power_up = "low";

dffeas conv_dly1_s_flp(
	.clk(clk_clk),
	.d(\ctrl_state.CONV_DLY1~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\conv_dly1_s_flp~q ),
	.prn(vcc));
defparam conv_dly1_s_flp.is_wysiwyg = "true";
defparam conv_dly1_s_flp.power_up = "low";

fiftyfivenm_lcell_comb \pend~0 (
	.dataa(\conv_dly1_s_flp~q ),
	.datab(\pend~q ),
	.datac(gnd),
	.datad(\ctrl_state.WAIT_PEND_DLY1~q ),
	.cin(gnd),
	.combout(\pend~0_combout ),
	.cout());
defparam \pend~0 .lut_mask = 16'hAAEE;
defparam \pend~0 .sum_lutc_input = "datac";

dffeas pend(
	.clk(clk_clk),
	.d(\pend~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\pend~q ),
	.prn(vcc));
defparam pend.is_wysiwyg = "true";
defparam pend.power_up = "low";

fiftyfivenm_lcell_comb \Selector11~0 (
	.dataa(\Equal1~0_combout ),
	.datab(\ctrl_state.GETCMD~q ),
	.datac(\ctrl_state.PUTRESP_DLY3~q ),
	.datad(cmd_valid),
	.cin(gnd),
	.combout(\Selector11~0_combout ),
	.cout());
defparam \Selector11~0 .lut_mask = 16'h88F8;
defparam \Selector11~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector11~1 (
	.dataa(\pend~q ),
	.datab(\ctrl_state.WAIT_PEND~q ),
	.datac(\eoc_hl~combout ),
	.datad(\Selector11~0_combout ),
	.cin(gnd),
	.combout(\Selector11~1_combout ),
	.cout());
defparam \Selector11~1 .lut_mask = 16'hAE0C;
defparam \Selector11~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.WAIT_PEND (
	.clk(clk_clk),
	.d(\Selector11~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.WAIT_PEND~q ),
	.prn(vcc));
defparam \ctrl_state.WAIT_PEND .is_wysiwyg = "true";
defparam \ctrl_state.WAIT_PEND .power_up = "low";

fiftyfivenm_lcell_comb \ctrl_state_nxt.WAIT_PEND_DLY1~0 (
	.dataa(\eoc_synch_dly~q ),
	.datab(\ctrl_state.WAIT_PEND~q ),
	.datac(gnd),
	.datad(\u_eoc_synchronizer|dreg[0]~q ),
	.cin(gnd),
	.combout(\ctrl_state_nxt.WAIT_PEND_DLY1~0_combout ),
	.cout());
defparam \ctrl_state_nxt.WAIT_PEND_DLY1~0 .lut_mask = 16'h0088;
defparam \ctrl_state_nxt.WAIT_PEND_DLY1~0 .sum_lutc_input = "datac";

dffeas \ctrl_state.WAIT_PEND_DLY1 (
	.clk(clk_clk),
	.d(\ctrl_state_nxt.WAIT_PEND_DLY1~0_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.WAIT_PEND_DLY1~q ),
	.prn(vcc));
defparam \ctrl_state.WAIT_PEND_DLY1 .is_wysiwyg = "true";
defparam \ctrl_state.WAIT_PEND_DLY1 .power_up = "low";

dffeas \ctrl_state.PUTRESP_PEND (
	.clk(clk_clk),
	.d(\ctrl_state.WAIT_PEND_DLY1~q ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PUTRESP_PEND~q ),
	.prn(vcc));
defparam \ctrl_state.PUTRESP_PEND .is_wysiwyg = "true";
defparam \ctrl_state.PUTRESP_PEND .power_up = "low";

fiftyfivenm_lcell_comb \Selector10~1 (
	.dataa(\ctrl_state.CONV_DLY1~q ),
	.datab(\Equal1~0_combout ),
	.datac(\Selector10~0_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector10~1_combout ),
	.cout());
defparam \Selector10~1 .lut_mask = 16'hEAEA;
defparam \Selector10~1 .sum_lutc_input = "datac";

dffeas \ctrl_state.PUTRESP (
	.clk(clk_clk),
	.d(\Selector10~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\ctrl_state.PUTRESP~q ),
	.prn(vcc));
defparam \ctrl_state.PUTRESP .is_wysiwyg = "true";
defparam \ctrl_state.PUTRESP .power_up = "low";

fiftyfivenm_lcell_comb load_rsp(
	.dataa(\ctrl_state.PUTRESP_PEND~q ),
	.datab(\ctrl_state.PUTRESP~q ),
	.datac(\pend~q ),
	.datad(\Equal1~0_combout ),
	.cin(gnd),
	.combout(\load_rsp~combout ),
	.cout());
defparam load_rsp.lut_mask = 16'hAAEA;
defparam load_rsp.sum_lutc_input = "datac";

dffeas \cmd_channel_dly[0] (
	.clk(clk_clk),
	.d(cmd_channel[0]),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\ctrl_state.PUTRESP~q ),
	.q(\cmd_channel_dly[0]~q ),
	.prn(vcc));
defparam \cmd_channel_dly[0] .is_wysiwyg = "true";
defparam \cmd_channel_dly[0] .power_up = "low";

fiftyfivenm_lcell_comb \load_rsp~0 (
	.dataa(\pend~q ),
	.datab(cmd_channel[4]),
	.datac(cmd_channel[0]),
	.datad(cmd_channel[1]),
	.cin(gnd),
	.combout(\load_rsp~0_combout ),
	.cout());
defparam \load_rsp~0 .lut_mask = 16'h2AAA;
defparam \load_rsp~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rsp_channel~0 (
	.dataa(\cmd_channel_dly[0]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_channel~0_combout ),
	.cout());
defparam \rsp_channel~0 .lut_mask = 16'hA888;
defparam \rsp_channel~0 .sum_lutc_input = "datac";

dffeas \cmd_channel_dly[1] (
	.clk(clk_clk),
	.d(cmd_channel[1]),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\ctrl_state.PUTRESP~q ),
	.q(\cmd_channel_dly[1]~q ),
	.prn(vcc));
defparam \cmd_channel_dly[1] .is_wysiwyg = "true";
defparam \cmd_channel_dly[1] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_channel~1 (
	.dataa(\cmd_channel_dly[1]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_channel~1_combout ),
	.cout());
defparam \rsp_channel~1 .lut_mask = 16'hA888;
defparam \rsp_channel~1 .sum_lutc_input = "datac";

dffeas \cmd_channel_dly[4] (
	.clk(clk_clk),
	.d(cmd_channel[4]),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\ctrl_state.PUTRESP~q ),
	.q(\cmd_channel_dly[4]~q ),
	.prn(vcc));
defparam \cmd_channel_dly[4] .is_wysiwyg = "true";
defparam \cmd_channel_dly[4] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_channel~2 (
	.dataa(\cmd_channel_dly[4]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_channel~2_combout ),
	.cout());
defparam \rsp_channel~2 .lut_mask = 16'hA888;
defparam \rsp_channel~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \load_dout~0 (
	.dataa(\eoc_hl~combout ),
	.datab(\ctrl_state.WAIT_PEND~q ),
	.datac(\load_rsp~0_combout ),
	.datad(\ctrl_state.CONV~q ),
	.cin(gnd),
	.combout(\load_dout~0_combout ),
	.cout());
defparam \load_dout~0 .lut_mask = 16'hA888;
defparam \load_dout~0 .sum_lutc_input = "datac";

dffeas \dout_flp[0] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_0),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[0]~q ),
	.prn(vcc));
defparam \dout_flp[0] .is_wysiwyg = "true";
defparam \dout_flp[0] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~0 (
	.dataa(\dout_flp[0]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~0_combout ),
	.cout());
defparam \rsp_data~0 .lut_mask = 16'hA888;
defparam \rsp_data~0 .sum_lutc_input = "datac";

dffeas \dout_flp[1] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_1),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[1]~q ),
	.prn(vcc));
defparam \dout_flp[1] .is_wysiwyg = "true";
defparam \dout_flp[1] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~1 (
	.dataa(\dout_flp[1]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~1_combout ),
	.cout());
defparam \rsp_data~1 .lut_mask = 16'hA888;
defparam \rsp_data~1 .sum_lutc_input = "datac";

dffeas \dout_flp[2] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_2),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[2]~q ),
	.prn(vcc));
defparam \dout_flp[2] .is_wysiwyg = "true";
defparam \dout_flp[2] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~2 (
	.dataa(\dout_flp[2]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~2_combout ),
	.cout());
defparam \rsp_data~2 .lut_mask = 16'hA888;
defparam \rsp_data~2 .sum_lutc_input = "datac";

dffeas \dout_flp[3] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_3),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[3]~q ),
	.prn(vcc));
defparam \dout_flp[3] .is_wysiwyg = "true";
defparam \dout_flp[3] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~3 (
	.dataa(\dout_flp[3]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~3_combout ),
	.cout());
defparam \rsp_data~3 .lut_mask = 16'hA888;
defparam \rsp_data~3 .sum_lutc_input = "datac";

dffeas \dout_flp[4] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_4),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[4]~q ),
	.prn(vcc));
defparam \dout_flp[4] .is_wysiwyg = "true";
defparam \dout_flp[4] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~4 (
	.dataa(\dout_flp[4]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~4_combout ),
	.cout());
defparam \rsp_data~4 .lut_mask = 16'hA888;
defparam \rsp_data~4 .sum_lutc_input = "datac";

dffeas \dout_flp[5] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_5),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[5]~q ),
	.prn(vcc));
defparam \dout_flp[5] .is_wysiwyg = "true";
defparam \dout_flp[5] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~5 (
	.dataa(\dout_flp[5]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~5_combout ),
	.cout());
defparam \rsp_data~5 .lut_mask = 16'hA888;
defparam \rsp_data~5 .sum_lutc_input = "datac";

dffeas \dout_flp[6] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_6),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[6]~q ),
	.prn(vcc));
defparam \dout_flp[6] .is_wysiwyg = "true";
defparam \dout_flp[6] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~6 (
	.dataa(\dout_flp[6]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~6_combout ),
	.cout());
defparam \rsp_data~6 .lut_mask = 16'hA888;
defparam \rsp_data~6 .sum_lutc_input = "datac";

dffeas \dout_flp[7] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_7),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[7]~q ),
	.prn(vcc));
defparam \dout_flp[7] .is_wysiwyg = "true";
defparam \dout_flp[7] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~7 (
	.dataa(\dout_flp[7]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~7_combout ),
	.cout());
defparam \rsp_data~7 .lut_mask = 16'hA888;
defparam \rsp_data~7 .sum_lutc_input = "datac";

dffeas \dout_flp[8] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_8),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[8]~q ),
	.prn(vcc));
defparam \dout_flp[8] .is_wysiwyg = "true";
defparam \dout_flp[8] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~8 (
	.dataa(\dout_flp[8]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~8_combout ),
	.cout());
defparam \rsp_data~8 .lut_mask = 16'hA888;
defparam \rsp_data~8 .sum_lutc_input = "datac";

dffeas \dout_flp[9] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_9),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[9]~q ),
	.prn(vcc));
defparam \dout_flp[9] .is_wysiwyg = "true";
defparam \dout_flp[9] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~9 (
	.dataa(\dout_flp[9]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~9_combout ),
	.cout());
defparam \rsp_data~9 .lut_mask = 16'hA888;
defparam \rsp_data~9 .sum_lutc_input = "datac";

dffeas \dout_flp[10] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_10),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[10]~q ),
	.prn(vcc));
defparam \dout_flp[10] .is_wysiwyg = "true";
defparam \dout_flp[10] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~10 (
	.dataa(\dout_flp[10]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~10_combout ),
	.cout());
defparam \rsp_data~10 .lut_mask = 16'hA888;
defparam \rsp_data~10 .sum_lutc_input = "datac";

dffeas \dout_flp[11] (
	.clk(clk_clk),
	.d(wire_from_adc_dout_11),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\load_dout~0_combout ),
	.q(\dout_flp[11]~q ),
	.prn(vcc));
defparam \dout_flp[11] .is_wysiwyg = "true";
defparam \dout_flp[11] .power_up = "low";

fiftyfivenm_lcell_comb \rsp_data~11 (
	.dataa(\dout_flp[11]~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_data~11_combout ),
	.cout());
defparam \rsp_data~11 .lut_mask = 16'hA888;
defparam \rsp_data~11 .sum_lutc_input = "datac";

dffeas cmd_sop_dly(
	.clk(clk_clk),
	.d(cmd_sop),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\ctrl_state.PUTRESP~q ),
	.q(\cmd_sop_dly~q ),
	.prn(vcc));
defparam cmd_sop_dly.is_wysiwyg = "true";
defparam cmd_sop_dly.power_up = "low";

fiftyfivenm_lcell_comb \rsp_sop~0 (
	.dataa(\cmd_sop_dly~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_sop~0_combout ),
	.cout());
defparam \rsp_sop~0 .lut_mask = 16'hA888;
defparam \rsp_sop~0 .sum_lutc_input = "datac";

dffeas cmd_eop_dly(
	.clk(clk_clk),
	.d(cmd_eop),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\ctrl_state.PUTRESP~q ),
	.q(\cmd_eop_dly~q ),
	.prn(vcc));
defparam cmd_eop_dly.is_wysiwyg = "true";
defparam cmd_eop_dly.power_up = "low";

fiftyfivenm_lcell_comb \rsp_eop~0 (
	.dataa(\cmd_eop_dly~q ),
	.datab(\ctrl_state.PUTRESP_PEND~q ),
	.datac(\ctrl_state.PUTRESP~q ),
	.datad(\load_rsp~0_combout ),
	.cin(gnd),
	.combout(\rsp_eop~0_combout ),
	.cout());
defparam \rsp_eop~0 .lut_mask = 16'hA888;
defparam \rsp_eop~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr12~2 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\Selector7~1_combout ),
	.datad(\Selector6~1_combout ),
	.cin(gnd),
	.combout(\WideOr12~2_combout ),
	.cout());
defparam \WideOr12~2 .lut_mask = 16'h000F;
defparam \WideOr12~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr12~3 (
	.dataa(\u_eoc_synchronizer|dreg[0]~q ),
	.datab(\eoc_synch_dly~q ),
	.datac(\ctrl_state.WAIT_PEND~q ),
	.datad(cmd_ready1),
	.cin(gnd),
	.combout(\WideOr12~3_combout ),
	.cout());
defparam \WideOr12~3 .lut_mask = 16'h00BF;
defparam \WideOr12~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr12~4 (
	.dataa(\ctrl_state.PUTRESP~q ),
	.datab(\ctrl_state.WAIT_PEND_DLY1~q ),
	.datac(\ctrl_state_nxt.GETCMD_W~0_combout ),
	.datad(\ctrl_state.PUTRESP_DLY2~q ),
	.cin(gnd),
	.combout(\WideOr12~4_combout ),
	.cout());
defparam \WideOr12~4 .lut_mask = 16'h0001;
defparam \WideOr12~4 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr12~5 (
	.dataa(\WideOr12~3_combout ),
	.datab(\WideOr12~4_combout ),
	.datac(\Selector10~1_combout ),
	.datad(\Selector8~0_combout ),
	.cin(gnd),
	.combout(\WideOr12~5_combout ),
	.cout());
defparam \WideOr12~5 .lut_mask = 16'h0008;
defparam \WideOr12~5 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr13~2 (
	.dataa(\eoc_synch_dly~q ),
	.datab(\u_eoc_synchronizer|dreg[0]~q ),
	.datac(\ctrl_state.CONV~q ),
	.datad(\Selector9~1_combout ),
	.cin(gnd),
	.combout(\WideOr13~2_combout ),
	.cout());
defparam \WideOr13~2 .lut_mask = 16'h00DF;
defparam \WideOr13~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr15~0 (
	.dataa(\WideOr12~2_combout ),
	.datab(\WideOr12~5_combout ),
	.datac(\WideOr13~2_combout ),
	.datad(\Selector11~1_combout ),
	.cin(gnd),
	.combout(\WideOr15~0_combout ),
	.cout());
defparam \WideOr15~0 .lut_mask = 16'h0080;
defparam \WideOr15~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector17~0 (
	.dataa(\Selector5~1_combout ),
	.datab(soc1),
	.datac(\Selector4~0_combout ),
	.datad(\WideOr15~0_combout ),
	.cin(gnd),
	.combout(\Selector17~0_combout ),
	.cout());
defparam \Selector17~0 .lut_mask = 16'hEAEE;
defparam \Selector17~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr12~6 (
	.dataa(\Selector1~2_combout ),
	.datab(\Selector5~1_combout ),
	.datac(\Selector4~0_combout ),
	.datad(\Selector3~1_combout ),
	.cin(gnd),
	.combout(\WideOr12~6_combout ),
	.cout());
defparam \WideOr12~6 .lut_mask = 16'hFFFE;
defparam \WideOr12~6 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb WideOr12(
	.dataa(\Selector7~1_combout ),
	.datab(\Selector6~1_combout ),
	.datac(\WideOr12~6_combout ),
	.datad(\WideOr12~5_combout ),
	.cin(gnd),
	.combout(\WideOr12~combout ),
	.cout());
defparam WideOr12.lut_mask = 16'h0100;
defparam WideOr12.sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector16~0 (
	.dataa(chsel_0),
	.datab(\WideOr12~combout ),
	.datac(cmd_channel[0]),
	.datad(\WideOr13~2_combout ),
	.cin(gnd),
	.combout(\Selector16~0_combout ),
	.cout());
defparam \Selector16~0 .lut_mask = 16'h22F2;
defparam \Selector16~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector15~0 (
	.dataa(cmd_channel[1]),
	.datab(\Selector11~1_combout ),
	.datac(\WideOr13~2_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector15~0_combout ),
	.cout());
defparam \Selector15~0 .lut_mask = 16'h0101;
defparam \Selector15~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector14~0 (
	.dataa(cmd_channel[4]),
	.datab(\Selector11~1_combout ),
	.datac(\WideOr13~2_combout ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Selector14~0_combout ),
	.cout());
defparam \Selector14~0 .lut_mask = 16'h0101;
defparam \Selector14~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector12~0 (
	.dataa(cmd_channel[4]),
	.datab(\WideOr13~2_combout ),
	.datac(chsel_4),
	.datad(\WideOr12~combout ),
	.cin(gnd),
	.combout(\Selector12~0_combout ),
	.cout());
defparam \Selector12~0 .lut_mask = 16'h11F1;
defparam \Selector12~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector18~0 (
	.dataa(\Selector1~2_combout ),
	.datab(\Selector2~0_combout ),
	.datac(modular_adc_0_adc_pll_locked_export),
	.datad(\ctrl_state.IDLE~q ),
	.cin(gnd),
	.combout(\Selector18~0_combout ),
	.cout());
defparam \Selector18~0 .lut_mask = 16'hEEEF;
defparam \Selector18~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Selector18~1 (
	.dataa(\Selector18~0_combout ),
	.datab(\Selector5~1_combout ),
	.datac(\WideOr15~0_combout ),
	.datad(\usr_pwd~q ),
	.cin(gnd),
	.combout(\Selector18~1_combout ),
	.cout());
defparam \Selector18~1 .lut_mask = 16'h5510;
defparam \Selector18~1 .sum_lutc_input = "datac";

dffeas usr_pwd(
	.clk(clk_clk),
	.d(\Selector18~1_combout ),
	.asdata(vcc),
	.clrn(altera_reset_synchronizer_int_chain_out),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\usr_pwd~q ),
	.prn(vcc));
defparam usr_pwd.is_wysiwyg = "true";
defparam usr_pwd.power_up = "low";

endmodule

module adc_altera_std_synchronizer (
	din,
	reset_n,
	dreg_0,
	clk)/* synthesis synthesis_greybox=0 */;
input 	din;
input 	reset_n;
output 	dreg_0;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;


dffeas \dreg[0] (
	.clk(clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_0),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas din_s1(
	.clk(clk),
	.d(din),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

endmodule

module adc_altera_std_synchronizer_1 (
	din,
	reset_n,
	dreg_0,
	clk)/* synthesis synthesis_greybox=0 */;
input 	din;
input 	reset_n;
output 	dreg_0;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;


dffeas \dreg[0] (
	.clk(clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_0),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas din_s1(
	.clk(clk),
	.d(din),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

endmodule

module adc_fiftyfivenm_adcblock_top_wrapper (
	eoc,
	clkout_adccore,
	wire_from_adc_dout_0,
	wire_from_adc_dout_1,
	wire_from_adc_dout_2,
	wire_from_adc_dout_3,
	wire_from_adc_dout_4,
	wire_from_adc_dout_5,
	wire_from_adc_dout_6,
	wire_from_adc_dout_7,
	wire_from_adc_dout_8,
	wire_from_adc_dout_9,
	wire_from_adc_dout_10,
	wire_from_adc_dout_11,
	soc,
	chsel_0,
	chsel_1,
	chsel_2,
	chsel_4,
	GND_port,
	usr_pwd,
	modular_adc_0_adc_pll_clock_clk)/* synthesis synthesis_greybox=0 */;
output 	eoc;
output 	clkout_adccore;
output 	wire_from_adc_dout_0;
output 	wire_from_adc_dout_1;
output 	wire_from_adc_dout_2;
output 	wire_from_adc_dout_3;
output 	wire_from_adc_dout_4;
output 	wire_from_adc_dout_5;
output 	wire_from_adc_dout_6;
output 	wire_from_adc_dout_7;
output 	wire_from_adc_dout_8;
output 	wire_from_adc_dout_9;
output 	wire_from_adc_dout_10;
output 	wire_from_adc_dout_11;
input 	soc;
input 	chsel_0;
input 	chsel_1;
input 	chsel_2;
input 	chsel_4;
input 	GND_port;
input 	usr_pwd;
input 	modular_adc_0_adc_pll_clock_clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \decoder|WideOr4~0_combout ;
wire \decoder|WideOr3~0_combout ;
wire \decoder|WideOr2~0_combout ;
wire \decoder|WideOr1~0_combout ;
wire \decoder|WideOr0~0_combout ;


adc_chsel_code_converter_sw_to_hw decoder(
	.chsel_0(chsel_0),
	.chsel_1(chsel_1),
	.chsel_2(chsel_2),
	.chsel_4(chsel_4),
	.WideOr4(\decoder|WideOr4~0_combout ),
	.WideOr3(\decoder|WideOr3~0_combout ),
	.WideOr2(\decoder|WideOr2~0_combout ),
	.WideOr1(\decoder|WideOr1~0_combout ),
	.WideOr0(\decoder|WideOr0~0_combout ));

adc_fiftyfivenm_adcblock_primitive_wrapper adcblock_instance(
	.eoc(eoc),
	.clkout_adccore(clkout_adccore),
	.dout({wire_from_adc_dout_11,wire_from_adc_dout_10,wire_from_adc_dout_9,wire_from_adc_dout_8,wire_from_adc_dout_7,wire_from_adc_dout_6,wire_from_adc_dout_5,wire_from_adc_dout_4,wire_from_adc_dout_3,wire_from_adc_dout_2,wire_from_adc_dout_1,wire_from_adc_dout_0}),
	.soc(soc),
	.chsel({\decoder|WideOr0~0_combout ,\decoder|WideOr1~0_combout ,\decoder|WideOr2~0_combout ,\decoder|WideOr3~0_combout ,\decoder|WideOr4~0_combout }),
	.tsen(GND_port),
	.usr_pwd(usr_pwd),
	.clkin_from_pll_c0(modular_adc_0_adc_pll_clock_clk));

endmodule

module adc_chsel_code_converter_sw_to_hw (
	chsel_0,
	chsel_1,
	chsel_2,
	chsel_4,
	WideOr4,
	WideOr3,
	WideOr2,
	WideOr1,
	WideOr0)/* synthesis synthesis_greybox=0 */;
input 	chsel_0;
input 	chsel_1;
input 	chsel_2;
input 	chsel_4;
output 	WideOr4;
output 	WideOr3;
output 	WideOr2;
output 	WideOr1;
output 	WideOr0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



fiftyfivenm_lcell_comb \WideOr4~0 (
	.dataa(chsel_0),
	.datab(chsel_1),
	.datac(chsel_2),
	.datad(chsel_4),
	.cin(gnd),
	.combout(WideOr4),
	.cout());
defparam \WideOr4~0 .lut_mask = 16'h4F7F;
defparam \WideOr4~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr3~0 (
	.dataa(chsel_0),
	.datab(chsel_1),
	.datac(chsel_2),
	.datad(gnd),
	.cin(gnd),
	.combout(WideOr3),
	.cout());
defparam \WideOr3~0 .lut_mask = 16'h7F7F;
defparam \WideOr3~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr2~0 (
	.dataa(chsel_0),
	.datab(chsel_1),
	.datac(chsel_2),
	.datad(chsel_4),
	.cin(gnd),
	.combout(WideOr2),
	.cout());
defparam \WideOr2~0 .lut_mask = 16'h9F7F;
defparam \WideOr2~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr1~0 (
	.dataa(chsel_0),
	.datab(chsel_1),
	.datac(chsel_2),
	.datad(chsel_4),
	.cin(gnd),
	.combout(WideOr1),
	.cout());
defparam \WideOr1~0 .lut_mask = 16'h2F7F;
defparam \WideOr1~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \WideOr0~0 (
	.dataa(chsel_0),
	.datab(chsel_1),
	.datac(chsel_2),
	.datad(chsel_4),
	.cin(gnd),
	.combout(WideOr0),
	.cout());
defparam \WideOr0~0 .lut_mask = 16'h0F7F;
defparam \WideOr0~0 .sum_lutc_input = "datac";

endmodule

module adc_fiftyfivenm_adcblock_primitive_wrapper (
	eoc,
	clkout_adccore,
	dout,
	soc,
	chsel,
	tsen,
	usr_pwd,
	clkin_from_pll_c0)/* synthesis synthesis_greybox=0 */;
output 	eoc;
output 	clkout_adccore;
output 	[11:0] dout;
input 	soc;
input 	[4:0] chsel;
input 	tsen;
input 	usr_pwd;
input 	clkin_from_pll_c0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [11:0] primitive_instance_DOUT_bus;

assign dout[0] = primitive_instance_DOUT_bus[0];
assign dout[1] = primitive_instance_DOUT_bus[1];
assign dout[2] = primitive_instance_DOUT_bus[2];
assign dout[3] = primitive_instance_DOUT_bus[3];
assign dout[4] = primitive_instance_DOUT_bus[4];
assign dout[5] = primitive_instance_DOUT_bus[5];
assign dout[6] = primitive_instance_DOUT_bus[6];
assign dout[7] = primitive_instance_DOUT_bus[7];
assign dout[8] = primitive_instance_DOUT_bus[8];
assign dout[9] = primitive_instance_DOUT_bus[9];
assign dout[10] = primitive_instance_DOUT_bus[10];
assign dout[11] = primitive_instance_DOUT_bus[11];

fiftyfivenm_adcblock primitive_instance(
	.soc(soc),
	.usr_pwd(usr_pwd),
	.tsen(tsen),
	.clkin_from_pll_c0(clkin_from_pll_c0),
	.chsel({chsel[4],chsel[3],chsel[2],chsel[1],chsel[0]}),
	.eoc(eoc),
	.dout(primitive_instance_DOUT_bus));
defparam primitive_instance.analog_input_pin_mask = 7;
defparam primitive_instance.clkdiv = 2;
defparam primitive_instance.device_partname_fivechar_prefix = "10m50";
defparam primitive_instance.is_this_first_or_second_adc = 1;
defparam primitive_instance.prescalar = 0;
defparam primitive_instance.pwd = 0;
defparam primitive_instance.refsel = 1;
defparam primitive_instance.reserve_block = "false";
defparam primitive_instance.testbits = 66;
defparam primitive_instance.tsclkdiv = 0;
defparam primitive_instance.tsclksel = 1;

endmodule

module adc_altera_modular_adc_sequencer (
	cmd_channel_1,
	readdata_0,
	readdata_1,
	readdata_2,
	readdata_3,
	cmd_channel_4,
	cmd_channel_0,
	altera_reset_synchronizer_int_chain_out,
	cmd_ready,
	cmd_sop,
	cmd_eop,
	cmd_valid,
	clk_clk,
	modular_adc_0_sequencer_csr_read,
	modular_adc_0_sequencer_csr_address,
	modular_adc_0_sequencer_csr_writedata_0,
	modular_adc_0_sequencer_csr_write,
	modular_adc_0_sequencer_csr_writedata_1,
	modular_adc_0_sequencer_csr_writedata_2,
	modular_adc_0_sequencer_csr_writedata_3)/* synthesis synthesis_greybox=0 */;
output 	cmd_channel_1;
output 	readdata_0;
output 	readdata_1;
output 	readdata_2;
output 	readdata_3;
output 	cmd_channel_4;
output 	cmd_channel_0;
input 	altera_reset_synchronizer_int_chain_out;
input 	cmd_ready;
output 	cmd_sop;
output 	cmd_eop;
output 	cmd_valid;
input 	clk_clk;
input 	modular_adc_0_sequencer_csr_read;
input 	modular_adc_0_sequencer_csr_address;
input 	modular_adc_0_sequencer_csr_writedata_0;
input 	modular_adc_0_sequencer_csr_write;
input 	modular_adc_0_sequencer_csr_writedata_1;
input 	modular_adc_0_sequencer_csr_writedata_2;
input 	modular_adc_0_sequencer_csr_writedata_3;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \u_seq_csr|run~q ;
wire \u_seq_csr|mode[0]~q ;
wire \u_seq_csr|mode[1]~q ;
wire \u_seq_csr|mode[2]~q ;
wire \u_seq_csr|Equal2~0_combout ;
wire \u_seq_csr|sw_clr_run~q ;
wire \u_seq_ctrl|seq_state~q ;
wire \u_seq_ctrl|always1~3_combout ;


adc_altera_modular_adc_sequencer_csr u_seq_csr(
	.readdata_0(readdata_0),
	.readdata_1(readdata_1),
	.readdata_2(readdata_2),
	.readdata_3(readdata_3),
	.rst_n(altera_reset_synchronizer_int_chain_out),
	.run1(\u_seq_csr|run~q ),
	.mode_0(\u_seq_csr|mode[0]~q ),
	.mode_1(\u_seq_csr|mode[1]~q ),
	.mode_2(\u_seq_csr|mode[2]~q ),
	.Equal2(\u_seq_csr|Equal2~0_combout ),
	.sw_clr_run1(\u_seq_csr|sw_clr_run~q ),
	.seq_state(\u_seq_ctrl|seq_state~q ),
	.always1(\u_seq_ctrl|always1~3_combout ),
	.clk(clk_clk),
	.modular_adc_0_sequencer_csr_read(modular_adc_0_sequencer_csr_read),
	.modular_adc_0_sequencer_csr_address(modular_adc_0_sequencer_csr_address),
	.modular_adc_0_sequencer_csr_writedata_0(modular_adc_0_sequencer_csr_writedata_0),
	.modular_adc_0_sequencer_csr_write(modular_adc_0_sequencer_csr_write),
	.writedata({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,modular_adc_0_sequencer_csr_writedata_3,modular_adc_0_sequencer_csr_writedata_2,modular_adc_0_sequencer_csr_writedata_1,gnd}));

adc_altera_modular_adc_sequencer_ctrl u_seq_ctrl(
	.cmd_channel_1(cmd_channel_1),
	.cmd_channel_4(cmd_channel_4),
	.cmd_channel_0(cmd_channel_0),
	.rst_n(altera_reset_synchronizer_int_chain_out),
	.run(\u_seq_csr|run~q ),
	.mode_0(\u_seq_csr|mode[0]~q ),
	.mode_1(\u_seq_csr|mode[1]~q ),
	.mode_2(\u_seq_csr|mode[2]~q ),
	.Equal2(\u_seq_csr|Equal2~0_combout ),
	.sw_clr_run(\u_seq_csr|sw_clr_run~q ),
	.cmd_ready(cmd_ready),
	.seq_state1(\u_seq_ctrl|seq_state~q ),
	.cmd_sop1(cmd_sop),
	.cmd_eop1(cmd_eop),
	.always1(\u_seq_ctrl|always1~3_combout ),
	.cmd_valid1(cmd_valid),
	.clk(clk_clk));

endmodule

module adc_altera_modular_adc_sequencer_csr (
	readdata_0,
	readdata_1,
	readdata_2,
	readdata_3,
	rst_n,
	run1,
	mode_0,
	mode_1,
	mode_2,
	Equal2,
	sw_clr_run1,
	seq_state,
	always1,
	clk,
	modular_adc_0_sequencer_csr_read,
	modular_adc_0_sequencer_csr_address,
	modular_adc_0_sequencer_csr_writedata_0,
	modular_adc_0_sequencer_csr_write,
	writedata)/* synthesis synthesis_greybox=0 */;
output 	readdata_0;
output 	readdata_1;
output 	readdata_2;
output 	readdata_3;
input 	rst_n;
output 	run1;
output 	mode_0;
output 	mode_1;
output 	mode_2;
output 	Equal2;
output 	sw_clr_run1;
input 	seq_state;
input 	always1;
input 	clk;
input 	modular_adc_0_sequencer_csr_read;
input 	modular_adc_0_sequencer_csr_address;
input 	modular_adc_0_sequencer_csr_writedata_0;
input 	modular_adc_0_sequencer_csr_write;
input 	[31:0] writedata;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \readdata_nxt[0]~0_combout ;
wire \readdata_nxt[1]~1_combout ;
wire \readdata_nxt[2]~2_combout ;
wire \readdata_nxt[3]~3_combout ;
wire \run~0_combout ;
wire \run~1_combout ;
wire \always0~0_combout ;
wire \sw_clr_run~0_combout ;
wire \sw_clr_run~1_combout ;
wire \sw_clr_run~2_combout ;


dffeas \readdata[0] (
	.clk(clk),
	.d(\readdata_nxt[0]~0_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(readdata_0),
	.prn(vcc));
defparam \readdata[0] .is_wysiwyg = "true";
defparam \readdata[0] .power_up = "low";

dffeas \readdata[1] (
	.clk(clk),
	.d(\readdata_nxt[1]~1_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(readdata_1),
	.prn(vcc));
defparam \readdata[1] .is_wysiwyg = "true";
defparam \readdata[1] .power_up = "low";

dffeas \readdata[2] (
	.clk(clk),
	.d(\readdata_nxt[2]~2_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(readdata_2),
	.prn(vcc));
defparam \readdata[2] .is_wysiwyg = "true";
defparam \readdata[2] .power_up = "low";

dffeas \readdata[3] (
	.clk(clk),
	.d(\readdata_nxt[3]~3_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(readdata_3),
	.prn(vcc));
defparam \readdata[3] .is_wysiwyg = "true";
defparam \readdata[3] .power_up = "low";

dffeas run(
	.clk(clk),
	.d(\run~1_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(run1),
	.prn(vcc));
defparam run.is_wysiwyg = "true";
defparam run.power_up = "low";

dffeas \mode[0] (
	.clk(clk),
	.d(writedata[1]),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\always0~0_combout ),
	.q(mode_0),
	.prn(vcc));
defparam \mode[0] .is_wysiwyg = "true";
defparam \mode[0] .power_up = "low";

dffeas \mode[1] (
	.clk(clk),
	.d(writedata[2]),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\always0~0_combout ),
	.q(mode_1),
	.prn(vcc));
defparam \mode[1] .is_wysiwyg = "true";
defparam \mode[1] .power_up = "low";

dffeas \mode[2] (
	.clk(clk),
	.d(writedata[3]),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\always0~0_combout ),
	.q(mode_2),
	.prn(vcc));
defparam \mode[2] .is_wysiwyg = "true";
defparam \mode[2] .power_up = "low";

fiftyfivenm_lcell_comb \Equal2~0 (
	.dataa(gnd),
	.datab(mode_0),
	.datac(mode_1),
	.datad(mode_2),
	.cin(gnd),
	.combout(Equal2),
	.cout());
defparam \Equal2~0 .lut_mask = 16'h3FFF;
defparam \Equal2~0 .sum_lutc_input = "datac";

dffeas sw_clr_run(
	.clk(clk),
	.d(\sw_clr_run~2_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(sw_clr_run1),
	.prn(vcc));
defparam sw_clr_run.is_wysiwyg = "true";
defparam sw_clr_run.power_up = "low";

fiftyfivenm_lcell_comb \readdata_nxt[0]~0 (
	.dataa(run1),
	.datab(modular_adc_0_sequencer_csr_read),
	.datac(gnd),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\readdata_nxt[0]~0_combout ),
	.cout());
defparam \readdata_nxt[0]~0 .lut_mask = 16'h0088;
defparam \readdata_nxt[0]~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \readdata_nxt[1]~1 (
	.dataa(modular_adc_0_sequencer_csr_read),
	.datab(mode_0),
	.datac(gnd),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\readdata_nxt[1]~1_combout ),
	.cout());
defparam \readdata_nxt[1]~1 .lut_mask = 16'h0088;
defparam \readdata_nxt[1]~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \readdata_nxt[2]~2 (
	.dataa(modular_adc_0_sequencer_csr_read),
	.datab(mode_1),
	.datac(gnd),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\readdata_nxt[2]~2_combout ),
	.cout());
defparam \readdata_nxt[2]~2 .lut_mask = 16'h0088;
defparam \readdata_nxt[2]~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \readdata_nxt[3]~3 (
	.dataa(modular_adc_0_sequencer_csr_read),
	.datab(mode_2),
	.datac(gnd),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\readdata_nxt[3]~3_combout ),
	.cout());
defparam \readdata_nxt[3]~3 .lut_mask = 16'h0088;
defparam \readdata_nxt[3]~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \run~0 (
	.dataa(run1),
	.datab(modular_adc_0_sequencer_csr_writedata_0),
	.datac(modular_adc_0_sequencer_csr_write),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\run~0_combout ),
	.cout());
defparam \run~0 .lut_mask = 16'hAAEA;
defparam \run~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \run~1 (
	.dataa(\run~0_combout ),
	.datab(always1),
	.datac(gnd),
	.datad(seq_state),
	.cin(gnd),
	.combout(\run~1_combout ),
	.cout());
defparam \run~1 .lut_mask = 16'h88AA;
defparam \run~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \always0~0 (
	.dataa(modular_adc_0_sequencer_csr_write),
	.datab(gnd),
	.datac(run1),
	.datad(modular_adc_0_sequencer_csr_address),
	.cin(gnd),
	.combout(\always0~0_combout ),
	.cout());
defparam \always0~0 .lut_mask = 16'h000A;
defparam \always0~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \sw_clr_run~0 (
	.dataa(modular_adc_0_sequencer_csr_write),
	.datab(modular_adc_0_sequencer_csr_address),
	.datac(mode_1),
	.datad(mode_2),
	.cin(gnd),
	.combout(\sw_clr_run~0_combout ),
	.cout());
defparam \sw_clr_run~0 .lut_mask = 16'h0002;
defparam \sw_clr_run~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \sw_clr_run~1 (
	.dataa(run1),
	.datab(\sw_clr_run~0_combout ),
	.datac(mode_0),
	.datad(modular_adc_0_sequencer_csr_writedata_0),
	.cin(gnd),
	.combout(\sw_clr_run~1_combout ),
	.cout());
defparam \sw_clr_run~1 .lut_mask = 16'h0008;
defparam \sw_clr_run~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \sw_clr_run~2 (
	.dataa(always1),
	.datab(sw_clr_run1),
	.datac(\sw_clr_run~1_combout ),
	.datad(seq_state),
	.cin(gnd),
	.combout(\sw_clr_run~2_combout ),
	.cout());
defparam \sw_clr_run~2 .lut_mask = 16'hA8FC;
defparam \sw_clr_run~2 .sum_lutc_input = "datac";

endmodule

module adc_altera_modular_adc_sequencer_ctrl (
	cmd_channel_1,
	cmd_channel_4,
	cmd_channel_0,
	rst_n,
	run,
	mode_0,
	mode_1,
	mode_2,
	Equal2,
	sw_clr_run,
	cmd_ready,
	seq_state1,
	cmd_sop1,
	cmd_eop1,
	always1,
	cmd_valid1,
	clk)/* synthesis synthesis_greybox=0 */;
output 	cmd_channel_1;
output 	cmd_channel_4;
output 	cmd_channel_0;
input 	rst_n;
input 	run;
input 	mode_0;
input 	mode_1;
input 	mode_2;
input 	Equal2;
input 	sw_clr_run;
input 	cmd_ready;
output 	seq_state1;
output 	cmd_sop1;
output 	cmd_eop1;
output 	always1;
output 	cmd_valid1;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \always1~0_combout ;
wire \slot_sel_nxt[0]~0_combout ;
wire \slot_sel[0]~q ;
wire \slot_sel_nxt[1]~1_combout ;
wire \slot_sel_nxt[1]~2_combout ;
wire \slot_sel[1]~q ;
wire \always1~1_combout ;
wire \always1~2_combout ;
wire \valid_req~0_combout ;
wire \cmd_channel[1]~0_combout ;
wire \cmd_channel[1]~8_combout ;
wire \cmd_channel[1]~6_combout ;
wire \cmd_channel~7_combout ;
wire \cmd_valid~0_combout ;
wire \cmd_channel~5_combout ;
wire \seq_state_nxt~0_combout ;
wire \cmd_sop~0_combout ;
wire \cmd_sop~1_combout ;
wire \cmd_eop~0_combout ;


dffeas \cmd_channel[1] (
	.clk(clk),
	.d(\cmd_channel[1]~0_combout ),
	.asdata(\slot_sel_nxt[1]~2_combout ),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(\cmd_channel[1]~8_combout ),
	.ena(\cmd_channel[1]~6_combout ),
	.q(cmd_channel_1),
	.prn(vcc));
defparam \cmd_channel[1] .is_wysiwyg = "true";
defparam \cmd_channel[1] .power_up = "low";

dffeas \cmd_channel[4] (
	.clk(clk),
	.d(\cmd_channel~7_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cmd_valid~0_combout ),
	.q(cmd_channel_4),
	.prn(vcc));
defparam \cmd_channel[4] .is_wysiwyg = "true";
defparam \cmd_channel[4] .power_up = "low";

dffeas \cmd_channel[0] (
	.clk(clk),
	.d(\cmd_channel~5_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cmd_channel[1]~6_combout ),
	.q(cmd_channel_0),
	.prn(vcc));
defparam \cmd_channel[0] .is_wysiwyg = "true";
defparam \cmd_channel[0] .power_up = "low";

dffeas seq_state(
	.clk(clk),
	.d(\seq_state_nxt~0_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(seq_state1),
	.prn(vcc));
defparam seq_state.is_wysiwyg = "true";
defparam seq_state.power_up = "low";

dffeas cmd_sop(
	.clk(clk),
	.d(\cmd_sop~1_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cmd_channel[1]~6_combout ),
	.q(cmd_sop1),
	.prn(vcc));
defparam cmd_sop.is_wysiwyg = "true";
defparam cmd_sop.power_up = "low";

dffeas cmd_eop(
	.clk(clk),
	.d(\cmd_eop~0_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cmd_channel[1]~6_combout ),
	.q(cmd_eop1),
	.prn(vcc));
defparam cmd_eop.is_wysiwyg = "true";
defparam cmd_eop.power_up = "low";

fiftyfivenm_lcell_comb \always1~3 (
	.dataa(\always1~2_combout ),
	.datab(Equal2),
	.datac(\always1~1_combout ),
	.datad(cmd_ready),
	.cin(gnd),
	.combout(always1),
	.cout());
defparam \always1~3 .lut_mask = 16'hEAFF;
defparam \always1~3 .sum_lutc_input = "datac";

dffeas cmd_valid(
	.clk(clk),
	.d(\cmd_channel[1]~0_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\cmd_valid~0_combout ),
	.q(cmd_valid1),
	.prn(vcc));
defparam cmd_valid.is_wysiwyg = "true";
defparam cmd_valid.power_up = "low";

fiftyfivenm_lcell_comb \always1~0 (
	.dataa(run),
	.datab(mode_0),
	.datac(mode_1),
	.datad(mode_2),
	.cin(gnd),
	.combout(\always1~0_combout ),
	.cout());
defparam \always1~0 .lut_mask = 16'h800A;
defparam \always1~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \slot_sel_nxt[0]~0 (
	.dataa(seq_state1),
	.datab(Equal2),
	.datac(\slot_sel[0]~q ),
	.datad(cmd_ready),
	.cin(gnd),
	.combout(\slot_sel_nxt[0]~0_combout ),
	.cout());
defparam \slot_sel_nxt[0]~0 .lut_mask = 16'h08A0;
defparam \slot_sel_nxt[0]~0 .sum_lutc_input = "datac";

dffeas \slot_sel[0] (
	.clk(clk),
	.d(\slot_sel_nxt[0]~0_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\slot_sel[0]~q ),
	.prn(vcc));
defparam \slot_sel[0] .is_wysiwyg = "true";
defparam \slot_sel[0] .power_up = "low";

fiftyfivenm_lcell_comb \slot_sel_nxt[1]~1 (
	.dataa(Equal2),
	.datab(\slot_sel[1]~q ),
	.datac(\slot_sel[0]~q ),
	.datad(cmd_ready),
	.cin(gnd),
	.combout(\slot_sel_nxt[1]~1_combout ),
	.cout());
defparam \slot_sel_nxt[1]~1 .lut_mask = 16'h28CC;
defparam \slot_sel_nxt[1]~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \slot_sel_nxt[1]~2 (
	.dataa(seq_state1),
	.datab(\slot_sel_nxt[1]~1_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\slot_sel_nxt[1]~2_combout ),
	.cout());
defparam \slot_sel_nxt[1]~2 .lut_mask = 16'h8888;
defparam \slot_sel_nxt[1]~2 .sum_lutc_input = "datac";

dffeas \slot_sel[1] (
	.clk(clk),
	.d(\slot_sel_nxt[1]~2_combout ),
	.asdata(vcc),
	.clrn(rst_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\slot_sel[1]~q ),
	.prn(vcc));
defparam \slot_sel[1] .is_wysiwyg = "true";
defparam \slot_sel[1] .power_up = "low";

fiftyfivenm_lcell_comb \always1~1 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\slot_sel[1]~q ),
	.datad(\slot_sel[0]~q ),
	.cin(gnd),
	.combout(\always1~1_combout ),
	.cout());
defparam \always1~1 .lut_mask = 16'h0FFF;
defparam \always1~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \always1~2 (
	.dataa(mode_1),
	.datab(mode_2),
	.datac(mode_0),
	.datad(sw_clr_run),
	.cin(gnd),
	.combout(\always1~2_combout ),
	.cout());
defparam \always1~2 .lut_mask = 16'h006F;
defparam \always1~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \valid_req~0 (
	.dataa(Equal2),
	.datab(\always1~1_combout ),
	.datac(\always1~2_combout ),
	.datad(cmd_ready),
	.cin(gnd),
	.combout(\valid_req~0_combout ),
	.cout());
defparam \valid_req~0 .lut_mask = 16'h07FF;
defparam \valid_req~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_channel[1]~0 (
	.dataa(\always1~0_combout ),
	.datab(\valid_req~0_combout ),
	.datac(gnd),
	.datad(seq_state1),
	.cin(gnd),
	.combout(\cmd_channel[1]~0_combout ),
	.cout());
defparam \cmd_channel[1]~0 .lut_mask = 16'h33AA;
defparam \cmd_channel[1]~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_channel[1]~8 (
	.dataa(mode_0),
	.datab(mode_1),
	.datac(mode_2),
	.datad(\cmd_channel[1]~0_combout ),
	.cin(gnd),
	.combout(\cmd_channel[1]~8_combout ),
	.cout());
defparam \cmd_channel[1]~8 .lut_mask = 16'h7F00;
defparam \cmd_channel[1]~8 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_channel[1]~6 (
	.dataa(cmd_ready),
	.datab(\cmd_channel[1]~0_combout ),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\cmd_channel[1]~6_combout ),
	.cout());
defparam \cmd_channel[1]~6 .lut_mask = 16'hEEEE;
defparam \cmd_channel[1]~6 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_channel~7 (
	.dataa(mode_0),
	.datab(mode_1),
	.datac(mode_2),
	.datad(\cmd_channel[1]~0_combout ),
	.cin(gnd),
	.combout(\cmd_channel~7_combout ),
	.cout());
defparam \cmd_channel~7 .lut_mask = 16'h8000;
defparam \cmd_channel~7 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_valid~0 (
	.dataa(cmd_ready),
	.datab(\always1~0_combout ),
	.datac(gnd),
	.datad(seq_state1),
	.cin(gnd),
	.combout(\cmd_valid~0_combout ),
	.cout());
defparam \cmd_valid~0 .lut_mask = 16'hAAEE;
defparam \cmd_valid~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_channel~5 (
	.dataa(\cmd_channel[1]~0_combout ),
	.datab(\slot_sel_nxt[0]~0_combout ),
	.datac(gnd),
	.datad(Equal2),
	.cin(gnd),
	.combout(\cmd_channel~5_combout ),
	.cout());
defparam \cmd_channel~5 .lut_mask = 16'h88AA;
defparam \cmd_channel~5 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \seq_state_nxt~0 (
	.dataa(always1),
	.datab(\always1~0_combout ),
	.datac(gnd),
	.datad(seq_state1),
	.cin(gnd),
	.combout(\seq_state_nxt~0_combout ),
	.cout());
defparam \seq_state_nxt~0 .lut_mask = 16'hAACC;
defparam \seq_state_nxt~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_sop~0 (
	.dataa(cmd_ready),
	.datab(\slot_sel[1]~q ),
	.datac(\slot_sel[0]~q ),
	.datad(Equal2),
	.cin(gnd),
	.combout(\cmd_sop~0_combout ),
	.cout());
defparam \cmd_sop~0 .lut_mask = 16'h81AB;
defparam \cmd_sop~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_sop~1 (
	.dataa(\cmd_channel[1]~0_combout ),
	.datab(\cmd_sop~0_combout ),
	.datac(Equal2),
	.datad(seq_state1),
	.cin(gnd),
	.combout(\cmd_sop~1_combout ),
	.cout());
defparam \cmd_sop~1 .lut_mask = 16'h8AAA;
defparam \cmd_sop~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \cmd_eop~0 (
	.dataa(\cmd_channel[1]~0_combout ),
	.datab(\slot_sel_nxt[0]~0_combout ),
	.datac(\slot_sel_nxt[1]~1_combout ),
	.datad(Equal2),
	.cin(gnd),
	.combout(\cmd_eop~0_combout ),
	.cout());
defparam \cmd_eop~0 .lut_mask = 16'h80AA;
defparam \cmd_eop~0 .sum_lutc_input = "datac";

endmodule

module adc_altera_reset_controller (
	altera_reset_synchronizer_int_chain_out,
	clk_clk,
	reset_reset_n)/* synthesis synthesis_greybox=0 */;
output 	altera_reset_synchronizer_int_chain_out;
input 	clk_clk;
input 	reset_reset_n;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



adc_altera_reset_synchronizer_1 alt_rst_sync_uq1(
	.altera_reset_synchronizer_int_chain_out1(altera_reset_synchronizer_int_chain_out),
	.clk(clk_clk),
	.reset_reset_n(reset_reset_n));

endmodule

module adc_altera_reset_synchronizer_1 (
	altera_reset_synchronizer_int_chain_out1,
	clk,
	reset_reset_n)/* synthesis synthesis_greybox=0 */;
output 	altera_reset_synchronizer_int_chain_out1;
input 	clk;
input 	reset_reset_n;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \altera_reset_synchronizer_int_chain[1]~q ;
wire \altera_reset_synchronizer_int_chain[0]~q ;


dffeas altera_reset_synchronizer_int_chain_out(
	.clk(clk),
	.d(\altera_reset_synchronizer_int_chain[0]~q ),
	.asdata(vcc),
	.clrn(reset_reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(altera_reset_synchronizer_int_chain_out1),
	.prn(vcc));
defparam altera_reset_synchronizer_int_chain_out.is_wysiwyg = "true";
defparam altera_reset_synchronizer_int_chain_out.power_up = "low";

dffeas \altera_reset_synchronizer_int_chain[1] (
	.clk(clk),
	.d(vcc),
	.asdata(vcc),
	.clrn(reset_reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\altera_reset_synchronizer_int_chain[1]~q ),
	.prn(vcc));
defparam \altera_reset_synchronizer_int_chain[1] .is_wysiwyg = "true";
defparam \altera_reset_synchronizer_int_chain[1] .power_up = "low";

dffeas \altera_reset_synchronizer_int_chain[0] (
	.clk(clk),
	.d(\altera_reset_synchronizer_int_chain[1]~q ),
	.asdata(vcc),
	.clrn(reset_reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\altera_reset_synchronizer_int_chain[0]~q ),
	.prn(vcc));
defparam \altera_reset_synchronizer_int_chain[0] .is_wysiwyg = "true";
defparam \altera_reset_synchronizer_int_chain[0] .power_up = "low";

endmodule
