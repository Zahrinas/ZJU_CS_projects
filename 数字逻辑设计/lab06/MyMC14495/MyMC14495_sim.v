// Verilog test fixture created from schematic D:\2021\lab6\MyMC14495\MyMC14495.sch - Mon Oct 25 17:09:06 2021

`timescale 1ns / 1ps

module MyMC14495_MyMC14495_sch_tb();

// Inputs
   reg D2;
   reg D3;
   reg D0;
   reg D1;
   reg point;
   reg LE;

// Output
   wire g;
   wire f;
   wire e;
   wire d;
   wire c;
   wire b;
   wire a;
   wire p;

// Bidirs

// Instantiate the UUT
   MyMC14495 UUT (
		.D2(D2), 
		.D3(D3), 
		.D0(D0), 
		.D1(D1), 
		.g(g), 
		.f(f), 
		.e(e), 
		.d(d), 
		.c(c), 
		.b(b), 
		.a(a), 
		.point(point), 
		.p(p), 
		.LE(LE)
   );
// Initialize Inputs
integer i;initial begin	D3 = 0;	D2 = 0;	D1 = 0;	D0 = 0;	LE = 0;	point = 0;	for (i=0; i<=15;i=i+1) begin			#50;			{D3,D2,D1,D0}=i;			point = i;		end
				#50;		LE = 1;	end
endmodule
