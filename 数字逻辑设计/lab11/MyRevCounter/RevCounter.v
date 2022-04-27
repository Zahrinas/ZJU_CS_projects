`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:31 12/19/2021 
// Design Name: 
// Module Name:    RevCounter 
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
module RevCounter(
	 input wire clk,
	 input wire s,
	 output wire [15:0]cnt,
	 output wire Rc
    );
	reg [15:0]xt;
	reg Rct;
	initial begin
		xt[15:0]=4'h0000;
		Rct=0;
	end
	always@(posedge clk) begin
		if(s) begin
			if(xt==16'hFFFE) begin
				xt<=16'hFFFF;
				Rct<=1;
			end
			else begin
				xt<=xt+1;
				Rct<=0;
			end
		end
		else begin
			if(xt==16'h0001) begin
				xt<=16'h0000;
				Rct<=1;
			end
			else begin
				xt<=xt-1;
				Rct<=0;
			end
		end
	end
	assign cnt=xt;
	assign Rc=Rct;
endmodule
