typedef enum logic [5:0]
{
	RType       =       6'h00,
    ADDI        =       6'h08,
    LW          =       6'h23,
    SW          =       6'h2B,
    BEQ         =       6'h04,
    JMP         =       6'h02
} opcodes;

module control (
    input logic clk,
	 input logic rst,
    input logic [5:0] Instruction,
	 input logic zero,
    input logic inMux_WriteRegister,
    output logic RegDst,
    output logic Branch,
    output logic MemRead,
    output logic MemToReg,
    output logic [1:0]ALUOp,
    output logic MemWrite,
    output logic ALUSrc,
    output logic RegWrite,
    output logic PCSrc
);


opcodes op;

	// Control Signals
		always_comb begin
		Branch      = '0; //Initial values
		RegDst      = 'X;
		RegWrite    = 'X;
		ALUSrc      = 'X;
		ALUOp     = 2'b00;
		MemWrite    = 'X;
		MemRead     = 'X;
		MemToReg    = 'X;
		PCSrc       = '0;
				
			case (Instruction)
                    ADDI: begin
                        Branch  = 1'b0;
                        RegDst  = 1'b0;
                        RegWrite = 1'b1;
                        ALUSrc = 1'b1;
                        ALUOp = 2'b01;
                        MemWrite = 1'b0;
                        MemRead = 1'b0;
                        MemToReg = 1'b0;
                    end

                    JMP: begin
                        PCSrc = 1'b1;
                        RegDst = 1'b0;
                        RegWrite = 1'b0;
                        ALUSrc = 1'b1;
                        ALUOp = 2'b11;
                        MemWrite = 1'b1;
                        MemRead = 1'b0;
                        MemToReg = 1'b0;
                    end
                    
                    LW: begin
                        Branch = 1'b0;
                        RegDst = 1'b0;
                        RegWrite = 1'b1;
                        ALUSrc = 1'b1;
                        ALUOp = 2'b01;
                        MemWrite = 1'b0;
                        MemRead = 1'b1;
                        MemToReg = 1'b1;
                    end
                    SW: begin
                        Branch = 1'b0;
                        RegDst = 1'b0;
                        RegWrite = 1'b0;
                        ALUSrc = 1'b1;
                        ALUOp = 2'b01;
                        MemWrite = 1'b1;
                        MemRead = 1'b0;
                        MemToReg = 1'b0;
                    end
                    BEQ: begin
                        RegDst = 1'b0;
                        RegWrite = 1'b0;
                        ALUSrc = 1'b0;
                        ALUOp = 2'b10;
                        MemWrite = 1'b0;
                        MemRead = 1'b0;
                        MemToReg = 1'b0;
                        PCSrc = 1'b0;
                        Branch = (zero=='1);
                    end

                    default: begin
                        Branch = 1'b0;
                        RegDst = 1'b0;
                        RegWrite = 1'b0;
                        ALUSrc = 1'b0;
                        ALUOp = 2'b00;
                        MemWrite = 1'b0;
                        MemRead = 1'b0;
                        MemToReg = 1'b0;
                        PCSrc = 1'b0;
                    end
			endcase
		end
    
endmodule