// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Mar  2 14:10:34 2022
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/VGA.v
// Design      : VGA
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module VGA(clk_25m, clk_100m, rst, pc, inst, alu_res, mem_wen, 
  dmem_o_data, dmem_i_data, dmem_addr, hs, vs, vga_r, vga_g, vga_b)
/* synthesis syn_black_box black_box_pad_pin="clk_25m,clk_100m,rst,pc[31:0],inst[31:0],alu_res[31:0],mem_wen,dmem_o_data[31:0],dmem_i_data[31:0],dmem_addr[31:0],hs,vs,vga_r[3:0],vga_g[3:0],vga_b[3:0]" */;
  input clk_25m;
  input clk_100m;
  input rst;
  input [31:0]pc;
  input [31:0]inst;
  input [31:0]alu_res;
  input mem_wen;
  input [31:0]dmem_o_data;
  input [31:0]dmem_i_data;
  input [31:0]dmem_addr;
  output hs;
  output vs;
  output [3:0]vga_r;
  output [3:0]vga_g;
  output [3:0]vga_b;
endmodule
