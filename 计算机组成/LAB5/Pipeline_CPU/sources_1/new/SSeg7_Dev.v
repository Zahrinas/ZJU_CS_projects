`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 15:07:24
// Design Name: 
// Module Name: SSeg7_Dev
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


module SSeg7_Dev(clk, 
                 flash, 
                 Hexs, 
                 LES, 
                 point, 
                 rst, 
                 Start, 
                 SW0, 
                 seg_clk, 
                 seg_clrn, 
                 SEG_PEN, 
                 seg_sout);

    input clk;
    input flash;
    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input rst;
    input Start;
    input SW0;
   output seg_clk;
   output seg_clrn;
   output SEG_PEN;
   output seg_sout;
   
   wire [63:0] SEGMENT;
   wire [63:0] SEG_MAP;
   wire [63:0] XLXN_390;
   
   MUX2T1_64  MUXSH2M (.a(XLXN_390[63:0]), 
                      .b(SEG_MAP[63:0]), 
                      .sel(SW0), 
                      .o(SEGMENT[63:0]));
   P2S  M2 (.clk(clk), 
           .P_Data(SEGMENT[63:0]), 
           .rst(rst), 
           .Serial(Start), 
           .EN(SEG_PEN), 
           .sout(seg_sout), 
           .s_clk(seg_clk), 
           .s_clrn(seg_clrn));
   HexTo8SEG  SM1 (.flash(flash), 
                  .Hexs(Hexs[31:0]), 
                  .LES(LES[7:0]), 
                  .points(point[7:0]), 
                  .SEG_TXT(XLXN_390[63:0]));
   SSeg_map  SM3 (.Disp_num({Hexs[31:0], Hexs[31:0]}), 
                 .Seg_map(SEG_MAP[63:0]));
endmodule
