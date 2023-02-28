`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/08 18:43:18
// Design Name: 
// Module Name: Pipeline_Ex
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

module Pipeline_Ex(
    input[31:0] PC_in_EX, //PC输入
    input[31:0] Rs1_in_EX, //操作数1输入
    input[31:0] Rs2_in_EX, //操作数2输入
    input[31:0] Imm_in_EX, //立即数输入
    input ALUSrc_B_in_EX, //ALU B选择
    input[2:0] ALU_control_in_EX, //ALU选择控制
    output wire [31:0] PC_out_EX, //PC输出
    output wire [31:0] PC4_out_EX, //PC+4输出
    output wire zero_out_EX, //ALU判0输出
    output wire [31:0] ALU_out_EX, //ALU计算输出
    output wire [31:0] Rs2_out_EX //操作数2输出
    );
    
    wire [31:0]o;
    add_32 add_32_0(
        .a(32'h00000004),
        .b(PC_in_EX),
        .c(PC4_out_EX)
    );
    add_32 add_32_1(
        .a(PC_in_EX),
        .b(Imm_in_EX),
        .c(PC_out_EX)
    );
    MUX2T1_32 MUX2T1_32_0(
        .I0(Rs2_in_EX),
        .I1(Imm_in_EX),
        .s(ALUSrc_B_in_EX),
        .o(o)
    );
    ALU ALU(
        .A(Rs1_in_EX),
        .B(o),
        .ALU_operation(ALU_control_in_EX),
        .res(ALU_out_EX),
        .zero(zero_out_EX)
    );
endmodule
