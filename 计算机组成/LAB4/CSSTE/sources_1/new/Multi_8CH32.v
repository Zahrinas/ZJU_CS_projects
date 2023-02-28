// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Mar  2 11:16:14 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/Multi_8CH32.v
// Design      : Multi_8CH32
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Multi_8CH32(clk, rst, EN, Test, point_in, LES, Data0, data1, data2, 
  data3, data4, data5, data6, data7, point_out, LE_out, Disp_num)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,EN,Test[2:0],point_in[63:0],LES[63:0],Data0[31:0],data1[31:0],data2[31:0],data3[31:0],data4[31:0],data5[31:0],data6[31:0],data7[31:0],point_out[7:0],LE_out[7:0],Disp_num[31:0]" */;
  input clk;
  input rst;
  input EN;
  input [2:0]Test;
  input [63:0]point_in;
  input [63:0]LES;
  input [31:0]Data0;
  input [31:0]data1;
  input [31:0]data2;
  input [31:0]data3;
  input [31:0]data4;
  input [31:0]data5;
  input [31:0]data6;
  input [31:0]data7;
  output [7:0]point_out;
  output [7:0]LE_out;
  output [31:0]Disp_num;
endmodule
