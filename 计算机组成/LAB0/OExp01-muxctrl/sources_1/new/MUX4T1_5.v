`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/01 15:51:25
// Design Name: 
// Module Name: MUX4T1_5
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


module MUX4T1_5(
    input [4:0] I0,
    input [4:0] I1,
    input [4:0] I2,
    input [4:0] I3,
    input [1:0] s,
    output [4:0] o
    );
    
    assign o = s[1] ? (s[0] ? I3 : I2) : (s[0] ? I1 : I0);
    
endmodule


