module dataMemory (
	input logic clk,
	input logic rst,
	input logic [31:0] Address,
	input logic rd,
	input logic wr,
	input logic [31:0] Write_data,
	output logic [31:0] Read_data
);

logic [31:0] mem_array [0:511];

	always_ff @ (posedge clk)
		begin
			if(wr)
				mem_array[Address]<=Write_data;
		end
	always_comb Read_data = rd ? mem_array[Address] : 'Z;
	
endmodule