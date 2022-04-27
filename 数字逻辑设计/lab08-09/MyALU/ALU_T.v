// Verilog test fixture created from schematic D:\ISE\MyALU\myALU.sch - Mon Dec 27 22:07:18 2021

`timescale 1ns / 1ps

module myALU_myALU_sch_tb();

// Inputs
   reg [1:0] S;
   reg [3:0] A;
   reg [3:0] B;

// Output
   wire Cout;
   wire [3:0] C;

// Bidirs

// Instantiate the UUT
   myALU UUT (
		.S(S), 
		.A(A), 
		.B(B), 
		.Cout(Cout), 
		.C(C)
   );
// Initialize Inputs
       initial begin
			S=2'b11;A=4'b1001;B=4'b0001;#50;
			S=2'b10;A=4'b1001;B=4'b0001;#50;
			S=2'b01;A=4'b1001;B=4'b0001;#50;
			S=2'b00;A=4'b1001;B=4'b0001;#50;
		 end
endmodule
