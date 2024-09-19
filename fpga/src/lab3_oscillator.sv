// Luke Summers lsummers@g.hmc.edu 9/10/24
// 48 MHz oscillating signal producing module
module lab3_oscillator(
    input  logic reset,
    output logic oscOut
);
    logic intOsc;
	logic [18:0] counter;

    // Internal high-speed oscillator
    HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(intOsc));

    always_ff @(posedge intOsc)
        if (reset == 0) begin
            oscOut <= 0;
			counter <= 0;
		end else if (counter == 125000) begin
			oscOut <= ~oscOut;
			counter <= 0;
        end else counter <= counter + 1;
endmodule