`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:47 12/27/2021
// Design Name:   CTR60
// Module Name:   D:/ShiftReg8b/MyClock/CTR60_T.v
// Project Name:  MyClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CTR60
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CTR24_T;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] Q;
	wire Co;

	// Instantiate the Unit Under Test (UUT)
	CTR24 uut (
		.clk(clk), 
		.Q(Q), 
		.Co(Co)
	);

	initial begin
	end
	always begin
		clk=1;#10;
		clk=0;#10;
	end
      
endmodule

