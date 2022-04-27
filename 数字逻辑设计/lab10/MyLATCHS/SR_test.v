// Verilog test fixture created from schematic D:\ISE\MyLATCHS\SR_LATCH.sch - Sun Dec 12 15:56:48 2021

`timescale 1ns / 1ps

module SR_LATCH_SR_LATCH_sch_tb();

// Inputs
   reg S;
   reg R;

// Output
   wire Q;
   wire QN;

// Bidirs

// Instantiate the UUT
   SR_LATCH UUT (
		.S(S), 
		.R(R), 
		.Q(Q), 
		.QN(QN)
   );
// Initialize Inputs
	initial begin
		R=1;S=1;#50;
		R=1;S=0;#50;
		R=1;S=1;#50;
		R=0;S=1;#50;
		R=1;S=1;#50;
		R=0;S=0;#50;
		R=1;S=1;#50;
	end
endmodule
