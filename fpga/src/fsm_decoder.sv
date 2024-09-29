// Luke Summers lsummers@g.hmc.edu 9/29/2024
// decoder for signals going into the display multiplexer

module fsm_decoder(
    input  logic [3:0] col, row,
    input  logic en, clk, reset,
    output logic [3:0] s1, s2
);
    logic [3:0] next;
	logic switch;
    
    // update signals on en
    always_ff @(posedge clk) begin
        if (reset == 0) begin 
            s1 <= 4'b0000;
            s2 <= 4'b0000;
			switch <= 0;
        end if (en) begin 
            switch <= 1;
        end if (switch)begin
            s1 <= next;
            s2 <= s1;
			switch <= 0;
        end
    end

    // logic for next signal
    always_comb
        case({row, col})
			{4'b0001, 4'b0001}: next = 4'b0001;
			{4'b0001, 4'b0010}: next = 4'b0010;
			{4'b0001, 4'b0100}: next = 4'b0011;
			{4'b0001, 4'b1000}: next = 4'b1010;
			{4'b0010, 4'b0001}: next = 4'b0100;
			{4'b0010, 4'b0010}: next = 4'b0101;
			{4'b0010, 4'b0100}: next = 4'b0110;
			{4'b0010, 4'b1000}: next = 4'b1011;
			{4'b0100, 4'b0001}: next = 4'b0111;
			{4'b0100, 4'b0010}: next = 4'b1000;
			{4'b0100, 4'b0100}: next = 4'b1001;
			{4'b0100, 4'b1000}: next = 4'b1100;
			{4'b1000, 4'b0001}: next = 4'b1110;
			{4'b1000, 4'b0010}: next = 4'b0000;
			{4'b1000, 4'b0100}: next = 4'b1111;
			{4'b1000, 4'b1000}: next = 4'b1101;
            default: next = 4'b1111;
        endcase
endmodule