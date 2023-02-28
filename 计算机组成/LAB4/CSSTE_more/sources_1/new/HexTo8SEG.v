`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 15:20:19
// Design Name: 
// Module Name: HexTo8SEG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module  HexTo8SEG(input [31:0] Hexs,		//端口变量说明与定义合并
//						input [2:0] Scan,
						input [7:0] points,
						input [7:0] LES,
						input flash,
						output[63:0] SEG_TXT
						);

	Hex2Seg HTS0(Hexs[31:28],LES[7],points[7],flash,SEG_TXT[7:0]);  
	Hex2Seg HTS1(Hexs[27:24],LES[6],points[6],flash,SEG_TXT[15:8]); 
	Hex2Seg HTS2(Hexs[23:20],LES[5],points[5],flash,SEG_TXT[23:16]);  
	Hex2Seg HTS3(Hexs[19:16],LES[4],points[4],flash,SEG_TXT[31:24]);
			  
	Hex2Seg HTS4(Hexs[15:12],LES[3],points[3],flash,SEG_TXT[39:32]);
	Hex2Seg HTS5(Hexs[11:8], LES[2],points[2],flash,SEG_TXT[47:40]);
	Hex2Seg HTS6(Hexs[7:4],  LES[1],points[1],flash,SEG_TXT[55:48]);
	Hex2Seg HTS7(Hexs[3:0],  LES[0],points[0],flash,SEG_TXT[63:56]);

endmodule

module	 Hex2Seg(input[3:0]Hex,
						input LE,
						input point, 
						input flash,
						output[7:0]Segment
						);
		wire en = LE & flash;	
		MC14495_ZJU  MSEG(.D3(Hex[3]),.D2(Hex[2]),.D1(Hex[1]),.D0(Hex[0]),.LE(en),.point(point),
								.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.p(p));
		assign Segment = {a,b,c,d,e,f,g,p};	//p,g,f,e,d,c,b,a
endmodule

