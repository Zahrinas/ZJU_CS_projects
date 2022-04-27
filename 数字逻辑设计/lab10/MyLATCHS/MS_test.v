// Verilog test fixture created from schematic D:\ISE\MyLATCHS\MS_FLIPFLOP.sch - Sun Dec 19 14:09:36 2021

`timescale 1ns / 1ps

module MS_FLIPFLOP_MS_FLIPFLOP_sch_tb();

// Inputs
   reg S;
   reg C;
   reg R;

// Output
   wire Q;
   wire QN;

// Bidirs

// Instantiate the UUT
   MS_FLIPFLOP UUT (
		.S(S), 
		.C(C), 
		.R(R), 
		.Q(Q), 
		.QN(QN)
   );
// Initialize Inputs
   initial begin
		R=0;S=0;#50;
		R=1;S=0;#50;
		R=0;S=0;#50;
		R=0;S=1;#50;
		R=0;S=0;#20;
		R=0;S=1;#5;
		R=0;S=0;#5;
		R=1;S=0;#5;
		R=0;S=0;#5;
		R=0;S=0;#50;
		R=1;S=0;#50;
		R=0;S=1;#50;
	end
	always begin
		C=0;#20;
		C=1;#20;
	end
endmodule
