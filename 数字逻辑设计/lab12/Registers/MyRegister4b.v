`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:51 12/19/2021 
// Design Name: 
// Module Name:    MyRegister4b 
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
module MyRegister4b(
    input wire clk,
    input wire Load,
    input wire [3:0] IN,
    output wire [3:0] OUT
    );
	
	reg [3:0]dat;
	always@(posedge clk) begin
		if(Load) dat<=IN;
	end
	assign OUT[3:0]=dat[3:0];
endmodule
