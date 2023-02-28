`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/02 16:05:27
// Design Name: 
// Module Name: MUX8T1_8
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


module MUX8T1_8(
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    input [7:0] I4,
    input [7:0] I5,
    input [7:0] I6,
    input [7:0] I7,
    input [2:0] s,
    output [7:0] o
    );
    
    assign o = s[2]? (s[1] ? (s[0] ? I7 : I6) : (s[0] ? I5 : I4)) : (s[1] ? (s[0] ? I3 : I2) : (s[0] ? I1 : I0));
    
endmodule
