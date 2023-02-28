`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/08 20:11:32
// Design Name: 
// Module Name: Pipeline_WB
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


module Pipeline_WB(
    input[31:0] PC4_in_WB, //PC+4输入
    input[31:0] ALU_in_WB, //ALU结果输出
    input[31:0] Dmem_data_WB, //存储器数据输入
    input[1:0] MemtoReg_in_WB, //写回选择控制
    output [31:0] Data_out_WB //写回数据输出
    );
    
    MUX4T1_32 MUX4T1_32(
        .s(MemtoReg_in_WB),
        .I0(ALU_in_WB),
        .I1(Dmem_data_WB),
        .I2(PC4_in_WB),
        .I3(PC4_in_WB),
        .o(Data_out_WB)
    );
endmodule
