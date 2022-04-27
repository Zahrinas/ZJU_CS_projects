`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:34 12/27/2021 
// Design Name: 
// Module Name:    SEG_DRV 
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
module SEG_DRV(
	 input wire clk,
	 input wire en,
	 input wire [63:0]HEX,
	 output wire SEGCLK,
	 output wire SEGCLR,
	 output wire SEGDO,
	 output wire SEGEN
    );

	reg [5:0]con;
	reg CLR,DO,EN;
	reg fin;
	
	initial begin
		fin=1'b1;
		con=6'b111111;
		EN=1;
		DO=0;
		CLR=1;
	end
	always@(posedge clk) begin
		if(en) begin
			fin<=0;
			con<=6'b111110;
			DO<=HEX[6'b111111];
			CLR<=1'b1;
			EN<=1;
		end
		else if(!fin) begin
			con<=con-1;
			DO<=HEX[con];
			CLR<=1'b1;
			EN<=1;
			if(con==6'b111111) fin<=1;
		end
	end
	
	assign SEGCLK=(fin)?0:~clk;
	assign SEGCLR=CLR;
	assign SEGDO=DO;
	assign SEGEN=EN;
endmodule
