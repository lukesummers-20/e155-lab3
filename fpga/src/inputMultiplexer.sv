// Luke Summers lsummers@g.hmc.edu 9/10/24
// time multiplexer for 2 4 bit inputs
module inputMultiplexer(
    input reset, clk,
        input [3:0] s1, s2,
    output logic en1, en2,
    output logic [3:0] sevSegInput
);
    logic [16:0] counter; 
    
    assign en2 = ~en1;
    always_ff @(posedge clk) begin
        if (reset == 0) begin
            en1 <= 1;
            sevSegInput <= s1;
            counter <= 0;
        end else if (counter == 100000) begin
            if (en1) sevSegInput <= s2;
            else sevSegInput <= s1;
            en1 <= ~en1;
            counter <= 0;
        end else counter <= counter + 1;
    end
endmodule