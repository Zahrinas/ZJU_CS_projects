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


module IF_reg_ID(
    input clk_IFID, //寄存器时钟
    input rst_IFID, //寄存器复位
    input en_IFID, //寄存器使能
    input [31:0] PC_in_IFID, //PC输入
    input [31:0] Inst_in_IFID, //指令输入
    output reg [31:0] PC_out_IFID, //PC输出
    output reg [31:0] inst_out_IFID //指令输出
    );
    
    always @(posedge clk_IFID or posedge rst_IFID)
        if (rst_IFID==1'b1) begin
            PC_out_IFID <= 32'b0;
            inst_out_IFID <= 32'b0;
        end
        else if (en_IFID) begin
            PC_out_IFID <= PC_in_IFID;
            inst_out_IFID <= Inst_in_IFID;
        end
endmodule
