module alu_MIP (
    //Controlador 4 bits Mux
    input logic [3:0] ALUOp,

    //INPUT A y B 32 bits 
    input logic [31:0] a,b,
    output logic [31:0] out,
    output logic zero
);

logic [31:0] case_ALU;

always_comb begin : ALU
    case (ALUOp)
        4'b0000 : case_ALU = a & b;
        4'b0001 : case_ALU = a | b;
        4'b0010 : case_ALU = a + b;
        4'b0110 : case_ALU = a - b;
        4'b0111 : case_ALU = (a < b) ? 32'h0000_0001 : 32'h0000_0000;
        default: case_ALU = 32'hzzzz_zzzz;
    endcase
end

always_comb begin
    zero <= (case_ALU == '0) ? 1 : 0;
    out <= case_ALU;
end
    
endmodule

