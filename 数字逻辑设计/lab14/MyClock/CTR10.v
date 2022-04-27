`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:31 12/27/2021 
// Design Name: 
// Module Name:    CTR10 
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
module CTR10(
	 input CR,
    input clk,
    output [4:0] Q,
	 output Co
    );

	wire CRX;
	wire AG;
	wire Qbar[4:0];
	
	My74LS161
		MLS0(.CR(CR&&CRX),.Ld(1'b1),.CTP(1'b1),.CTT(1'b1),.CP(clk),.D(4'h0),.CO(),.Q(Q[3:0]));
		
	AND4
		A0(.I0(Qbar[0]),.I1(Q[1]),.I2(Qbar[2]),.I3(Q[3]),.O(AG));
		
	INV
		INV0(.I(Q[0]),.O(Qbar[0])),
		INV1(.I(Q[1]),.O(Qbar[1])),
		INV2(.I(Q[2]),.O(Qbar[2])),
		INV3(.I(Q[3]),.O(Qbar[3])),
		INVA0(.I(AG),.O(CRX));
	
	assign Co=AG;
endmodule
