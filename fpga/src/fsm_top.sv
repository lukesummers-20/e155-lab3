module fsm_top(
    input  logic [3:0] col,
    input  logic clk, reset,
    output logic [3:0] row,
    output logic enOut
);
    logic innerEn;
    press_fsm fsm1(col, clk, reset, innerEn, enOut);
    row_fsm fsm2(innerEn, clk, reset, row);
endmodule