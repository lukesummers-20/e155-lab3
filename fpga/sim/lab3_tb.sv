module lab3_for_tb(
    input  logic [3:0] col,
    input  logic clk, reset,
    output logic [3:0] row,
    output logic en1, en2,
    output logic [6:0] sevSegOut
);

    logic enDecoder;
    fsm_top fsm1(col, clk, reset, row, enDecoder);

    logic[3:0] s1, s2;
    fsm_decoder d1(col, row, enDecoder, clk, reset, s1, s2);

    logic[3:0] sevSegIn;
    inputMultiplexer m1(reset, clk, s1, s2, en1, en2, sevSegIn);

    sevSegLogic l1(sevSegIn, sevSegOut);
endmodule

module lab3_tb();
    logic clk, reset;
    logic [3:0] col, row;
    logic en1, en2;
    logic [6:0] seg;

    lab3_for_tb m1(col, clk, reset, row, en1, en2, seg);

    initial begin
        reset = 0;
        clk = 0;
        col = 4'b0000; #5;
        clk = 1; #5;
        clk = 0; #5;
        clk = 1; #5;
        clk = 0; #5;
        clk = 1; #5;
        clk = 0; #5;
        clk = 1; #5;
        clk = 0; #5;
        clk = 1; #5;
        clk = 0; #5;
        clk = 1; #5;
        clk = 0; #5;
    end
endmodule