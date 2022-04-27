`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:02 12/24/2021 
// Design Name: 
// Module Name:    Conv 
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
module Conv(
    input [3:0] HEX,
    output [7:0] DISP
    );
	
	MyMC14495
		My(.D0(HEX[0]),.D1(HEX[1]),.D2(HEX[2]),.D3(HEX[3]),.point(1'b0),.LE(1'b0)
			,.p(DISP[7]),.g(DISP[6]),.f(DISP[5]),.e(DISP[4]),.d(DISP[3]),.c(DISP[2]),.b(DISP[1]),.a(DISP[0]));
endmodule
