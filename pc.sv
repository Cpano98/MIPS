module pc (
	input logic clk, rst, source_Pc,
	output logic [31:0] pc
);

logic [31:0] pc_d,pc_q,pc_inc;
logic [31:0] offshift;

always_comb begin : ADD
    pc_inc  = pc_q + 1;
end

always_comb begin : mux
    pc_d = (source_Pc) ? (offshift + pc_inc) : pc_inc;
end

always_comb pc = pc_q;
    
endmodule