// Verilog test fixture created from schematic D:\ISE\MyALU\AddSub4b.sch - Mon Dec 27 21:43:13 2021

`timescale 1ns / 1ps

module AddSub4b_AddSub4b_sch_tb();

// Inputs
   reg [3:0] A;
   reg [3:0] B;
   reg Ctrl;

// Output
   wire [3:0] S;
   wire Cout;

// Bidirs

// Instantiate the UUT
   AddSub4b UUT (
		.A(A), 
		.B(B), 
		.Ctrl(Ctrl), 
		.S(S), 
		.Cout(Cout)
   );
// Initialize Inputs
       initial begin
			A=4'b1101;B=4'b0011;Ctrl=1;#50;
			A=4'b1101;B=4'b0011;Ctrl=0;#50;
			A=4'b1001;B=4'b1111;Ctrl=1;#50;
			A=4'b1001;B=4'b1111;Ctrl=0;#50;
		 end
endmodule
