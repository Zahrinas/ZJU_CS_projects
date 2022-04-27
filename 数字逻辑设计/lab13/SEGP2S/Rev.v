`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:22 01/03/2022 
// Design Name: 
// Module Name:    Rev 
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
module Rev(
	input reg [31:0]HexO,
	output reg [31:0]HexR
   );
	
	reg i;
	
	for(i=0;i<32;i=i+1) begin
		HexR[i]<=HexO[31-i];
	end
endmodule
