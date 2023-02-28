`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/06 16:02:13
// Design Name: 
// Module Name: SCPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SCPU(
    input MIO_ready,
    input INT0,
    input [31:0]Data_in,
    input clk,
    input [31:0]inst_in,
    input rst,
    
    output MemRW,
    output CPU_MIO,
    output [31:0]Addr_out,
    output [31:0]Data_out,
    output [31:0]PC_out
    );
    
    wire [2:0]ImmSel;
    wire ALUSrc_B;
    wire [1:0]MemtoReg;
    wire [1:0]Jump;
    wire Branch;
    wire RegWrite;
    wire [3:0]ALU_Control;
    wire BranchN;
    wire ecall;
    wire mret;
    wire ill_instr;
    
    SCPU_ctrl Controller(
        .OPcode(inst_in[6:2]),
        .Fun3(inst_in[14:12]),
        .Fun7(inst_in[30]),
        .MIO_ready(MIO_ready),
        .Fun_ecall(inst_in[22:20]),
        .Fun_mret(inst_in[29:28]),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .BranchN(BranchN),
        .RegWrite(RegWrite),
        .MemRW(MemRW),
        .ALU_Control(ALU_Control),
        .CPU_MIO(CPU_MIO),
        .ecall(ecall),
        .mret(mret),
        .ill_instr(ill_instr)
        );
    DataPath DataPath(
        .ALUSrc_B(ALUSrc_B),
        .ALU_Control(ALU_Control),
        .Branch(Branch),
        .BranchN(BranchN),
        .Data_in(Data_in),
        .ImmSel(ImmSel),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .clk(clk),
        .inst_field(inst_in),
        .rst(rst),
        .INT0(INT0),
        .ecall(ecall),
        .mret(mret),
        .ill_instr(ill_instr),
        .ALU_out(Addr_out),
        .Data_out(Data_out),
        .PC_out(PC_out)
        );
endmodule

