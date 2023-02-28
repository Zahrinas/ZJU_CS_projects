`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 10:35:16
// Design Name: 
// Module Name: IF_reg_ID
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


module Pipeline_ID(
    input clk_ID, //时钟
    input rst_ID, //复位
    input RegWrite_in_ID, //寄存器堆使能
    input [4:0] Rd_addr_ID, //写目的地址输入
    input [31:0] Wt_data_ID, //写数据输入
    input [31:0] Inst_in_ID, //指令输入
    output reg [31:0] Rd_addr_out_ID, //写目的地址输出
    output reg [31:0] Rs1_out_ID, //操作数1输出
    output reg [31:0] Rs2_out_ID, //操作数2输出
    output reg [31:0] Imm_out_ID, //立即数输出
    output reg ALUSrc_B_ID, //ALU B端输入选择
    output reg [2:0] ALU_control_ID, //ALU控制
    output reg Branch_ID, //Beq控制
    output reg BranchN_ID, //Bne控制
    output reg MemRW_ID, //存储器读写
    output reg Jump_ID, //Jal控制
    output reg [1:0] MemtoReg_ID, //寄存器写回选择
    output reg RegWrite_out_ID //寄存器堆读写
    );
    
    wire [1:0]ImmSel;
    
    regs regs(
        .clk(clk_ID),
        .rst(rst_ID),
        .Rs1_addr(Inst_in_ID[19:15]),
        .Rs2_addr(Inst_in_ID[24:20]),
        .Wt_addr(Rd_addr_ID),
        .Wt_data(Wt_data_ID),
        .RegWrite(RegWrite_in_ID),
        .Rs1_data(Rs1_out_ID),
        .Rs2_data(Rs2_out_ID)

    );
    ImmGen ImmGen(
        .ImmSel(ImmSel),
        .inst_field(Inst_in_ID),
        .Imm_out(Imm_out_ID)
    );
    SCPU_ctrl SCPU_ctrl(
        .OPcode(Inst_in_ID[6:2]),
        .Fun3(Inst_in_ID[14:12]),
        .Fun7(Inst_in_ID[30]),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B_ID),
        .MemtoReg(MemtoReg_ID),
        .Jump(Jump_ID),
        .Branch(Branch_ID),
        .BranchN(BranchN_ID),
        .RegWrite(RegWrite_out_ID),
        .MemRW(MemRW_ID),
        .ALU_Control(ALU_control_ID)
    );
    always@* begin
        Rd_addr_out_ID[4:0] = Inst_in_ID[11:7];
    end
endmodule
