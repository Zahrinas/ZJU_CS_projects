// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Mar  1 13:35:41 2021
// Host        : DESKTOP-BJQ6VJA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/MIO_BUS.v
// Design      : MIO_BUS
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MIO_BUS(clk, rst, BTN, SW, mem_w, Cpu_data2bus, addr_bus, 
  ram_data_out, led_out, counter_out, counter0_out, counter1_out, counter2_out, Cpu_data4bus, 
  ram_data_in, ram_addr, data_ram_we, GPIOf0000000_we, GPIOe0000000_we, counter_we, 
  Peripheral_in)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,BTN[3:0],SW[15:0],mem_w,Cpu_data2bus[31:0],addr_bus[31:0],ram_data_out[31:0],led_out[15:0],counter_out[31:0],counter0_out,counter1_out,counter2_out,Cpu_data4bus[31:0],ram_data_in[31:0],ram_addr[9:0],data_ram_we,GPIOf0000000_we,GPIOe0000000_we,counter_we,Peripheral_in[31:0]" */;
  input clk;
  input rst;
  input [3:0]BTN;
  input [15:0]SW;
  input mem_w;
  input [31:0]Cpu_data2bus;
  input [31:0]addr_bus;
  input [31:0]ram_data_out;
  input [15:0]led_out;
  input [31:0]counter_out;
  input counter0_out;
  input counter1_out;
  input counter2_out;
  output [31:0]Cpu_data4bus;
  output [31:0]ram_data_in;
  output [9:0]ram_addr;
  output data_ram_we;
  output GPIOf0000000_we;
  output GPIOe0000000_we;
  output counter_we;
  output [31:0]Peripheral_in;
endmodule
