`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:06 12/20/2021 
// Design Name: 
// Module Name:    LED_DRV 
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
module LED_DRV(
	 input wire clk,
	 input wire en,
	 input wire [15:0]HEX,
	 output wire LED_CLK,
	 output wire LED_CLR,
	 output wire LED_DO,
	 output wire LED_EN
    );

	reg [3:0]con;
	reg CLR,DO,EN;
	reg fin;
	
	initial begin
		fin=1'b1;
		con=4'b1111;
		EN=1;
		DO=0;
		CLR=1;
	end
	always@(posedge clk) begin
		if(en) begin
			fin<=0;
			con<=4'b1110;
			DO<=HEX[4'b1111];
			CLR<=1'b1;
			EN<=1;
		end
		else if(!fin) begin
			con<=con-1;
			DO<=HEX[con];
			CLR<=1'b1;
			EN<=1;
			if(con==4'b1111) fin<=1;
		end
	end
	
	assign LED_CLK=(fin)?0:~clk;
	assign LED_CLR=CLR;
	assign LED_DO=DO;
	assign LED_EN=EN;
endmodule
