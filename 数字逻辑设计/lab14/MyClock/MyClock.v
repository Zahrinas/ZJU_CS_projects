`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:00 12/25/2021 
// Design Name: 
// Module Name:    MyClock 
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
module MyClock(
	 input clk,
	 output wire SEGCLK,
	 output wire SEGCLR,
	 output wire SEGDT,
	 output wire SEGEN
    );
	
	wire [31:0]cdiv;
	wire [1:0]CO;
	wire [31:0]CTRout;
	
	clkdiv
		cdiv1(clk,1'b0,cdiv[31:0]);
	
	CTR60
		SEC(cdiv[18],CTRout[7:0],CO[0]),
		MIN(CO[0],CTRout[19:12],CO[1]);
		
	CTR24
		HOUR(.clk(CO[1]),.Q(CTRout[31:24]),.Co());
	
	SEGP2S
		SP(clk,cdiv[18],CTRout,SEGCLK,SEGCLR,SEGDT,SEGEN);
endmodule
