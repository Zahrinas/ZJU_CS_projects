`timescale 1ps/1ps

module HazardDetectionUnit(
    input clk,
    input Branch_ID, rs1use_ID, rs2use_ID,
    input[1:0] hazard_optype_ID,
    input[4:0] rd_EXE, rd_MEM, rs1_ID, rs2_ID, rs2_EXE,
    output PC_EN_IF, reg_FD_EN, reg_FD_stall, reg_FD_flush,
        reg_DE_EN, reg_DE_flush, reg_EM_EN, reg_EM_flush, reg_MW_EN,
    output forward_ctrl_ls,
    output[1:0] forward_ctrl_A, forward_ctrl_B
);
            //according to the diagram, design the Hazard Detection Unit
    reg[1:0] hazard_optype_EXE, hazard_optype_MEM;
    always@(posedge clk) begin
        hazard_optype_MEM <= hazard_optype_EXE & {2{~reg_EM_flush}};
        hazard_optype_EXE <= hazard_optype_ID & {2{~reg_DE_flush}};
    end
    
    parameter hazard_optype_ALU = 2'd1;
    parameter hazard_optype_LOAD = 2'd2;
    parameter hazard_optype_STORE = 2'd3;
    
    wire rs1_forward_1     = rs1use_ID && rd_EXE != 5'b00000 && rd_EXE == rs1_ID && hazard_optype_EXE == hazard_optype_ALU;
    wire rs1_forward_stall = rs1use_ID && rd_EXE != 5'b00000 && rd_EXE == rs1_ID && hazard_optype_EXE == hazard_optype_LOAD && hazard_optype_ID != hazard_optype_STORE;
    wire rs1_forward_2     = rs1use_ID && rd_MEM != 5'b00000 && rd_MEM == rs1_ID && hazard_optype_MEM == hazard_optype_ALU;
    wire rs1_forward_3     = rs1use_ID && rd_MEM != 5'b00000 && rd_MEM == rs1_ID && hazard_optype_MEM == hazard_optype_LOAD;
    
    assign forward_ctrl_A = {2{rs1_forward_1}} & 2'b01 |
                            {2{rs1_forward_2}} & 2'b10 |
                            {2{rs1_forward_3}} & 2'b11 ;
    
    wire rs2_forward_1     = rs2use_ID && rd_EXE != 5'b00000  && rd_EXE == rs2_ID && hazard_optype_EXE == hazard_optype_ALU;
    wire rs2_forward_stall = rs2use_ID && rd_EXE != 5'b00000  && rd_EXE == rs2_ID && hazard_optype_EXE == hazard_optype_LOAD && hazard_optype_ID != hazard_optype_STORE;
    wire rs2_forward_2     = rs2use_ID && rd_MEM != 5'b00000  && rd_MEM == rs2_ID && hazard_optype_MEM == hazard_optype_ALU;
    wire rs2_forward_3     = rs2use_ID && rd_MEM != 5'b00000  && rd_MEM == rs2_ID && hazard_optype_MEM == hazard_optype_LOAD;
    
    assign forward_ctrl_B = {2{rs2_forward_1}} & 2'b01 |
                            {2{rs2_forward_2}} & 2'b10 |
                            {2{rs2_forward_3}} & 2'b11 ;
    
    assign forward_ctrl_ls = rd_MEM == rs2_EXE && rd_MEM != 5'b00000 && hazard_optype_EXE == hazard_optype_STORE && hazard_optype_MEM == hazard_optype_LOAD;
    
    assign PC_EN_IF = ~(rs1_forward_stall | rs2_forward_stall);
    assign reg_FD_stall = rs1_forward_stall | rs2_forward_stall;
    assign reg_FD_flush = Branch_ID;
    assign reg_DE_flush = rs1_forward_stall | rs2_forward_stall;
    assign reg_EM_flush = 1'b0;
    assign reg_FD_EN = 1'b1;
    assign reg_DE_EN = 1'b1;
    assign reg_EM_EN = 1'b1;
    assign reg_MW_EN = 1'b1;
    
endmodule