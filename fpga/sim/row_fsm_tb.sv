module row_fsm_tb();
    logic [3:0] row, row_expected;
    logic en, clk, reset;

    row_fsm fsm1(en, clk, reset, row);

    initial begin
        reset = 0;
        clk = 0; #5;
        row_expected = 4'b0001;
        en = 1; #5;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on reset", row, row_expected);
        end
        clk = 0; #5;
        row_expected = 4'b0010;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on first step", row, row_expected);
        end
    end
endmodule