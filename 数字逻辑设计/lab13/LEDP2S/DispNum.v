`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:42 11/08/2021 
// Design Name: 
// Module Name:    DispNum 
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
module DispNum(
	input [15:0] HEXS,
	input [3:0] LES,
	input [3:0] points,
	input clk,
	input RST,
	output [3:0] AN,
	output [7:0] Segment
	);
	
	wire [31:0] clkd;
	wire [3:0] HEX;
	wire wirep;
	wire wireLE;
	
	clkdiv
		clkdiv0(clk,RST,clkd[31:0]);
		
	DisplaySync
		DSP0(HEXS[15:0],clkd[18:17],points[3:0],LES[3:0],HEX[3:0],wirep,wireLE,AN[3:0]);
		
	MyMC14495
		MC14495(HEX[0],HEX[1],HEX[2],HEX[3],wireLE,wirep,Segment[0],Segment[1],Segment[2],Segment[3],Segment[4],Segment[5],Segment[6],Segment[7]);

endmodule
