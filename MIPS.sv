module MIPS(
	input logic clk,
	input logic rst,
	input logic clr,
	output logic [31:0] pc_out
);

//always_comb Write_register = RegDst ? instruction[15:11] : instruction[20:16];

signExtend signExtend(
	.Instruction(Instruction),
	.sign_extend_out(sign_extend_out)
);

control control(
	.clk(clk),
	.rst(rst),
	.Instruction(Instruction[31:26]),
	.zero(zero),
	.RegDst(RegDst),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemToReg(MemToReg),
	.ALUOp(ALUOp),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.PCSrc(PCSrc)
);

pc pc(
	.clk(clk),
	.rst(src),
	.source_Pc(source_Pc),
	.pc(Read_address)
);

mux_module mux_module(
	.A(A),
	.B(B),
	.s(s),
	.out(out)
);

instructionMemory instructionMemory(
	.clk(clk),
	.rst(rst),
	.Read_address(Read_address),
	.Instruction(Instruction)
);

registers registers(
	.clk(clk),
	.rst(rst),
	.RegWrite(RegWrite),
	.Read_register_1(Read_register_1),
	.Read_register_2(Read_register_2),
	.Write_register(Write_register),
	.Write_data(Write_data),
	.Read_data_1(Read_data_1),
	.Read_data_2(Read_data_2)
);

aluControl aluControl(
	.ALUOp(ALUOp),
	.ALU_control_s(ALU_control_s),
	.ALU_contorl_oout(ALU_contorl_oout)
);


alu_z alu_z(
	.Read_data_1(Read_data_1),
	.mux_alu_src(mux_alu_src),
	.control_input(control_input),
	.zero(zero),
	.alu_output(alu_output)
);

dataMemory dataMemory(
	.clk(clk),
	.rst(rst),
	.Address(Address),
	.rd(rd),
	.wr(wr),
	.Write_data(Write_data),
	.Read_data(Read_data)
);

endmodule