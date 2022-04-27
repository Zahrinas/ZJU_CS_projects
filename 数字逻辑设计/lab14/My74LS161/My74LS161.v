`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:13 12/25/2021 
// Design Name: 
// Module Name:    My74LS161 
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
module My74LS161(
    input wire CR,
    input wire Ld,
    input wire CTP,
    input wire CTT,
    input wire CP,
    input wire [3:0] D,
	 output wire CO,
    output wire [3:0] Q
    );
	
	reg [3:0]Qr;
	
	always@(posedge CP or negedge CR) begin
		if(CR==0) Qr<=0;
		else if(Ld==0) Qr<=D;
		else if(CTP&&CTT) Qr<=Qr+1;
	end
	assign Q=Qr;
	assign CO=Q[3]&&Q[2]&&Q[1]&&Q[0]&&CTT;
endmodule
