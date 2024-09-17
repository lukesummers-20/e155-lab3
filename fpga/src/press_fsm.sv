module press_fsm(
    input  logic [3:0] col,
    input  logic clk, reset,
    output logic enRow, enSwitch
);
    logic [3:0] state, next;

    // state register
    always_ff @(posedge clk) begin
        if (reset == 0) state <= 4'b0000;
        else state <= next;
    end

    //next state logic
    always_comb
        case(state)
            4'b0000: begin
                        if (col == 4'b0000) next = 4'b0000;
                        else if (col == 4'b0001) next = 4'b0001;
                        else if (col == 4'b0010) next = 4'b0011;
                        else if (col == 4'b0100) next = 4'b0101;
                        else if (col == 4'b1000) next = 4'b0111;
                        else next = 4'b0000;
                    end
            4'b0001: next = 4'b0010;
            4'b0010: begin
                        if (col[0] == 1) next = 4'b0010;
                        else next = 4'b0000;
                    end
            4'b0011: next = 4'b0100;
            4'b0100: begin
                        if (col[1] == 1) next = 4'b0100;
                        else next = 4'b0000;
                    end
            4'b0101: next = 4'b0110;
            4'b0110: begin
                        if (col[2] == 1) next = 4'b0110;
                        else next = 4'b0000;
                    end
            4'b0111: next = 4'b1000;
            4'b1000: begin
                        if (col[3] == 1) next = 4'b1000;
                        else next = 4'b0000;
                    end
            default: next = 4'b0000;
        endcase

    //output logic
    assign enRow = !(state);
    assign enSwitch = state[0];
endmodule