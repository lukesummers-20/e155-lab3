// Luke Summers lsummers@g.hmc.edu 9/29/2024
// testbench for lab 3 fsm

module fsm_tb();
	logic clk, reset, en;

	logic [3:0] row, col, row_pressed, col_synced;
	
	synchronizer_4 sync1(col, clk, reset, col_synced);

	lab3_fsm fsm1(col_synced, clk, reset, row, row_pressed, en);

	always begin
		clk = 0; #5;
		clk = 1; #5;
	end

	initial begin
		col = 4'b0000;
		reset = 0; #10;
		reset = 1; #10;
		reset = 0; #10;
		reset = 1; #15; #5;
		col = 4'b0001; #10;
		col = 4'b0000;
	end

	
endmodule
