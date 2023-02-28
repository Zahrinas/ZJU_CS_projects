// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Mar  2 14:17:41 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/SPIO.v
// Design      : SPIO
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module SPIO(clk, rst, Start, EN, P_Data, counter_set, LED_out, 
  led_clk, led_sout, led_clrn, LED_PEN, GPIOf0)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,Start,EN,P_Data[31:0],counter_set[1:0],LED_out[15:0],led_clk,led_sout,led_clrn,LED_PEN,GPIOf0[13:0]" */;
  input clk;
  input rst;
  input Start;
  input EN;
  input [31:0]P_Data;
  output [1:0]counter_set;
  output [15:0]LED_out;
  output led_clk;
  output led_sout;
  output led_clrn;
  output LED_PEN;
  output [13:0]GPIOf0;
endmodule
