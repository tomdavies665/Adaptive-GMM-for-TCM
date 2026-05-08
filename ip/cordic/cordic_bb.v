
module cordic (
	areset,
	clk,
	en,
	q,
	r,
	x,
	y);	

	input		areset;
	input		clk;
	input	[0:0]	en;
	output	[13:0]	q;
	output	[13:0]	r;
	input	[12:0]	x;
	input	[12:0]	y;
endmodule
