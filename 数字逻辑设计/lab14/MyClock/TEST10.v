`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:17 12/27/2021
// Design Name:   CTR10
// Module Name:   D:/ShiftReg8b/MyClock/TEST10.v
// Project Name:  MyClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CTR10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST10;

	// Inputs
	reg clk;

	// Outputs
	wire [4:0] Q;
	wire Co;

	// Instantiate the Unit Under Test (UUT)
	CTR10 uut (
		.clk(clk), 
		.Q(Q), 
		.Co(Co)
	);

	initial begin
        
		// Add stimulus here
		
	end
	always begin
		clk=1;#10;
		clk=0;#10;
	end
      
endmodule

