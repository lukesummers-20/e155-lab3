module press_fsm_tb();
	logic clk, reset;
	logic [3:0] col;
	logic enRow, enSwitch, press, enRow_expected, enSwitch_expected, press_expected;
	
	press_fsm fsm1(col, clk, reset, enRow, enSwitch, press);

	initial begin
		reset = 0;
		clk = 0; #5;
		enRow_expected = 1;
		enSwitch_expected = 0;
		press_expected = 0;
		col = 4'b0000; #5;	
		clk = 1; #5;
		reset = 1;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on reset", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on reset", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on reset", press, press_expected);
		end
		clk = 0;
		#5;
		clk = 1; #5;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on first step", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on first step", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on first step", press, press_expected);
		end
		clk = 0; 
		col = 4'b0001; #5;
		enRow_expected = 0;
		enSwitch_expected = 0;
		press_expected = 1;
		clk = 1; #5;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on second step", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on second step", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on second step", press, press_expected);
		end
		clk = 0;
		col = 4'b0000; #5;
		enSwitch_expected = 1;
		press_expected = 0;
		clk = 1; #5;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on third step", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on third step", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on third step", press, press_expected);
		end
		clk = 0;
		col = 4'b0001; #5;
		clk = 1; #5;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on fourth step", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on fourth step", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on fourth step", press, press_expected);
		end
		clk = 0;
		col = 4'b0000; #5;
		enRow_expected = 1;
		enSwitch_expected = 0;
		press_expected = 0;
		clk = 1; #5;
		if (enRow != enRow_expected) begin
			$display("enRow = %b enRow_expected = %b on fifth step", enRow, enRow_expected);
		end
		if (enSwitch != enSwitch_expected) begin
			$display("enSwitch = %b enSwitch_expected = %b on fifth step", enSwitch, enSwitch_expected);
		end
		if (press != press_expected) begin
			$display("press = %b press_expected = %b on fifth step", press, press_expected);
		end
		
	end
endmodule