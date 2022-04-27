`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:20 12/19/2021 
// Design Name: 
// Module Name:    Top 
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
module Top(
	 input wire clk,
	 output wire [3:0]AN,
	 output wire [7:0]SEG,
	 output wire px
    );
	
	wire c1;
	wire [15:0]Hex;
	
	clk_1s
		cx(.clk(clk),.clk_1s(c1));
	
	Counter4b
		C4b(.clk(c1),.Qa(Hex[3]),.Qb(Hex[2]),.Qc(Hex[1]),.Qd(Hex[0]),.Rc(px));
	
	DispNum
		d1(Hex[15:0],4'h1,4'h0,clk,1'b0,AN[3:0],SEG[7:0]);
endmodule
