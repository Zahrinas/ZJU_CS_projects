// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Mar 10 09:43:49 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/Counter_x.v
// Design      : Counter_x
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Counter_x(clk, rst, clk0, clk1, clk2, counter_we, counter_val, 
  counter_ch, counter0_OUT, counter1_OUT, counter2_OUT, counter_out)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,clk0,clk1,clk2,counter_we,counter_val[31:0],counter_ch[1:0],counter0_OUT,counter1_OUT,counter2_OUT,counter_out[31:0]" */;
  input clk;
  input rst;
  input clk0;
  input clk1;
  input clk2;
  input counter_we;
  input [31:0]counter_val;
  input [1:0]counter_ch;
  output counter0_OUT;
  output counter1_OUT;
  output counter2_OUT;
  output [31:0]counter_out;
endmodule
