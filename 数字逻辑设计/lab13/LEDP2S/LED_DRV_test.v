`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:44 12/20/2021
// Design Name:   LED_DRV
// Module Name:   D:/ISE/LEDP2S/LED_DRV_test.v
// Project Name:  LEDP2S
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LED_DRV
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LED_DRV_test;

	// Inputs
	reg clk;
	reg en;
	reg [15:0] HEX;

	// Outputs
	wire LED_CLK;
	wire LED_CLR;
	wire LED_DO;
	wire LED_EN;

	// Instantiate the Unit Under Test (UUT)
	LED_DRV uut (
		.clk(clk), 
		.en(en), 
		.HEX(HEX), 
		.LED_CLK(LED_CLK), 
		.LED_CLR(LED_CLR), 
		.LED_DO(LED_DO), 
		.LED_EN(LED_EN)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		en = 0;
		HEX[15:0] = 16'hA234;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		#10;en=1;
		#20;en=0;
	end
     always begin
	 clk=1;#20;
	 clk=0;#20;
	end
endmodule

