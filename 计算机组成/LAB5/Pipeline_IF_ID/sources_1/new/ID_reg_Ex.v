// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun May 16 18:23:52 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/ID_reg_Ex.v
// Design      : ID_reg_Ex
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ID_reg_Ex(clk_IDEX, rst_IDEX, en_IDEX, PC_in_IDEX, 
  Rd_addr_IDEX, Rs1_in_IDEx, Rs2_in_IDEX, Imm_in_IDEX, ALUSrc_B_in_IDEX, ALU_control_in_IDEX, 
  Branch_in_IDEX, BranchN_in_IDEX, MemRW_in_IDEX, Jump_in_IDEX, MemtoReg_in_IDEX, 
  RegWrite_in_IDEX, PC_out_IDEX, Rd_addr_out_IDEX, Rs1_out_IDEX, Rs2_out_IDEX, Imm_out_IDEX, 
  ALUSrc_B_out_IDEX, ALU_control_out_IDEX, Branch_out_IDEX, BranchN_out_IDEX, 
  MemRW_out_IDEX, Jump_out_IDEX, MemtoReg_out_IDEX, RegWrite_out_IDEX)
/* synthesis syn_black_box black_box_pad_pin="clk_IDEX,rst_IDEX,en_IDEX,PC_in_IDEX[31:0],Rd_addr_IDEX[4:0],Rs1_in_IDEx[31:0],Rs2_in_IDEX[31:0],Imm_in_IDEX[31:0],ALUSrc_B_in_IDEX,ALU_control_in_IDEX[2:0],Branch_in_IDEX,BranchN_in_IDEX,MemRW_in_IDEX,Jump_in_IDEX,MemtoReg_in_IDEX[1:0],RegWrite_in_IDEX,PC_out_IDEX[31:0],Rd_addr_out_IDEX[4:0],Rs1_out_IDEX[31:0],Rs2_out_IDEX[31:0],Imm_out_IDEX[31:0],ALUSrc_B_out_IDEX,ALU_control_out_IDEX[2:0],Branch_out_IDEX,BranchN_out_IDEX,MemRW_out_IDEX,Jump_out_IDEX,MemtoReg_out_IDEX[1:0],RegWrite_out_IDEX" */;
  input clk_IDEX;
  input rst_IDEX;
  input en_IDEX;
  input [31:0]PC_in_IDEX;
  input [4:0]Rd_addr_IDEX;
  input [31:0]Rs1_in_IDEx;
  input [31:0]Rs2_in_IDEX;
  input [31:0]Imm_in_IDEX;
  input ALUSrc_B_in_IDEX;
  input [2:0]ALU_control_in_IDEX;
  input Branch_in_IDEX;
  input BranchN_in_IDEX;
  input MemRW_in_IDEX;
  input Jump_in_IDEX;
  input [1:0]MemtoReg_in_IDEX;
  input RegWrite_in_IDEX;
  output [31:0]PC_out_IDEX;
  output [4:0]Rd_addr_out_IDEX;
  output [31:0]Rs1_out_IDEX;
  output [31:0]Rs2_out_IDEX;
  output [31:0]Imm_out_IDEX;
  output ALUSrc_B_out_IDEX;
  output [2:0]ALU_control_out_IDEX;
  output Branch_out_IDEX;
  output BranchN_out_IDEX;
  output MemRW_out_IDEX;
  output Jump_out_IDEX;
  output [1:0]MemtoReg_out_IDEX;
  output RegWrite_out_IDEX;
endmodule
