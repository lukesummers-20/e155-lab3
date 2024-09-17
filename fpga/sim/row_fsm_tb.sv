module row_fsm_tb();
    logic [3:0] row, row_expected;
    logic en, press, clk, reset;

    row_fsm fsm1(en, press, clk, reset, row);

    initial begin
        reset = 0;
        press = 0;
        clk = 0; #5;
        row_expected = 4'b0001;
        en = 1; #5;
        clk = 1; #5;
	    reset = 1;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on reset", row, row_expected);
        end
        clk = 0; #5;
        row_expected = 4'b0010;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on 1 step", row, row_expected);
        end
	    clk = 0; #5;
        row_expected = 4'b0100;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on 2 step", row, row_expected);
        end
	    en = 0;
	    clk = 0; #5;
        row_expected = 4'b0100;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on 3 step", row, row_expected);
        end
        clk = 0;
        en = 1; #5;
        row_expected = 4'b1000;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on 4 step", row, row_expected);
        end
        clk = 0;
        en = 0;
        press = 1; #5;
        row_expected = 4'b0100;
        clk = 1; #5;
        if (row != row_expected) begin
            $display(" row = %b row_expected = %b on 5 step", row, row_expected);
        end
    end
endmodule