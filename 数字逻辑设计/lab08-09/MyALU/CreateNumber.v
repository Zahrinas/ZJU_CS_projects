`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:32:13 11/28/2021 
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
	input wire [1:0] btn,
	input wire [1:0] sw,
	output reg [15:0] num
	);
	
	wire [3:0] A1,B1;
	wire Co1,Co2;
	
	initial num<=16'b0000_0000_0000_0000;
	
	AddSub4b
		a1(.A(num[ 3: 0]),.B(4'b0001),.Ctrl(sw[0]),.Cout(),.S(A1)),
		a2(.A(num[ 7: 4]),.B(4'b0001),.Ctrl(sw[1]),.Cout(),.S(B1));
	
	always@(posedge btn[0]) num[ 3: 0]<= A1;
	always@(posedge btn[1]) num[ 7: 4]<= B1;

endmodule
