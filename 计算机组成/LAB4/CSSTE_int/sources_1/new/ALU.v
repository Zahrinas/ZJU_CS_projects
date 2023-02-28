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
    input [3:0] ALU_operation,
    input [31:0] B,
    output [31:0] res,
    output zero
    );
    
    reg [31:0]MUX8T1_32_0_o;
    
    always@* begin
        case(ALU_operation)
        4'b0010:MUX8T1_32_0_o <= (A+B);
        4'b0110:MUX8T1_32_0_o <= (A-B);
        4'b1110:MUX8T1_32_0_o <= (A<<B);
        4'b0111:MUX8T1_32_0_o <= (($signed(A)<$signed(B))?32'b1:32'b0);
        4'b1001:MUX8T1_32_0_o <= (($unsigned(A)<$unsigned(B))?32'b1:32'b0);
        4'b1100:MUX8T1_32_0_o <= (A^B);
        4'b1101:MUX8T1_32_0_o <= (A>>>B[4:0]);
        4'b1111:MUX8T1_32_0_o <= (A>>B[4:0]);
        4'b0001:MUX8T1_32_0_o <= (A|B);
        4'b0000:MUX8T1_32_0_o <= (A&B);
        endcase
    end
    
    assign res = MUX8T1_32_0_o;
    assign zero = ((res == 0) ? 1'b1 : 1'b0);
endmodule

