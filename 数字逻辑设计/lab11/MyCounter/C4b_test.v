// Verilog test fixture created from schematic D:\ISE\MyCounter\Counter4b.sch - Sun Dec 19 16:04:45 2021

`timescale 1ns / 1ps

module Counter4b_Counter4b_sch_tb();

// Inputs
   reg clk;

// Output
   wire Qa;
   wire Qb;
   wire Qc;
   wire Qd;
   wire Rc;

// Bidirs

// Instantiate the UUT
   Counter4b UUT (
		.Qa(Qa), 
		.Qb(Qb), 
		.Qc(Qc), 
		.Qd(Qd), 
		.Rc(Rc), 
		.clk(clk)
   );
// Initialize Inputs
	initial begin
	end
	always begin
		clk=1;#20;
		clk=0;#20;
	end
endmodule
