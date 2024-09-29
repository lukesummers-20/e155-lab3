// Luke Summers lsummers@g.hmc.edu 9/29/2024
// testbench for lab 3 top module

// lab 3 top module without internal oscillator
module lab3_for_tb(
    input  logic [3:0] col,
    input  logic reset, clk,
    output logic [3:0] row,
    output logic en1, en2,
    output logic [6:0] sevSegOut
);
	
    logic [3:0] col_sync;
    synchronizer_4 sync1(col, clk, reset, col_sync);

    logic en;
	logic [3:0] row_pressed;
    lab3_fsm fsm1(col_sync, clk, reset, row, row_pressed, en);

    logic[3:0] s1, s2;
    fsm_decoder d1(col, row_pressed, en, clk, reset, s1, s2);

    logic[3:0] sevSegIn;
    inputMultiplexer m1(reset, clk, s1, s2, en1, en2, sevSegIn);

    sevSegLogic d2(sevSegIn, sevSegOut);
endmodule

module lab3_tb();
	logic clk, reset, en1, en2;

	logic [3:0] row, col;

	logic [6:0] sevSegOut;
	
	lab3_for_tb l1(col, reset, clk, row, en1, en2, sevSegOut);

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
		col = 4'b0001; #50;
		col = 4'b0000; #50;
		col = 4'b0100; #50;
		col = 4'b0010; #50;
		col = 4'b0000;
	end

	
endmodule
