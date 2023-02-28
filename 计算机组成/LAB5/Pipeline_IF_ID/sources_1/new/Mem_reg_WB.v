// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun May 16 18:29:19 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/Mem_reg_WB.v
// Design      : Mem_reg_WB
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Mem_reg_WB(clk_MemWB, rst_MemWB, en_MemWB, PC4_in_MemWB, 
  Rd_addr_MemWB, ALU_in_MemWB, DMem_data_MemWB, MemtoReg_in_MemWB, RegWrite_in_MemWB, 
  PC4_out_MemWB, Rd_addr_out_MemWB, ALU_out_MemWB, DMem_data_out_MemWB, MemtoReg_out_MemWB, 
  RegWrite_out_MemWB)
/* synthesis syn_black_box black_box_pad_pin="clk_MemWB,rst_MemWB,en_MemWB,PC4_in_MemWB[31:0],Rd_addr_MemWB[4:0],ALU_in_MemWB[31:0],DMem_data_MemWB[31:0],MemtoReg_in_MemWB[1:0],RegWrite_in_MemWB,PC4_out_MemWB[31:0],Rd_addr_out_MemWB[4:0],ALU_out_MemWB[31:0],DMem_data_out_MemWB[31:0],MemtoReg_out_MemWB[1:0],RegWrite_out_MemWB" */;
  input clk_MemWB;
  input rst_MemWB;
  input en_MemWB;
  input [31:0]PC4_in_MemWB;
  input [4:0]Rd_addr_MemWB;
  input [31:0]ALU_in_MemWB;
  input [31:0]DMem_data_MemWB;
  input [1:0]MemtoReg_in_MemWB;
  input RegWrite_in_MemWB;
  output [31:0]PC4_out_MemWB;
  output [4:0]Rd_addr_out_MemWB;
  output [31:0]ALU_out_MemWB;
  output [31:0]DMem_data_out_MemWB;
  output [1:0]MemtoReg_out_MemWB;
  output RegWrite_out_MemWB;
endmodule
