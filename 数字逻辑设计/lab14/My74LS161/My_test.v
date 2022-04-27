`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:15 12/25/2021
// Design Name:   My74LS161
// Module Name:   D:/ISE/My74LS161/My_test.v
// Project Name:  My74LS161
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: My74LS161
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module My_test;

	// Inputs
	reg CR;
	reg Ld;
	reg CTP;
	reg CTT;
	reg CP;
	reg [3:0] D;

	// Outputs
	wire CO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	My74LS161 uut (
		.CR(CR), 
		.Ld(Ld), 
		.CTP(CTP), 
		.CTT(CTT), 
		.CP(CP), 
		.D(D), 
		.CO(CO), 
		.Q(Q)
	);

	initial begin
		CR = 0;
		D = 0;
		CTP = 0;
		CTT = 0;
		Ld = 0;

		#100;
		CR = 1;
		Ld = 1;
		D = 4'b1100;
		CTT = 0;
		CTP = 0;
		#30 CR = 0;
		#20 CR = 1;
		#10 Ld = 0;
		#30 CTT = 1;
		CTP = 1;
		#10 Ld = 1;

		#510;
		CR = 0;
		#20 CR = 1;
		#500;
	end
	always begin
		CP=0;#20;
		CP=1;#20;
	end
      
endmodule

