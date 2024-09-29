// Luke Summers lsummers@g.hmc.edu 9/29/2024
// top module for lab 3

module lab3(
    input  logic [3:0] col,
    input  logic reset,
    output logic [3:0] row,
    output logic en1, en2,
    output logic [6:0] sevSegOut
);
    logic clk;
    lab3_oscillator oscillator(reset, clk);
	
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