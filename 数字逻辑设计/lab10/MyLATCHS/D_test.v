// Verilog test fixture created from schematic D:\ISE\MyLATCHS\D_LATCH.sch - Sun Dec 12 16:25:46 2021

`timescale 1ns / 1ps

module D_LATCH_D_LATCH_sch_tb();

// Inputs
   reg D;
   reg C;

// Output
   wire Q;
   wire QN;

// Bidirs

// Instantiate the UUT
   D_LATCH UUT (
		.D(D), 
		.C(C), 
		.Q(Q), 
		.QN(QN)
   );
// Initialize Inputs
	initial begin
		C=1;D=0;
		#50;
		D=1;
		#50;
		C=0;D=0;
		#50;
		D=1;
	end
endmodule
