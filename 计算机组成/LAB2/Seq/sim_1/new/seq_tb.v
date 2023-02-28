`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/14 10:51:17
// Design Name: 
// Module Name: seq_tb
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


module tb_seq();
     reg clk;
	 reg rst;
	 reg in;	 
	 wire out;
	 
 always #20 clk = ~clk;
 
 initial
     begin
	     clk = 0;
		 rst = 0;
		 #20 rst = 1;
	end
	
 //011100101
 initial
     begin
	     in = 0;
		 #30
		 in = 1;
		 #40
		 in = 1;
		 #40
		 in = 1;
		 #40
		 in = 0;
		 #40
		 in = 0;
		 #40
		 in = 1;
		 #40
		 in = 0;
		 #40
		 in = 1;
		 #40
		 $finish;
		 end
		
/*
 initial
      begin
	     $readmemh("data.txt",data);
		 for(i=0;i<8;i=i+1)
		     begin
			     #40
				 $display("data=%d",data[i]);
			 end
		 #200
		 $finish;
    end
*/
 seq seq_u1(
     .clk(clk),
	 .rst(rst),
	 .in(in),
	 .out(out)
);
endmodule