`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/21 10:08:22
// Design Name: 
// Module Name: div32
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

module div32(
    input clk,
    input rst,
    
    input start,
    input [31:0]dividend,
    input [31:0]divisor,
    
    output finish,
    output [31:0]quotient,
    output [31:0]remainder
    );
    
    reg [31:0]rem_r;
    reg [31:0]quo_r;
    reg [5:0]bit_r;
    reg fin_r;
    
    always@(posedge rst) begin
        bit_r<=31;
        fin_r<=0;
        quo_r<=0;
        rem_r<=0;
    end
    always@(posedge start) begin
        bit_r<=31;
        fin_r<=0;
        rem_r<=0;
        quo_r<=0;
    end
    always@(posedge clk) begin
        if(fin_r==0 && start==1'b0) begin
            if((rem_r<<1)+dividend[bit_r]>=divisor) begin
                rem_r<=(rem_r<<1)+dividend[bit_r]-divisor;
                quo_r<=(quo_r<<1)+1;
            end
            else begin
                rem_r<=(rem_r<<1)+dividend[bit_r];
                quo_r<=(quo_r<<1);
            end
            if(bit_r==0) fin_r<=1;
            bit_r<=bit_r-1;
        end
    end
    assign remainder=rem_r;
    assign quotient=quo_r;
    assign finish=fin_r;
endmodule

