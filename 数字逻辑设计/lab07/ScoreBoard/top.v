`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:01 11/08/2021 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
	input wire clk,
	input wire [7:0] SW,
	input wire [3:0] btn,
	output wire [3:0] AN,
	output wire [7:0] SEGMENT,
	output wire BTNX4);
				
	wire [15:0] num;
	
	CreateNumber
		c0(btn[3:0],num[15:0]);
		
	DispNum
		d0(clk,num[15:0],SW[7:4],SW[3:0],1'b0,AN[3:0],SEGMENT[7:0]);
		
	assign BTNX4=1'b0;//Enable button inputs

endmodule