// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Mar  2 14:14:21 2022
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/RAM_B.v
// Design      : RAM_B
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module RAM_B(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea,addra[9:0],dina[31:0],douta[31:0]" */;
  input clka;
  input wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
endmodule
