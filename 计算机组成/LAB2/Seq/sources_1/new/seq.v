`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/09 17:08:24
// Design Name: 
// Module Name: seq
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


module seq(
    input wire clk,
    input wire rst,
    input wire in,
    output wire out
    );
    
    parameter[2:0] S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,
                    S4=3'b100,S5=3'b101,S6=3'b110,S7=3'b111;
    reg[2:0] curr_state;
    reg[2:0] next_state;
    
    always@(posedge clk or negedge rst) begin
        if(!rst) curr_state<=S0;
        else curr_state<=next_state;
    end
    
    always@(curr_state or in) begin
        case(curr_state)
            S0: begin
                    if(in==0) next_state=S0;
                    else next_state=S1;
                end
            S1: begin
                    if(in==0) next_state=S0;
                    else next_state=S2;
                end
            S2: begin
                    if(in==0) next_state=S0;
                    else next_state=S3;
                end
            S3: begin
                    if(in==0) next_state=S4;
                    else next_state=S3;
                end
            S4: begin
                    if(in==0) next_state=S5;
                    else next_state=S1;
                end
            S5: begin
                    if(in==0) next_state=S0;
                    else next_state=S6;
                end
            S6: begin
                    if(in==0) next_state=S7;
                    else next_state=S2;
                end
            S7: begin
                    if(in==0) next_state=S0;
                    else next_state=S1;
                end
            default:
                next_state=S0;
        endcase
    end
    
    assign out = (curr_state==S7) ? 1 : 0;
endmodule
