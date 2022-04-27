`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:59 12/25/2021 
// Design Name: 
// Module Name:    CTR24 
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
module CTR24(
    input clk,
    output [7:0] Q,
	 output Co
    );

	wire CO0;
	wire CR;
	wire Aout[1:0];
	wire Qbar[7:0];
	
	CTR10
		MLS0(.CR(CR),.clk(clk),.Co(CO0),.Q(Q[3:0])),
		MLS1(.CR(CR),.clk(CO0),.Co(),.Q(Q[7:4]));
		
	AND4
		A0(.I0(Qbar[0]),.I1(Qbar[1]),.I2(Q[2]),.I3(Qbar[3]),.O(Aout[0])),
		A1(.I0(Qbar[4]),.I1(Q[5]),.I2(Qbar[6]),.I3(Qbar[7]),.O(Aout[1]));
		
	AND2
		ANDG(.I0(Aout[0]),.I1(Aout[1]),.O(AG));
	
	INV
		INV0(.I(Q[0]),.O(Qbar[0])),
		INV1(.I(Q[1]),.O(Qbar[1])),
		INV2(.I(Q[2]),.O(Qbar[2])),
		INV3(.I(Q[3]),.O(Qbar[3])),
		INV4(.I(Q[4]),.O(Qbar[4])),
		INV5(.I(Q[5]),.O(Qbar[5])),
		INV6(.I(Q[6]),.O(Qbar[6])),
		INV7(.I(Q[7]),.O(Qbar[7])),
		INVA0(.I(AG),.O(CR));
	
	assign Co=AG;
endmodule
