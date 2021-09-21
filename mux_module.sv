module mux_module(
	input logic [31:0] A,
	input logic [31:0] B,
	input logic s,
	output logic [31:0] out

);

	always_comb out = (s == 0) ? A:
							(s == 1) ? B:
							1'bx;
endmodule