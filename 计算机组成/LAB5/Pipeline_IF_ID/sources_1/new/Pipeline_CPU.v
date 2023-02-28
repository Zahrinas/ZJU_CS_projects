`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/19 15:50:00
// Design Name: 
// Module Name: Pipeline_CPU
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


module Pipeline_CPU( 
    input clk, //Ê±ÖÓ
    input rst, //¸´Î»
    input[31:0] Data_in, //´æ´¢Æ÷Êý¾ÝÊäÈë
    input[31:0] inst_IF, //È¡Ö¸½×¶ÎÖ¸Áî
    output [31:0] PC_out_IF, //È¡Ö¸½×¶ÎPCÊä³ö
    output [31:0] PC_out_ID, //ÒëÂë½×¶ÎPCÊä³ö
    output [31:0] inst_ID, //ÒëÂë½×¶ÎÖ¸Áî
    output [31:0] PC_out_Ex, //Ö´ÐÐ½×¶ÎPCÊä³ö
    output [31:0] MemRW_Ex, //Ö´ÐÐ½×¶Î´æ´¢Æ÷¶ÁÐ´
    output [31:0] MemRW_Mem, //·Ã´æ½×¶Î´æ´¢Æ÷¶ÁÐ´
    output [31:0] Addr_out, //µØÖ·Êä³ö
    output [31:0] Data_out, //CPUÊý¾ÝÊä³ö
    output [31:0] Data_out_WB //Ð´»ØÊý¾ÝÊä³ö
);
    wire [31:0]Rd_addr_out_ID;
    wire [31:0]Rs1_out_ID;
    wire [31:0]Rs2_out_ID;
    wire [31:0]Imm_out_ID;
    wire ALUSrc_B_ID;
    wire [2:0]ALU_control_ID;
    wire Branch_ID;
    wire BranchN_ID;
    wire MemRW_ID;
    wire Jump_ID;
    wire [1:0]MemtoReg_ID;
    wire RegWrite_out_ID;
    wire [31:0]PC_out_IDEX;
    wire [4:0]Rd_addr_out_IDEX;
    wire [31:0]Rs1_out_IDEX;
    wire [31:0]Rs2_out_IDEX;
    wire [31:0]Imm_out_IDEX;
    wire ALUSrc_B_out_IDEX;
    wire [2:0]ALU_control_out_IDEX;
    wire Branch_out_IDEX;
    wire BranchN_out_IDEX;
    wire Jump_out_IDEX;
    wire [1:0]MemtoReg_out_IDEX;
    wire RegWrite_out_IDEX;
    wire [31:0]PC4_out_EX;
    wire zero_out_EX;
    wire [31:0]ALU_out_EX;
    wire [31:0]Rs2_out_EX;
    wire [31:0]PC_out_EXMem;
    wire [31:0]PC4_out_EXMem;
    wire [31:0]Rd_addr_out_EXMem;
    wire zero_out_EXMem;
    wire Branch_out_EXMem;
    wire BranchN_out_EXMem;
    wire Jump_out_EXMem;
    wire [1:0]MemtoReg_out_EXMem;
    wire RegWrite_out_EXMem;
    wire PCSrc;
    wire [31:0]PC4_out_MemWB;
    wire [4:0]Rd_addr_out_MemWB;
    wire [31:0]ALU_out_MemWB;
    wire [31:0]DMem_data_out_MemWB;
    wire [1:0]MemtoReg_out_MemWB;
    wire RegWrite_out_MemWB;
    
    Pipeline_IF Instruction_Fetch(
        .clk_IF(clk),
        .rst_IF(rst),
        .en_IF(1'b1),
        .PC_in_IF(PC_out_EXMem),
        .PCSrc(PCSrc),
        .PC_out_IF(PC_out_IF)
    );
    IF_reg_ID IF_reg_ID(
        .clk_IFID(clk),
        .rst_IFID(rst),
        .en_IFID(1'b1),
        .PC_in_IFID(PC_out_IF),
        .inst_in_IFID(inst_IF),
        .PC_out_IFID(PC_out_ID),
        .inst_out_IFID(inst_ID)
    );
    Pipeline_ID Instruction_Decoder(
        .clk_ID(clk),
        .rst_ID(rst),
        .RegWrite_in_ID(RegWrite_out_MemWB),
        .Rd_addr_ID(Rd_addr_out_MemWB),
        .Wt_data_ID(Data_out_WB),
        .Inst_in_ID(inst_ID),
        .Rd_addr_out_ID(Rd_addr_out_ID),
        .Rs1_out_ID(Rs1_out_ID),
        .Rs2_out_ID(Rs2_out_ID),
        .Imm_out_ID(Imm_out_ID),
        .ALUSrc_B_ID(ALUSrc_B_ID),
        .ALU_control_ID(ALU_control_ID),
        .Branch_ID(Branch_ID),
        .BranchN_ID(BranchN_ID),
        .MemRW_ID(MemRW_ID),
        .Jump_ID(Jump_ID),
        .MemtoReg_ID(MemtoReg_ID),
        .RegWrite_out_ID(RegWrite_out_ID)
    );
    ID_reg_Ex ID_reg_Ex(
        .clk_IDEX(clk),
        .rst_IDEX(rst),
        .en_IDEX(1'b1),
        .PC_in_IDEX(PC_out_ID),
        .Rd_addr_IDEX(Rd_addr_out_ID),
        .Rs1_in_IDEx(Rs1_out_ID),
        .Rs2_in_IDEX(Rs2_out_ID),
        .Imm_in_IDEX(Imm_out_ID),
        .ALUSrc_B_in_IDEX(ALUSrc_B_ID),
        .ALU_control_in_IDEX(ALU_control_ID),
        .Branch_in_IDEX(Branch_ID),
        .BranchN_in_IDEX(BranchN_ID),
        .MemRW_in_IDEX(MemRW_ID),
        .Jump_in_IDEX(Jump_ID),
        .MemtoReg_in_IDEX(MemtoReg_ID),
        .RegWrite_in_IDEX(RegWrite_out_ID),
        .PC_out_IDEX(PC_out_IDEX),
        .Rd_addr_out_IDEX(Rd_addr_out_IDEX),
        .Rs1_out_IDEX(Rs1_out_IDEX),
        .Rs2_out_IDEX(Rs2_out_IDEX),
        .Imm_out_IDEX(Imm_out_IDEX),
        .ALUSrc_B_out_IDEX(ALUSrc_B_out_IDEX),
        .ALU_control_out_IDEX(ALU_control_out_IDEX),
        .Branch_out_IDEX(Branch_out_IDEX),
        .BranchN_out_IDEX(BranchN_out_IDEX),
        .MemRW_out_IDEX(MemRW_Ex),
        .Jump_out_IDEX(Jump_out_IDEX),
        .MemtoReg_out_IDEX(MemtoReg_out_IDEX),
        .RegWrite_out_IDEX(RegWrite_out_IDEX)
    );
    Pipeline_Ex Execute(
        .PC_in_EX(PC_out_IDEX),
        .Rs1_in_EX(Rs1_out_IDEX),
        .Rs2_in_EX(Rs2_out_IDEX),
        .Imm_in_EX(Imm_out_IDEX),
        .ALUSrc_B_in_EX(ALUSrc_B_out_IDEX),
        .ALU_control_in_EX(ALU_control_out_IDEX),
        .PC_out_EX(PC_out_Ex),
        .PC4_out_EX(PC4_out_EX),
        .zero_out_EX(zero_out_EX),
        .ALU_out_EX(ALU_out_EX),
        .Rs2_out_EX(Rs2_out_EX)
    );
    Ex_reg_Mem Ex_reg_Mem(
        .clk_EXMem(clk),
        .rst_EXMem(rst),
        .en_EXMem(1'b1),
        .PC_in_EXMem(PC_out_Ex),
        .PC4_in_EXMem(PC4_out_EX),
        .Rd_addr_EXMem(Rd_addr_out_IDEX),
        .zero_in_EXMem(zero_out_EX),
        .ALU_in_EXMem(ALU_out_EX),
        .Rs2_in_EXMem(Rs2_out_EX),
        .Branch_in_EXMem(Branch_out_IDEX),
        .BranchN_in_EXMem(BranchN_out_IDEX),
        .MemRW_in_EXMem(MemRW_Ex),
        .Junp_in_EXMem(Jump_out_IDEX),
        .MemtoReg_in_EXMem(MemtoReg_out_IDEX),
        .RegWrite_in_EXMem(RegWrite_out_IDEX),
        .PC_out_EXMem(PC_out_EXMem),
        .PC4_out_EXMem(PC4_out_EXMem),
        .Rd_addr_out_EXMem(Rd_addr_out_EXMem),
        .zero_out_EXMem(zero_out_EXMem),
        .ALU_out_EXMem(Addr_out),
        .Rs2_out_EXMem(Data_out),
        .Branch_out_EXMem(Branch_out_EXMem),
        .BranchN_out_EXMem(BranchN_out_EXMem),
        .MemRW_out_EXMem(MemRW_Mem),
        .Jump_out_EXMem(Jump_out_EXMem),
        .MemtoReg_out_EXMem(MemtoReg_out_EXMem),
        .RegWrite_out_EXMem(RegWrite_out_EXMem)
    );
    Pipeline_Mem Memory_Access(
        .zero_in_Mem(zero_out_EXMem),
        .Branch_in_Mem(Branch_out_EXMem),
        .BranchN_in_Mem(BranchN_out_EXMem),
        .Jump_in_Mem(Jump_out_EXMem),
        .PCSrc(PCSrc)
    );
    Mem_reg_WB Mem_reg_WB(
        .clk_MemWB(clk),
        .rst_MemWB(rst),
        .en_MemWB(1'b1),
        .PC4_in_MemWB(PC4_out_EXMem),
        .Rd_addr_MemWB(Rd_addr_out_EXMem),
        .ALU_in_MemWB(Addr_out),
        .DMem_data_MemWB(Data_in),
        .MemtoReg_in_MemWB(MemtoReg_out_EXMem),
        .RegWrite_in_MemWB(RegWrite_out_EXMem),
        .PC4_out_MemWB(PC4_out_MemWB),
        .Rd_addr_out_MemWB(Rd_addr_out_MemWB),
        .ALU_out_MemWB(ALU_out_MemWB),
        .DMem_data_out_MemWB(DMem_data_out_MemWB),
        .MemtoReg_out_MemWB(MemtoReg_out_MemWB),
        .RegWrite_out_MemWB(RegWrite_out_MemWB)
    );
    Pipeline_WB Write_Back(
        .PC4_in_WB(PC4_out_MemWB),
        .ALU_in_WB(ALU_out_MemWB),
        .DMem_data_WB(DMem_data_out_MemWB),
        .MemtoReg_in_WB(MemtoReg_out_MemWB),
        .Data_out_WB(Data_out_WB)
    );
endmodule