// Verilog test fixture created from schematic D:\32000\lab6\Mux4to1b4_sch\Mux4to14b.sch - Mon Nov 01 17:13:35 2021

`timescale 1ns / 1ps

module Mux4to1b4_Mux4to1b4_sch_tb();

// Inputs
   reg [3:0] I0;
   reg [3:0] I1;
   reg [3:0] I2;
   reg [3:0] I3;
   reg [1:0] s;

// Output
   wire [3:0] o;

// Bidirs

// Instantiate the UUT
   Mux4to1b4 UUT (
		.s(s), 
		.I0(I0), 
		.I1(I1), 
		.I2(I2), 
		.I3(I3), 
		.o(o)
   );
// Initialize Inputs
//   `ifdef auto_init
       initial begin
		 I0=1;
		 I1=2;
		 I2=4;
		 I3=8;
		 
		 s=0;
		 #50 s=1;
		 #50 s=2;
		 #50 s=3;
		 end
//   `endif
endmodule