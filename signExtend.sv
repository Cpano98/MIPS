module signExtend(
	input logic [15:0] Instruction,
	output logic [31:0] sign_extend_out
);

	always_comb sign_extend_out = Instruction[15] ? 32'hFFFF0000 + Instruction : 32'h00000000 + Instruction;

endmodule