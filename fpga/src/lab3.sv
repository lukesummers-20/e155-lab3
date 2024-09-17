module lab3(
    input  logic [3:0] col,
    input  logic reset,
    output logic [3:0] row,
    output logic en1, en2,
    output logic [6:0] sevSegOut
);
    logic clk;
    lab3_oscillator oscillator(reset, clk);

    logic enDecoder;
    fsm_top fsm1(col, clk, reset, row, enDecoder);

    logic[3:0] s1, s2;
    fsm_decoder d1(col, row, enDecoder, clk, reset, s1, s2);

    logic[3:0] sevSegIn;
    inputMultiplexer m1(reset, clk, s1, s2, en1, en2, sevSegIn);

    sevSegLogic l1(sevSegIn, sevSegOut);
endmodule