module fsm_top_tb();
	logic clk, reset;
	logic [3:0] col;
	logic [3:0] row, row_expected;
	logic enOut, enOut_expected;
	
	fsm_top fsm1(col, clk, reset, row, enOut);
	
	initial begin
		reset = 0;
		clk = 0;
		enOut_expected = 0;
		col = 4'b0000;
		row_expected = 4'b0001;
		clk = 1; #5;
		reset = 1;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on reset", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on reset", row, row_expected);
        	end
		clk = 0; #5;
		row_expected = 4'b0010;	
		clk = 1; #5;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on 1", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on 1", row, row_expected);
        	end
		clk = 0;
		col = 4'b0010;
		row_expected = 4'b0100;#5;
		clk = 1; #5;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on 2", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on 2", row, row_expected);
        	end
		clk = 0;
		row_expected = 4'b0010;
		enOut_expected = 1; #5;
		clk = 1; #5;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on 3", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on 3", row, row_expected);
        	end
		clk = 0;
		col = 4'b0000;
		enOut_expected = 0; #5;
		clk = 1; #5;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on 4", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on 4", row, row_expected);
        	end
		clk = 0;
		row_expected = 4'b0100; #5;
		clk = 1; #5;
		if (enOut != enOut_expected) begin
			$display("enOut = %b enOut_expected = %b on 5", enOut, enOut_expected);
		end
		if (row != row_expected) begin
            		$display(" row = %b row_expected = %b on 5", row, row_expected);
        	end
	end
endmodule