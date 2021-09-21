module registers(
	input logic clk,
	input logic rst,
	
	input logic RegWrite,
	
	input logic [4:0] Read_register_1,
	input logic [4:0] Read_register_2,
	input logic [4:0] Write_register,
	input logic [31:0] Write_data,
	
	output logic [31:0] Read_data_1,
	output logic [31:0] Read_data_2
);

	integer i;
	logic [31:0] memory_array [0:31];
	
	always_ff @(posedge clk)
		begin
			if (rst)
				for(i = 0; i <= 31; i = i+1)
					memory_array[i] <= 0;
			else if (RegWrite)
				memory_array[Write_register] <= Write_data;
		end
		
	always_comb 
		begin
			Read_data_1 = memory_array[Read_register_1];
			Read_data_2 = memory_array[Read_register_2];
		end

endmodule