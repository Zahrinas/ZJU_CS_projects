`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:56 11/13/2021 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv(
    input wire clk,
    input wire rst,
    output reg [31:0] clkdiv
    );

	always@(posedge clk or posedge rst) begin
		if(rst) clkdiv<=1;
		else clkdiv<=clkdiv+1'b1;
	end

endmodule
