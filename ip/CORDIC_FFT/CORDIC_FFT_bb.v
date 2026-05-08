
module CORDIC_FFT (
	areset,
	clk,
	q,
	r,
	x,
	y);	

	input		areset;
	input		clk;
	output	[26:0]	q;
	output	[26:0]	r;
	input	[25:0]	x;
	input	[25:0]	y;
endmodule
