// Luke Summers lsummers@g.hmc.edu 9/29/2024
// synchronizer for 4 bit signal

module synchronizer_4(
	input  logic [3:0] in,
	input  logic clk, reset,
	output logic [3:0] out
);

	logic [3:0] n;

	always_ff @(posedge clk) begin
		n <= in;
		out <= n;
	end
endmodule
