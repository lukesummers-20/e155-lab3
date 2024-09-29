// Luke Summers lsummers@g.hmc.edu 9/29/2024
// testbench for fsm decoder module

module decoder_tb();
	logic clk, reset, en;

	logic [3:0] col, row, s1, s2;

	fsm_decoder d1(col, row, en, clk, reset, s1, s2);

	always begin
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		en = 0;
		col = 4'b0000;
		row = 4'b0000;
		reset = 0; #20;
		reset = 1; #20;
		reset = 0; #20;
		reset = 1; #20;
		en = 1;
		col = 4'b0001;
		row = 4'b0001; #10;
		en = 0; #20;
		col = 4'b0010;
		row = 4'b0010;
		en = 1; #20;
		en = 0;
	end	
endmodule
