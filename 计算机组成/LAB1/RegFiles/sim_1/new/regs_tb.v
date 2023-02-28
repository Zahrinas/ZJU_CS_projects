`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/09 16:45:10
// Design Name: 
// Module Name: regs_tb
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


module Regs_tb;
                reg clk;
				reg rst;
				reg [4:0] Rs1_addr; 
				reg [4:0] Rs2_addr; 
				reg [4:0] Wt_addr; 
				reg [31:0]Wt_data; 
				reg RegWrite; 
				wire [31:0] Rs1_data; 
				wire [31:0] Rs2_data;
regs regs_U(
      .clk(clk),
      .rst(rst),
      .Rs1_addr(Rs1_addr),
      .Rs2_addr(Rs2_addr),
      .Wt_addr(Wt_addr),
      .Wt_data(Wt_data),
      .RegWrite(RegWrite),
      .Rs1_data(Rs1_data),
      .Rs2_data(Rs2_data)
);

always #10 clk = ~clk;

initial begin
     clk = 0;
     rst = 1;
     RegWrite = 0;
     Wt_data = 0;
     Wt_addr = 0;
     Rs1_addr = 0;
     Rs2_addr = 0;
     #100
     rst = 0;
     RegWrite = 1;
     Wt_addr = 5'b00101;
     Wt_data = 32'ha5a5a5a5;
     #50
     Wt_addr = 5'b01010;
     Wt_data = 32'h5a5a5a5a;
     #50
     RegWrite = 0;
     Rs1_addr = 5'b00101;
     Rs2_addr = 5'b01010;
    
    #100 $stop();

end

endmodule

