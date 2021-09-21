module instructionMemory(
	input logic clk,
	input logic rst,
	
	input logic [31:0] Read_address,
	output logic [31:0] Instruction
);

	logic [31:0] memory_array [0:1023];
	
	always @(posedge clk)
		begin
			Instruction <= memory_array[Read_address];
		end
	
endmodule