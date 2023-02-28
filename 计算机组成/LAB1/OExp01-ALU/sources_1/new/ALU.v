`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/02 16:36:07
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [2:0] ALU_operation,
    input [31:0] B,
    output [31:0] res,
    output zero
    );
    
    wire [31:0]and32_0_res;
    wire [31:0]or32_0_res;
    wire [31:0]xor_32_0_res;
    wire [31:0]xor_32_1_res;
    wire [31:0]nor_32_0_res;
    wire [31:0]srl_32_0_res;
    wire [31:0]MUX8T1_32_0_o;
    wire [32:0]addc_32_0_S;
    wire [31:0]SignalExt_32_0_o;
    
    SignalExt_32 SignalExt_32_0(
        .S(ALU_operation[0]),
        .So(SignalExt_32_0_o)
    );
    
    xor32 xor32_1(
        .A(SignalExt_32_0_o),
        .B(B),
        .res(xor_32_1_res)
    );
    
    ADC32 addc_32_0(
        .A(A),
        .B(xor_32_1_res),
        .C0(ALU_operation[0]),
        .S(addc_32_0_S)
    );
    
    and32 and32_0(
        .A(A),
        .B(B),
        .res(and32_0_res)
    );
    
    or32 or32_0(
        .A(A),
        .B(B),
        .res(or32_0_res)
    );
    
    xor32 xor32_0(
        .A(A),
        .B(B),
        .res(xor_32_0_res)
    );
    
    nor32 nor32_0(
        .A(A),
        .B(B),
        .res(nor_32_0_res)
    );
    
    srl32 srl32_0(
        .A(A),
        .B(B[4:0]),
        .res(srl_32_0_res)
    );
    
    MUX8T1_32 MUX8T1_32_0
        (.I0(and32_0_res),
        .I1(or32_0_res),
        .I2(addc_32_0_S[31:0]),
        .I3(xor_32_0_res),
        .I4(nor_32_0_res),
        .I5(srl_32_0_res),
        .I6(addc_32_0_S[31:0]),
        .I7({31'b0,addc_32_0_S[32]}),
        .o(MUX8T1_32_0_o),
        .s(ALU_operation)
    );
    
    or_bit_32 or_bit_32_0(
        .A(MUX8T1_32_0_o),
        .o(zero)
    );
    
    assign res = MUX8T1_32_0_o;
    
endmodule
