`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/21 01:03:19
// Design Name: 
// Module Name: SCPU_ctrl_more
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SCPU_ctrl_more (
    output reg ALUSrc_B,
    output reg Branch,
    output reg BranchN,
    output reg CPU_MIO,
    input wire Fun7,
    output reg [1 : 0]Jump,
    input wire MIO_ready,
    output reg MemRW,
    output reg RegWrite,
    output reg [3 : 0] ALU_Control,
    input wire [2 : 0] Fun3,
    output reg [2 : 0] ImmSel,
    output reg [1 : 0] MemtoReg,
    input wire [6 : 0] OPcode
);
    `define CPU_ctrl{ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop}
    wire [3:0] Fun;
    reg [1:0] ALUop;

    always@* begin
        case(OPcode)
            5'b01100:`CPU_ctrl={1'b0,2'b00,1'b1,1'b0,1'b0,1'b0,2'b00,2'b10}; //ALU
            5'b00100:`CPU_ctrl={1'b1,2'b00,1'b1,1'b0,1'b0,1'b0,2'b00,2'b11}; //ALU(i)
            5'b00000:`CPU_ctrl={1'b1,2'b01,1'b1,1'b0,1'b0,1'b0,2'b00,2'b00}; //Load
            5'b01000:`CPU_ctrl={1'b1,2'b00,1'b0,1'b1,1'b0,1'b0,2'b00,2'b00};//store
            5'b11000:begin
                case(Fun3)
                    3'b000:`CPU_ctrl={1'b0,2'b00,1'b0,1'b0,1'b1,1'b0,2'b00,2'b01};//beq
                    3'b001:`CPU_ctrl={1'b0,2'b00,1'b0,1'b0,1'b0,1'b1,2'b00,2'b01};//bne
                endcase
            end        
            5'b11011:`CPU_ctrl={1'b1,2'b10,1'b1,1'b0,1'b0,1'b0,2'b01,2'b11};//jal
            5'b11001:`CPU_ctrl={1'b1,2'b10,1'b1,1'b0,1'b0,1'b0,2'b10,2'b00};//jalr
            5'b01101:`CPU_ctrl={1'b0,2'b11,1'b1,1'b0,1'b0,1'b0,2'b00,2'b00};//lui
            default `CPU_ctrl=11'b0;
        endcase
    end
    always@* begin
        case(OPcode)
            5'b01100:ImmSel=3'b001; //ALU
            5'b00100:ImmSel=3'b001; //ALU(i)
            5'b00000:ImmSel=3'b001; //Load
            5'b01000:ImmSel=3'b010;//store
            5'b11000:ImmSel=3'b011;//beq,bne            
            5'b00100:ImmSel=3'b100;//jal
            5'b11001:ImmSel=3'b001;//jalr
            5'b01101:ImmSel=3'b000;//lui
            default ImmSel=3'b000;
        endcase
    end
    assign Fun={Fun3,Fun7};
    always@*begin
        case(ALUop)
            2'b00:ALU_Control=4'b0010;//add sw
            2'b01:ALU_Control=3'b0110;//sub beq bne
            2'b10:
                case(Fun)
                    4'b0000:ALU_Control=4'b0010;//add
                    4'b0001:ALU_Control=4'b0110;//sub
                    4'b1110:ALU_Control=4'b0000;//and
                    4'b1100:ALU_Control=4'b0001;//or
                    4'b0100:ALU_Control=4'b0111;//slt
                    4'b1010:ALU_Control=4'b1101;//srl
                    4'b1000:ALU_Control=4'b1100;//xor
                    4'b0010:ALU_Control=4'b1110;//sll
                    4'b0110:ALU_Control=4'b1001;//sltu
                    4'b1011:ALU_Control=4'b1111;//sra
                    default:ALU_Control=3'bxxx;
                endcase
            2'b11:
                case(Fun3)
                    3'b000:ALU_Control=4'b0010;//addi
                    3'b010:ALU_Control=4'b0111;//slti
                    3'b011:ALU_Control=4'b1001;//sltiu
                    3'b100:ALU_Control=4'b1100;//xori
                    3'b110:ALU_Control=4'b0001;//ori
                    3'b111:ALU_Control=4'b0000;//andi
                    3'b001:ALU_Control=4'b1110;//slli
                    3'b101:
                        case(Fun7)
                            7'b0_000_000:ALU_Control=4'b1101;//srl
                            7'b0_100_000:ALU_Control=4'b1111;//sra
                        endcase
                endcase
        endcase      
        end  
endmodule                                  
