module fsm_decoder(
    input  logic [3:0] col, row,
    input  logic en,
    output logic [3:0] s1, s2,
);
    logic [3:0] next;
    // update signals on en
    always_ff @(posedge en) begin
        s2 <= s1;
        s1 <= next;
    end
    // logic for next signal
    always_comb
        case(row)
            4'b0001: begin
                        case(col)
                            4'b0001: next = 4'b0001;
                            4'b0010: next = 4'b0010;
                            4'b0100: next = 4'b0011;
                            4'b1000: next = 4'b1010;
                            default: next = 4'b0000;
                        endcase
                     end
            4'b0010: begin
                        case(col)
                            4'b0001: next = 4'b0100;
                            4'b0010: next = 4'b0101;
                            4'b0100: next = 4'b0110;
                            4'b1000: next = 4'b1011;
                            default: next = 4'b0000;
                        endcase
                     end
            4'b0100: begin
                        case(col)
                            4'b0001: next = 4'b0111;
                            4'b0010: next = 4'b1000;
                            4'b0100: next = 4'b1001;
                            4'b1000: next = 4'b1100;
                            default: next = 4'b0000;
                        endcase
                     end
            4'b1000: begin
                        case(col)
                        4'b0001: next = 4'b1110;
                        4'b0010: next = 4'b0000;
                        4'b0100: next = 4'b1111;
                        4'b1000: next = 4'b1101;
                            default: next = 4'b0000;
                        endcase
                     end
            default: next = 4'b0000;
        endcase
endmoudle