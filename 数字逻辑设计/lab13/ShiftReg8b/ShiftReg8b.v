`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:17 12/20/2021 
// Design Name: 
// Module Name:    ShiftReg8b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ShiftReg8b(
	 input wire clk,
	 input wire s_in,
	 input wire [7:0]p_in,
	 input wire S_L,
	 output wire [7:0]out
    );

	wire [7:0] in;
	wire [7:0] or1,or2;
	wire Pbar;
	
	FD
		FD0(.C(clk),.D(in[0]),.Q(out[0])),
		FD1(.C(clk),.D(in[1]),.Q(out[1])),
		FD2(.C(clk),.D(in[2]),.Q(out[2])),
		FD3(.C(clk),.D(in[3]),.Q(out[3])),
		FD4(.C(clk),.D(in[4]),.Q(out[4])),
		FD5(.C(clk),.D(in[5]),.Q(out[5])),
		FD6(.C(clk),.D(in[6]),.Q(out[6])),
		FD7(.C(clk),.D(in[7]),.Q(out[7]));
	
	OR2
		org0(.I0(or1[0]),.I1(or2[0]),.O(in[0])),
		org1(.I0(or1[1]),.I1(or2[1]),.O(in[1])),
		org2(.I0(or1[2]),.I1(or2[2]),.O(in[2])),
		org3(.I0(or1[3]),.I1(or2[3]),.O(in[3])),
		org4(.I0(or1[4]),.I1(or2[4]),.O(in[4])),
		org5(.I0(or1[5]),.I1(or2[5]),.O(in[5])),
		org6(.I0(or1[6]),.I1(or2[6]),.O(in[6])),
		org7(.I0(or1[7]),.I1(or2[7]),.O(in[7]));
		
	AND2
		a0(.I0(Pbar),.I1(s_in),.O(or1[0])),
		a1(.I0(Pbar),.I1(out[0]),.O(or1[1])),
		a2(.I0(Pbar),.I1(out[1]),.O(or1[2])),
		a3(.I0(Pbar),.I1(out[2]),.O(or1[3])),
		a4(.I0(Pbar),.I1(out[3]),.O(or1[4])),
		a5(.I0(Pbar),.I1(out[4]),.O(or1[5])),
		a6(.I0(Pbar),.I1(out[5]),.O(or1[6])),
		a7(.I0(Pbar),.I1(out[6]),.O(or1[7])),
		b0(.I0(S_L),.I1(p_in[0]),.O(or2[0])),
		b1(.I0(S_L),.I1(p_in[1]),.O(or2[1])),
		b2(.I0(S_L),.I1(p_in[2]),.O(or2[2])),
		b3(.I0(S_L),.I1(p_in[3]),.O(or2[3])),
		b4(.I0(S_L),.I1(p_in[4]),.O(or2[4])),
		b5(.I0(S_L),.I1(p_in[5]),.O(or2[5])),
		b6(.I0(S_L),.I1(p_in[6]),.O(or2[6])),
		b7(.I0(S_L),.I1(p_in[7]),.O(or2[7]));
		
	INV
		inv(.I(S_L),.O(Pbar));
endmodule
