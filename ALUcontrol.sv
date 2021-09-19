module ALUcontrol (
    //InstructionSET [31-26]
    input   logic [5:0] operation,
    //Control BITS
    input   logic [1:0] ALUCtrl,
    output  logic [3:0] ALUOp
);

always_comb begin : FunctionControl
    //MUX ALU
    case (ALUCtrl)
        2'b00 : begin 
				case (operation)
					5'b00000: ALUOp = 4'b000;
					default : ALUOp = 4'b000;
				endcase
				end
        //Selección de operación
        2'b01 : ALUOp = 4'b0001;
        2'b10 : ALUOp = 4'b0010;
        //Greater
        2'b11 : ALUOp = 4'b0011;
        default : ALUOp = 4'b000;
    endcase
end
    
endmodule