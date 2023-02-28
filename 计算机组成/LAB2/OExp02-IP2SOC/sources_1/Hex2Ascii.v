`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 19:14:45
// Design Name: 
// Module Name: Hex2Ascii
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


module Hex2Ascii(
    input wire [3:0] hex,
    output reg [7:0] ascii
);

    always @* begin
        case (hex)
            4'h0: ascii = 48;
            4'h1: ascii = 49;
            4'h2: ascii = 50;
            4'h3: ascii = 51;
            4'h4: ascii = 52;
            4'h5: ascii = 53;
            4'h6: ascii = 54;
            4'h7: ascii = 55;
            4'h8: ascii = 56;
            4'h9: ascii = 57;
            4'ha: ascii = 97;
            4'hb: ascii = 98;
            4'hc: ascii = 99;
            4'hd: ascii = 100;
            4'he: ascii = 101;
            4'hf: ascii = 102;
        endcase
    end

endmodule
