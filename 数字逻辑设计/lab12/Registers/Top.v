`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:47 12/19/2021 
// Design Name: 
// Module Name:    Top 
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
module Top(
	input wire clk,
	input wire [15:0]SW,
	output wire [3:0]AN,
	output wire [7:0]SEGMENT
	);

	wire Load_A;
	wire [3:0] A, A_IN, A1;
	
	wire Load_B;
	wire [3:0] B, B_IN, B1;
	
	wire Load_C;
	wire [3:0] C, C_IN, C1;
	
	wire [3:0] Mux;
	
	wire [31:0] clk_div;
	clkdiv m3(clk, 1'b0, clk_div);
	
	MyRegister4b RegA(.clk(clk), .IN(A_IN), .Load(Load_A), .OUT(A));
	Load_Gen m0(.clk(clk), .clk_1ms(clk_div[17]), .btn_in(SW[2]),.Load_out(Load_A));
	AddSub4b m4(.A(A), .B(4'b0001), .Ctrl(SW[0]), .S(A1), .Cout());
	assign A_IN = (SW[15] == 1'b0)? A1: Mux;
	
	MyRegister4b RegB(.clk(clk), .IN(B_IN), .Load(Load_B), .OUT(B));
	Load_Gen m1(.clk(clk), .clk_1ms(clk_div[17]), .btn_in(SW[3]),.Load_out(Load_B));
	AddSub4b m5(.A(B), .B(4'b0001), .Ctrl(SW[1]), .S(B1), .Cout());
	assign B_IN = (SW[15] == 1'b0)? B1: Mux;
	
	MyRegister4b RegC(.clk(clk), .IN(C_IN), .Load(Load_C), .OUT(C));
	Load_Gen m2(.clk(clk), .clk_1ms(clk_div[17]), .btn_in(SW[4]),.Load_out(Load_C));
	assign C_IN = (SW[15] == 1'b0)? Mux: C1;
	
	myALU ALU(.A(A),.B(B),.S(SW[6:5]),.C(C1),.Cout());
	DispNum m8(.clk(clk), .HEXS({A, B, C, 4'b0000}), .LES(4'b0), .points(4'b0), .RST(1'b0), .AN(AN), .Segment(SEGMENT));
	
	assign Mux=(SW[8]==1)? C : ((SW[7]==0)? A : B);
	
endmodule
