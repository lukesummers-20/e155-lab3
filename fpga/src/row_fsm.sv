module row_fsm(
    input  logic en, clk, reset,
    output logic [3:0] row
);
    logic [1:0] state, next;

    //state register
    always_ff @(posedge clk) begin
        if (reset == 0) state <= 2'b00;
        else state <= next;
    end

    //next state and output logic
    always_comb
        case(state)
            2'b00: begin
                    if(en) next = 2'b01;
                    else next = 2'b00;
                    row = 4'b0001;
                   end
            2'b01: begin
                    if(en) next = 2'b10;
                    else next = 2'b01;
                    row = 4'b0010;
                   end
            2'b10: begin
                    if(en) next = 2'b11;
                    else next = 2'b10;
                    row = 4'b0100;
                   end
            2'b11: begin
                    if(en) next = 2'b00;
                    else next = 2'b11;
                    row = 4'b1000;
                   end
            default: next = 2'b00;
        endcase
endmodule