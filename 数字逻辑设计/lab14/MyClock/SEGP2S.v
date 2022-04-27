`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:20 12/24/2021 
// Design Name: 
// Module Name:    SEGP2S 
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
module SEGP2S(
	 input wire clk,
	 input wire en,
	 input wire [31:0]Hex,
	 output wire SEGCLK,
	 output wire SEGCLR,
	 output wire SEGDT,
	 output wire SEGEN
    );

	wire [63:0]Disp;
	
	Conv
		Con1(Hex[ 3: 0],Disp[ 7: 0]),
		Con2(Hex[ 7: 4],Disp[15: 8]),
		Con3(Hex[11: 8],Disp[23:16]),
		Con4(Hex[15:12],Disp[31:24]),
		Con5(Hex[19:16],Disp[39:32]),
		Con6(Hex[23:20],Disp[47:40]),
		Con7(Hex[27:24],Disp[55:48]),
		Con8(Hex[31:28],Disp[63:56]);
		
	SEG_DRV
		SG(clk,en,Disp,SEGCLK,SEGCLR,SEGDT,SEGEN);

endmodule
