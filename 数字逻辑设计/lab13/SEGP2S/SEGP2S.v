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
	 input wire [7:0]SW,
	 output wire SEGCLK,
	 output wire SEGCLR,
	 output wire SEGDT,
	 output wire SEGEN
    );

	reg [31:0]Hex;
	wire [31:0]cd;
	wire [63:0]Disp;
	wire [7:0]SWO;
	
	initial begin
		Hex[31:0]={4'h0,4'h0,4'h8,4'h0,4'hA,4'h6,4'h2,4'h6};
	end
	
	clkdiv
		cdiv(clk,1'b0,cd);
	Conv
		Con1(Hex[ 3: 0],Disp[ 7: 0]),
		Con2(Hex[ 7: 4],Disp[15: 8]),
		Con3(Hex[11: 8],Disp[23:16]),
		Con4(Hex[15:12],Disp[31:24]),
		Con5(Hex[19:16],Disp[39:32]),
		Con6(Hex[23:20],Disp[47:40]),
		Con7(Hex[27:24],Disp[55:48]),
		Con8(Hex[31:28],Disp[63:56]);
	
	Load_Gen
		L0(clk,SW[0],SWO[0]),
		L1(clk,SW[1],SWO[1]),
		L2(clk,SW[2],SWO[2]),
		L3(clk,SW[3],SWO[3]),
		L4(clk,SW[4],SWO[4]),
		L5(clk,SW[5],SWO[5]),
		L6(clk,SW[6],SWO[6]),
		L7(clk,SW[7],SWO[7]);
	
	always@(posedge clk) begin
		if(SWO[0]) Hex[ 3: 0]<=Hex[ 3: 0]+1;
		if(SWO[1]) Hex[ 7: 4]<=Hex[ 7: 4]+1;
		if(SWO[2]) Hex[11: 8]<=Hex[11: 8]+1;
		if(SWO[3]) Hex[15:12]<=Hex[15:12]+1;
		if(SWO[4]) Hex[19:16]<=Hex[19:16]+1;
		if(SWO[5]) Hex[23:20]<=Hex[23:20]+1;
		if(SWO[6]) Hex[27:24]<=Hex[27:24]+1;
		if(SWO[7]) Hex[31:28]<=Hex[31:28]+1;
	end
	
	SEG_DRV
		SG(clk,cd[17],Disp,SEGCLK,SEGCLR,SEGDT,SEGEN);
	
endmodule
