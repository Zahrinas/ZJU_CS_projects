`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/08 18:56:52
// Design Name: 
// Module Name: Ex_reg_Mem'
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


module Ex_reg_Mem(
    input clk_EXMem, //¼Ä´æÆ÷Ê±ÖÓ
    input rst_EXMem, //¼Ä´æÆ÷¸´Î»
    input en_EXMem, //¼Ä´æÆ÷Ê¹ÄÜ
    input[31:0] PC_in_EXMem, //PCÊäÈë
    input[31:0] PC4_in_EXMem, //PC+4ÊäÈë
    input [4:0] Rd_addr_EXMem, //Ğ´Ä¿µÄ¼Ä´æÆ÷µØÖ·ÊäÈë
    input zero_in_EXMem, //zero
    input[31:0] ALU_in_EXMem, //ALUÊäÈë
    input[31:0] Rs2_in_EXMem, //²Ù×÷Êı2ÊäÈë
    input Branch_in_EXMem, //Beq
    input BranchN_in_EXMem, //Bne
    input MemRW_in_EXMem, //´æ´¢Æ÷¶ÁĞ´
    input Jump_in_EXMem, //Jal
    input [1:0] MemtoReg_in_EXMem, //Ğ´»Ø
    input RegWrite_in_EXMem, //¼Ä´æÆ÷¶Ñ¶ÁĞ´
    output reg[31:0] PC_out_EXMem, //PCÊä³ö
    output reg[31:0] PC4_out_EXMem, //PC+4Êä³ö
    output reg[4:0] Rd_addr_out_EXMem, //Ğ´Ä¿µÄ¼Ä´æÆ÷Êä³ö
    output reg zero_out_EXMem, //zero
    output reg[31:0] ALU_out_EXMem, //ALUÊä³ö
    output reg[31:0] Rs2_out_EXMem, //²Ù×÷Êı2Êä³ö
    output reg Branch_out_EXMem, //Beq
    output reg BranchN_out_EXMem, //Bne
    output reg MemRW_out_EXMem, //´æ´¢Æ÷¶ÁĞ´
    output reg Jump_out_EXMem, //Jal
    output reg MemtoReg_out_EXMem, //Ğ´»Ø
    output reg RegWrite_out_EXMem //¼Ä´æÆ÷¶Ñ¶ÁĞ´
    );
    
    always @(posedge clk_EXMem or posedge rst_EXMem)
        if (rst_EXMem==1'b1) begin
            PC_out_EXMem<=32'b0;
            PC4_out_EXMem<=32'b0;
            Rd_addr_out_EXMem<=5'b0;
            zero_out_EXMem<=1'b0;
            ALU_out_EXMem<=32'b0;
            Rs2_out_EXMem<=32'b0;
            Branch_out_EXMem<=1'b0;
            BranchN_out_EXMem<=1'b0;
            MemRW_out_EXMem<=1'b0;
            Jump_out_EXMem<=1'b0;
            MemtoReg_out_EXMem<=1'b0;
            RegWrite_out_EXMem<=1'b0;
        end
        else if (en_EXMem) begin
            PC_out_EXMem<=PC_in_EXMem;
            PC4_out_EXMem<=PC4_in_EXMem;
            Rd_addr_out_EXMem<=Rd_addr_EXMem;
            zero_out_EXMem<=zero_in_EXMem;
            ALU_out_EXMem<=ALU_in_EXMem;
            Rs2_out_EXMem<=Rs2_in_EXMem;
            Branch_out_EXMem<=Branch_in_EXMem;
            BranchN_out_EXMem<=BranchN_in_EXMem;
            MemRW_out_EXMem<=MemRW_in_EXMem;
            Jump_out_EXMem<=Jump_in_EXMem;
            MemtoReg_out_EXMem<=MemtoReg_in_EXMem;
            RegWrite_out_EXMem<=RegWrite_in_EXMem;
        end
endmodule
