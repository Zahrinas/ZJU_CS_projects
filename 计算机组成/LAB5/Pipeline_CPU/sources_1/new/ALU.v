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
    output reg [31:0] res,
    output zero
    );
    always@* begin
        case(ALU_operation)
            3'b000: res <= A & B;
            3'b001: res <= A | B;
            3'b010: res <= A + B;
            3'b110: res <= A - B;
            3'b111: res <= ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            3'b100: res <= ~(A | B);
            3'b101: res <= A << B[4:0];
            3'b011: res <= A ^ B;
        endcase
    end
    
    assign zero = ((res==32'b0)?1'b1:1'b0);
endmodule
