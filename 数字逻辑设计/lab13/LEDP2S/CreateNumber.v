`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:56 11/08/2021 
// Design Name: 
// Module Name:    CreateNumber 
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
module CreateNumber(
	input wire [3:0] btn,
	output reg [15:0] num
	);
	
	wire [3:0] A,B,C,D;
	
	initial num<=16'b0000_0000_0000_0000;
	
	assign A=num[ 3: 0]+4'd1;
	assign B=num[ 7: 4]+4'd1;
	assign C=num[11: 8]+4'd1;
	assign D=num[15:12]+4'd1;
	
	always@(posedge btn[0]) num[ 3: 0]<=A;
	always@(posedge btn[1]) num[ 7: 4]<=B;
	always@(posedge btn[2]) num[11: 8]<=C;
	always@(posedge btn[3]) num[15:12]<=D;

endmodule
