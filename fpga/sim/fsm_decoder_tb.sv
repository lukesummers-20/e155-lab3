module fsm_decoder_tb();
	logic [3:0] col, row, s1, s2, s1_expected, s2_expected;
	logic en, clk, reset;

	fsm_decoder d1(col, row, en, clk, reset, s1, s2);

	initial begin
		reset = 0;
		clk = 0;
		en = 0;
		s1_expected = 4'b0000;
		s2_expected = 4'b0000; #5;
		clk = 1; #5;
		if (s1 != s1_expected) begin
			$display("s1 = %b s1_expected = %b on reset", s1, s1_expected);
		end
		if (s2 != s2_expected) begin
			$display("s2 = %b s2_expected = %b on reset", s2, s2_expected);
		end
		row = 4'b0001;
		col = 4'b0100;
		clk = 0;
		reset = 1; #5;
		clk = 1; #5;
		if (s1 != s1_expected) begin
			$display("s1 = %b s1_expected = %b on 1", s1, s1_expected);
		end
		if (s2 != s2_expected) begin
			$display("s2 = %b s2_expected = %b on 1", s2, s2_expected);
		end
		en = 1;
		clk = 0; #5;
		s1_expected = 4'b0011;
		clk = 1; #5;
		if (s1 != s1_expected) begin
			$display("s1 = %b s1_expected = %b on 2", s1, s1_expected);
		end
		if (s2 != s2_expected) begin
			$display("s2 = %b s2_expected = %b on 2", s2, s2_expected);
		end
		col = 4'b1000;
		row = 4'b0010;
		clk = 0; #5;
		s2_expected = 4'b0011;
		s1_expected = 4'b1011;
		clk = 1; #5;
		if (s1 != s1_expected) begin
			$display("s1 = %b s1_expected = %b on 3", s1, s1_expected);
		end
		if (s2 != s2_expected) begin
			$display("s2 = %b s2_expected = %b on 3", s2, s2_expected);
		end
		en = 0;
		clk = 0; #5;
		clk = 1; #5;
		if (s1 != s1_expected) begin
			$display("s1 = %b s1_expected = %b on 4", s1, s1_expected);
		end
		if (s2 != s2_expected) begin
			$display("s2 = %b s2_expected = %b on 4", s2, s2_expected);
		end
	end
endmodule