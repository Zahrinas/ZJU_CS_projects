`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    21:34:44 03/12/2012
// Design Name:
// Module Name:    REGS IF/ID Latch
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

module    REG_IF_ID(input clk,                                      //IF/ID Latch
                    input rst,
                    input EN,                                       //流水寄存器使�?
                    input Data_stall,                               //数据竞争等待
                    input flush,                                    //控制竞争清除并等�?
                    input [31:0] PCOUT,                             //指令存储器指�?
                    input [31:0] IR,                                //指令存储器输�?

                    output reg[31:0] IR_ID,                         //取指锁存
                    output reg[31:0] PCurrent_ID,                   //当前存在指令地址
                    output reg isFlushed
                );

//reg[31:0]PCurrent_ID,IR_ID;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            IR_ID <= 32'h00000013;                            //复位清零
            PCurrent_ID <= 32'h00000000;                     //复位清零
            isFlushed <= 0;
        end
        else if(EN)begin
            if(Data_stall)begin
                IR_ID <= IR_ID;                          //IR waiting for Data Hazards 并暂停取�?
                PCurrent_ID <= PCurrent_ID;           //保存对应PC指针
                isFlushed <= 0;
            end
            else if(flush)begin
                IR_ID <= 32'h00000013;              //IR waiting for Control Hazards i清s除指令并暂停
                PCurrent_ID <= PCurrent_ID;      //清除指令的指�?(测试)
                isFlushed <= 1;
            end
            else begin
                IR_ID <= IR;                       //正常取指,传�?�下�?流水级译�?
                PCurrent_ID <= PCOUT;           //当前取指PC地址，Branch/Junp指令计算目标地址�?(非PC+4)
                isFlushed <= 0;
            end
        end
    end

endmodule