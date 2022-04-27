// Verilog test fixture created from schematic D:\ISE\MyALU\AddSub1b.sch - Mon Dec 27 21:36:40 2021

`timescale 1ns / 1ps

module AddSub1b_AddSub1b_sch_tb();

// Inputs
   reg A;
   reg B;
   reg Ctrl;
   reg Cin;

// Output
   wire S;
   wire Cout;

// Bidirs

// Instantiate the UUT
   AddSub1b UUT (
		.A(A), 
		.B(B), 
		.Ctrl(Ctrl), 
		.Cin(Cin), 
		.S(S), 
		.Cout(Cout)
   );
// Initialize Inputs
	initial begin
		Cin=0;
		A=1;B=1;Ctrl=0;#50;
		A=1;B=0;Ctrl=1;#50;
		A=1;B=1;Ctrl=1;#50;
		
	end
endmodule
