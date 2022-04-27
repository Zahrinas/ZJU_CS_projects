`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:01 12/19/2021 
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
	 input wire sw,
	 output wire [3:0]AN,
	 output wire [7:0]SEG,
	 output wire px
    );
	
	wire c1;
	wire [15:0]Hex;
	
	clk_100ms
		cx(.clk(clk),.clk_100ms(c1));
	
	RevCounter
		C4b(.clk(c1),.s(sw),.cnt(Hex),.Rc(px));
	
	DispNum
		d1(Hex[15:0],4'h0,4'h0,clk,1'b0,AN[3:0],SEG[7:0]);
endmodule
