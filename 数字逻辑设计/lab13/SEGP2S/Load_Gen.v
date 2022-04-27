`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:20 12/19/2021 
// Design Name: 
// Module Name:    Load_Gen 
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
module Load_Gen(
	input wire clk,
	input wire btn_in,
	output reg Load_out
);
	initial Load_out = 0;
	reg old_btn;
	
	always@(posedge clk) begin
		if ((old_btn == 1'b0) && (btn_in == 1'b1)) Load_out <= 1'b1;
		else Load_out <= 1'b0;
	end
	
	always@(posedge clk) begin
		old_btn <= btn_in;
	end
endmodule
