`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:50 12/20/2021
// Design Name:   ShiftReg8b
// Module Name:   D:/ISE/ShiftReg8b/SR8b_test.v
// Project Name:  ShiftReg8b
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftReg8b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SR8b_test;

	// Inputs
	reg clk;
	reg s_in;
	reg [7:0] p_in;
	reg S_L;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	ShiftReg8b uut (
		.clk(clk), 
		.s_in(s_in), 
		.p_in(p_in), 
		.S_L(S_L), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;S_L = 0;s_in = 0;p_in = 0;#100;
		// Add stimulus here
		S_L = 0;s_in = 1;p_in =0;#200;
		S_L = 1;s_in = 0;p_in = 8'b0101_0101;#500;
	end
	always begin
		clk = 0; #20;
		clk = 1; #20;
	end
      
endmodule

