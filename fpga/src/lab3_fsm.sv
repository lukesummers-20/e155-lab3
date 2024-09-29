// Luke Summers lsummers@g.hmc.edu 9/29/2024
// fsm for lab 3

module lab3_fsm(
    input  logic [3:0] col,
    input  logic clk, reset,
	output logic [3:0] row, row_pressed,
    output logic en
);
    parameter s0 = 4'b0000;
	parameter s1 = 4'b0001;
	parameter s2 = 4'b0010;
	parameter s3 = 4'b0011;
	parameter s4 = 4'b0100;
	parameter s5 = 4'b0101;
	parameter s6 = 4'b0110;
	parameter s7 = 4'b0111;
	parameter s8 = 4'b1000;
	parameter s9 = 4'b1001;
	parameter s10 = 4'b1010;
	parameter s11 = 4'b1011;
	parameter s12 = 4'b1100;
	parameter s13 = 4'b1101;
	parameter s14 = 4'b1110;
	parameter s15 = 4'b1111;
	
	logic [3:0] state = s1;
	logic [3:0] next;
	
	    // state register
    always_ff @(posedge clk) begin
        if (reset == 0) state <= s0;
		else state <= next;
    end

    //next state logic
    always_comb
        case(state)
			//check row 0
            s0: begin
					if (col[0]|col[1]|col[2]|col[3]) next = s10;
					else next = s1; 
				end
			//check row 1
            s1: begin 
					if (col[0]|col[1]|col[2]|col[3]) next = s13;
					else next = s2; 
				end
			//check row 2
			s2: begin 
					if (col[0]|col[1]|col[2]|col[3]) next = s4;
					else next = s3; 
				end
			check row 3
			s3: begin
					if (col[0]|col[1]|col[2]|col[3]) next = s7;
					else next = s0; 
				end
			
			// row 0 pressed
			s4: next = s5;
			s5: next = s6;
			s6: begin
					if (col[0] | col[1] | col[2] | col[3]) next = s6;
					else next = s1;
				end
			
			// row 1 pressed
			s7: next = s8;
			s8: next = s9;
			s9: begin
					if (col[0] | col[1] | col[2] | col[3]) next = s9;
					else next = s2;
				end

			// row 2 pressed
			s10: next = s11;
			s11: next = s12;
			s12: begin
					if (col[0] | col[1] | col[2] | col[3]) next = s12;
					else next = s3;
				end

			// row 3 pressed
			s13: next = s14;
			s14: next = s15;
			s15: begin
					if (col[0] | col[1] | col[2] | col[3]) next = s15;
					else next = s0;
				end
            default: next = s0;
        endcase

    //output logic
    assign row[0] = (state == s0) | (state == s4) | (state == s5) | (state == s6);
	assign row[1] = (state == s1) | (state == s7) | (state == s8) | (state == s9);
	assign row[2] = (state == s2) | (state == s10) | (state == s11) | (state == s12);
	assign row[3] = (state == s3) | (state == s13) | (state == s14) | (state == s15);

	assign row_pressed[0] = (state == s4) | (state == s5) | (state == s6);
	assign row_pressed[1] = (state == s7) | (state == s8) | (state == s9);
	assign row_pressed[2] = (state == s10) | (state == s11) | (state == s12);
	assign row_pressed[3] = (state == s13) | (state == s14) | (state == s15);
	
	assign en = (state == s4) | (state == s7) | (state == s10) | (state == s13);
endmodule