// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun May 16 18:10:34 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/Pipeline_Ex.v
// Design      : Pipeline_Ex
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Pipeline_Ex(PC_in_EX, Rs1_in_EX, Rs2_in_EX, Imm_in_EX, 
  ALUSrc_B_in_EX, ALU_control_in_EX, PC_out_EX, PC4_out_EX, zero_out_EX, ALU_out_EX, 
  Rs2_out_EX)
/* synthesis syn_black_box black_box_pad_pin="PC_in_EX[31:0],Rs1_in_EX[31:0],Rs2_in_EX[31:0],Imm_in_EX[31:0],ALUSrc_B_in_EX,ALU_control_in_EX[2:0],PC_out_EX[31:0],PC4_out_EX[31:0],zero_out_EX,ALU_out_EX[31:0],Rs2_out_EX[31:0]" */;
  input [31:0]PC_in_EX;
  input [31:0]Rs1_in_EX;
  input [31:0]Rs2_in_EX;
  input [31:0]Imm_in_EX;
  input ALUSrc_B_in_EX;
  input [2:0]ALU_control_in_EX;
  output [31:0]PC_out_EX;
  output [31:0]PC4_out_EX;
  output zero_out_EX;
  output [31:0]ALU_out_EX;
  output [31:0]Rs2_out_EX;
endmodule
