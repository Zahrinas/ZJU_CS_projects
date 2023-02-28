// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun May 16 18:13:08 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/Pipeline_Mem.v
// Design      : Pipeline_Mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Pipeline_Mem(zero_in_Mem, Branch_in_Mem, BranchN_in_Mem, 
  Jump_in_Mem, PCSrc)
/* synthesis syn_black_box black_box_pad_pin="zero_in_Mem,Branch_in_Mem,BranchN_in_Mem,Jump_in_Mem,PCSrc" */;
  input zero_in_Mem;
  input Branch_in_Mem;
  input BranchN_in_Mem;
  input Jump_in_Mem;
  output PCSrc;
endmodule
