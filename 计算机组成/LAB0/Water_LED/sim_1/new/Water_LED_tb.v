`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/27 16:41:19
// Design Name: 
// Module Name: Water_LED_tb
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


module Water_LED_tb;
   reg CLK_i;
   reg RSTn_i;
   wire  [3:0]LED_o;
   
   Water_LED Water_LED_U(
             .CLK_i(CLK_i),
             .RSTn_i(RSTn_i),
             .LED_o(LED_o)
   );
   
   always #5 CLK_i = ~CLK_i;
   
   initial begin
       CLK_i = 0;
       RSTn_i = 0;
       #100 RSTn_i = 1;
       
   end
endmodule