// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Mar  2 14:05:14 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/SAnti_jitter.v
// Design      : SAnti_jitter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module SAnti_jitter(clk, RSTN, readn, Key_y, Key_x, SW, Key_out, Key_ready, 
  pulse_out, BTN_OK, SW_OK, CR, rst)
/* synthesis syn_black_box black_box_pad_pin="clk,RSTN,readn,Key_y[3:0],Key_x[4:0],SW[15:0],Key_out[4:0],Key_ready,pulse_out[3:0],BTN_OK[3:0],SW_OK[15:0],CR,rst" */;
  input clk;
  input RSTN;
  input readn;
  input [3:0]Key_y;
  output [4:0]Key_x;
  input [15:0]SW;
  output [4:0]Key_out;
  output Key_ready;
  output [3:0]pulse_out;
  output [3:0]BTN_OK;
  output [15:0]SW_OK;
  output CR;
  output rst;
endmodule
