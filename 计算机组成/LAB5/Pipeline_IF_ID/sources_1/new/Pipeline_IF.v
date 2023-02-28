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


module Pipeline_IF(
    input PCSrc,
    input [31:0]PC_in_IF,
    input clk_IF,
    input en_IF,
    input rst_IF,
    output [31:0]PC_out_IF
    );
    
    wire [31:0]o;
    wire [31:0]c;
    
    assign c=PC_out_IF+32'h00000004;
    
    REG32 PC(
        .clk(clk_IF),
        .rst(rst_IF),
        .CE(en_IF),
        .D(o),
        .Q(PC_out_IF)
    );
    MUX2T1_32 MUX2T1_32(
        .I0(c),
        .I1(PC_in_IF),
        .s(PCSrc),
        .o(o)
    );
endmodule
