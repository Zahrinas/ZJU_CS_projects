`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:51 12/20/2021 
// Design Name: 
// Module Name:    LEDP2S 
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
module LEDP2S(
	 input wire clk,
	 input wire [3:0]btn,
	 input wire sw,
	 output wire BTNX4,
	 output wire [3:0]AN,
	 output wire [7:0]SEGMENT,
	 output wire LED_CLK,
	 output wire LED_CLR,
	 output wire LED_DO,
	 output wire LED_EN
    );

	wire [15:0]Hex;
	wire [3:0]btn_out;
	wire [31:0]clk_div;
	
	clkdiv 
		cldv(.clk(clk),.rst(1'b0),.clkdiv(clk_div));
		
	pbdebounce
		p0(clk_div[17],btn[0],btn_out[0]),
		p1(clk_div[17],btn[1],btn_out[1]),
		p2(clk_div[17],btn[2],btn_out[2]),
		p3(clk_div[17],btn[3],btn_out[3]);
		
	CreateNumber
		CN(.btn(btn_out),.num(Hex[15:0]));
	
	DispNum
		DN(Hex[15:0],4'b0000,4'b0000,clk,1'b0,AN[3:0],SEGMENT[7:0]);
		
	LED_DRV
		LDRV(clk,sw,Hex,LED_CLK,LED_CLR,LED_DO,LED_EN);
		
	assign BTNX4=1'b0;
endmodule
