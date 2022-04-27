// Verilog test fixture created from schematic D:\ISE\MyLATCHS\CSR_LATCH.sch - Sun Dec 12 16:01:53 2021

`timescale 1ns / 1ps

module CSR_LATCH_CSR_LATCH_sch_tb();

// Inputs
   reg S;
   reg C;
   reg R;

// Output
   wire Q;
   wire QN;

// Bidirs

// Instantiate the UUT
   CSR_LATCH UUT (
		.S(S), 
		.C(C), 
		.R(R), 
		.Q(Q), 
		.QN(QN)
   );
// Initialize Inputs
	initial begin
		C = 1;
		R = 1; S = 1;#50;
		R = 1; S = 0;#50;
		R = 0; S = 0;#50;
		R = 0; S = 1;#50;
		R = 0; S = 0;#50;
		R = 1; S = 1;#50;
		C = 0;
		R = 1; S = 1;#50;
		R = 1; S = 0;#50;
		R = 0; S = 0;#50;
		R = 0; S = 1;#50;
		R = 0; S = 0;#50;
		R = 1; S = 1;#50;
	end
endmodule
