// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Mar  2 14:35:59 2022
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/SCPU.v
// Design      : SCPU
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module SCPU(clk, rst, MIO_ready, inst_in, Data_in, CPU_MIO, 
  MemRW, PC_out, Data_out, Addr_out)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,MIO_ready,inst_in[31:0],Data_in[31:0],CPU_MIO,MemRW,PC_out[31:0],Data_out[31:0],Addr_out[31:0]" */;
  input clk;
  input rst;
  input MIO_ready;
  input [31:0]inst_in;
  input [31:0]Data_in;
  output CPU_MIO;
  output MemRW;
  output [31:0]PC_out;
  output [31:0]Data_out;
  output [31:0]Addr_out;
endmodule
