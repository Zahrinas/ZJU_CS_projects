`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/28 10:22:26
// Design Name: 
// Module Name: MUX2T1_5
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


module MUX2T1_5(
    input [4:0] I0,
    input [4:0] I1,
    input s,
    output [4:0] o
    );
    
    assign o = s ? I1 : I0;
    
endmodule
