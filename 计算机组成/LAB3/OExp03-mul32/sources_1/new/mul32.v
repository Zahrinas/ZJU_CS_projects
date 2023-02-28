`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/25 14:03:11
// Design Name: 
// Module Name: mul32
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


module mul32(
    input clk,
    input rst,
    input [31:0]multiplicand,
    input [31:0]multiplier,
    input start,
    output [63:0]product,
    output finish
    );
    
    reg [63:0]pro_r;
    reg [5:0]bit_r;
    reg fin_r;
    
    always@(posedge start or posedge rst) begin
        bit_r<=31;
        fin_r<=0;
        pro_r<=0;
    end
    always@(posedge clk) begin
        if(fin_r==0 && start==1'b0) begin
            bit_r<=bit_r-1;
            if(fin_r==0 && multiplier[bit_r]) pro_r<=(product<<1)+multiplicand;
            else pro_r<=(product<<1);
            if(bit_r==0) fin_r<=1;
        end
    end
    assign product=pro_r;
    assign finish=fin_r;
endmodule