`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    21:34:44 03/12/2012
// Design Name:
// Module Name:    REGS EX/MEM Latch
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module   REG_EX_MEM(input clk,                                      //EX/MEM Latch
                    input rst,
                    input EN,                                       //流水寄存器使�?
                    input flush,                                    //异常时清除异常指令并等待中断处理(保留)�?
                    input [31:0] IR_EX,                             //当前执行指令(测试)
                    input [31:0] PCurrent_EX,                       //当前执行指令存储器指�?
                    input [31:0] ALUO_EX,                           //当前ALU执行输出：有效地�?或ALU操作
                    input [31:0] B_EX,                              //ID级读出寄存器B数据：CPU输出数据
                    input [4:0]  rd_EX,                             //传�?�当前指令写目的寄存器地�?
                    input DatatoReg_EX,                      //传�?�当前指令REG写数据�?�道选择
                    input RegWrite_EX,                              //传�?�当前指令寄存器写信�?
                    input WR_EX,                                    //传�?�当前指令存储器读写信号
                    input[2:0] u_b_h_w_EX,
                    input MIO_EX,

                    output reg[31:0] PCurrent_MEM,                  //锁存传�?�当前指令地�?
                    output reg[31:0] IR_MEM,                        //锁存传�?�当前指�?(测试)
                    output reg[31:0] ALUO_MEM,                      //锁存ALU操作结果：有效地�?或ALU操作
                    output reg[31:0] Datao_MEM,                     //锁存传�?�当前指令输出MIO数据
                    output reg[4:0]  rd_MEM,                        //锁存传�?�当前指令写目的寄存器地�?
                    output reg       DatatoReg_MEM,                 //锁存传�?�当前指令REG写数据�?�道选择
                    output reg       RegWrite_MEM,                  //锁存传�?�当前指令寄存器写信�?
                    output reg       WR_MEM,                         //锁存传�?�当前指令存储器读写信号
                    output reg[2:0]  u_b_h_w_MEM,
                    output reg       MIO_MEM
                );

    always @(posedge clk) begin
        if(rst) begin
            IR_MEM       <= 0;
            PCurrent_MEM <= 0;
            rd_MEM       <= 0;
            RegWrite_MEM <= 0;
            WR_MEM       <= 0;
            MIO_MEM      <= 0;
        end
        else if(EN) begin                                      //EX级正常传输到MEM�?
                IR_MEM       <= IR_EX;
                PCurrent_MEM <= PCurrent_EX;                  //传�?�锁存当前指令地�?
                ALUO_MEM     <= ALUO_EX;                      //锁存有效地址或ALU操作
                Datao_MEM    <= B_EX;                         //传�?�锁存CPU输出数据
                DatatoReg_MEM <= DatatoReg_EX;                      //传�?�锁存REG写数据�?�道选择
                RegWrite_MEM  <= RegWrite_EX;                 //传�?�锁存目的寄存器写信�?
                WR_MEM        <= WR_EX;                       //传�?�锁存存储器读写信号
                rd_MEM        <= rd_EX;                       //传�?�锁存写目的寄存器地�?
                u_b_h_w_MEM   <= u_b_h_w_EX;
                MIO_MEM       <= MIO_EX;
        end
    end

endmodule