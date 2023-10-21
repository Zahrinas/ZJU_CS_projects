`timescale 1ns / 1ps

module FU_jump(
	input clk, EN, JALR,
	input[2:0] cmp_ctrl,
	input[31:0] rs1_data, rs2_data, imm, PC,
	output[31:0] PC_jump, PC_wb,
	output cmp_res, finish
);

    reg state;
    assign finish = state == 1'b1;
	initial begin
        state = 0;
    end

	reg JALR_reg;
	reg[2:0] cmp_ctrl_reg;
	reg[31:0] rs1_data_reg, rs2_data_reg, imm_reg, PC_reg;

	always@(posedge clk) begin
	   if(EN & ~state) begin
	       JALR_reg <= JALR;
	       cmp_ctrl_reg <= cmp_ctrl;
	       rs1_data_reg <= rs1_data;
	       rs2_data_reg <= rs2_data;
	       imm_reg <= imm;
	       PC_reg <= PC;
	       state <= 1;
	   end
	   else begin
	       state <= 0;
	   end
	end
	
    cmp_32 cmp(.a(rs1_data_reg),.b(rs2_data_reg),.ctrl(cmp_ctrl_reg),.c(cmp_res));
    add_32 a(.a(imm_reg),.b(JALR_reg ? rs1_data_reg : PC_reg),.c(PC_jump));
    add_32 b(.a(pc_reg),.b(4),.c(PC_wb));
endmodule