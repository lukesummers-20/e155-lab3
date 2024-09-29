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
