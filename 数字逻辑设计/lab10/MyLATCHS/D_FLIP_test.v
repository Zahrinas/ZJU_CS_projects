// Verilog test fixture created from schematic D:\ISE\MyLATCHS\D_FLIPFLOP.sch - Sun Dec 19 14:40:34 2021

`timescale 1ns / 1ps

module D_FLIPFLOP_D_FLIPFLOP_sch_tb();

// Inputs
   reg C;
   reg SN;
   reg RN;
   reg D;

// Output
   wire QN;
   wire Q;

// Bidirs

// Instantiate the UUT
   D_FLIPFLOP UUT (
		.C(C), 
		.SN(SN), 
		.RN(RN), 
		.D(D), 
		.QN(QN), 
		.Q(Q)
   );
// Initialize Inputs
	
   initial begin
	D=0;C=0;
	SN=1;RN=0;#50;
	SN=1;RN=1;#50;
	SN=1;RN=0;#50;
	SN=1;RN=1;#50;
	D = 0; #150;
	D = 1; #150;
	D = 0; #150;
	D = 1; #150;
	D = 0; #150;
	D = 1; #150;
	D = 0; #150;
	D = 1; #150;
	end
	always begin
	C=0; #50;
	C=1; #50;
	end
endmodule
