`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/20 16:25:29
// Design Name: 
// Module Name: SCPU_ctrl
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


module SCPU_ctrl(
    input[4:0]OPcode,
    input[2:0]Fun3,
    input Fun7,
    input MIO_ready,
    output reg [1:0]ImmSel,
    output reg ALUSrc_B,
    output reg [1:0]MemtoReg,
    output reg Jump,
    output reg Branch,
    output reg BranchN,
    output reg RegWrite,
    output reg MemRW,
    output reg [2:0]ALU_Control,
    output reg CPU_MIO
    );
    
    reg [1:0]ALUop;
    
    always@* begin
        case(OPcode)
        5'b00000:begin ImmSel<=2'b00; end
        5'b00100:begin ImmSel<=2'b00; end
        5'b01000:begin ImmSel<=2'b01; end
        5'b11000:begin ImmSel<=2'b10; end
        5'b11011:begin ImmSel<=2'b11; end
        endcase
    end
    
    always@* begin
        case(OPcode)
        5'b01100:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b000100010; end
        5'b01000:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b100010000; end
        5'b00000:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b101100000; end
        5'b11000:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b000001001; end
        5'b11011:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b110100100; end
        5'b00100:begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop} = 9'b100100011; end
        endcase
    end
    
    always @* begin
        case(ALUop)
        2'b00: ALU_Control = 3'b010 ;
        2'b01: ALU_Control = 3'b110 ;
        2'b10: 
            case({Fun3,Fun7})
            4'b0000: ALU_Control = 3'b010 ;
            4'b0001: ALU_Control = 3'b110 ;
            4'b1110: ALU_Control = 3'b000 ;
            4'b1100: ALU_Control = 3'b001 ;
            4'b0100: ALU_Control = 3'b111 ;
            4'b1010: ALU_Control = 3'b101 ;
            4'b1000: ALU_Control = 3'b011 ;
            endcase
        2'b11: 
            case(Fun3)
            3'b000: ALU_Control = 3'b010 ;
            3'b010: ALU_Control = 3'b111 ;
            3'b100: ALU_Control = 3'b011 ;
            3'b110: ALU_Control = 3'b001 ;
            3'b111: ALU_Control = 3'b000 ;
            3'b101: ALU_Control = 3'b101 ;
            endcase
        endcase
        CPU_MIO = 0;
        BranchN = 0;
    end
    
endmodule
