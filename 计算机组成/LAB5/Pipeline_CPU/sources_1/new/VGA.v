
module VGA (
    input wire clk_25m,
    input wire clk_100m,
    input wire rst,
    
    input wire [31:0] PC_IF,
    input wire [31:0] inst_IF,
    input wire [31:0] PC_ID,
    input wire [31:0] inst_ID,
    input wire [31:0] PC_Ex,
    input wire MemRW_Ex,
    input wire MemRW_Mem,
    input wire [31:0] Data_out,
    input wire [31:0] Addr_out,
    input wire [31:0] Data_out_WB,
    output wire hs,
    output wire vs,
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b
);


    wire [9:0] vga_x;
    wire [8:0] vga_y;
    wire video_on;
    VgaController vga_controller(
        .clk(clk_25m),
        .rst(rst),
        .vga_x(vga_x),
        .vga_y(vga_y),
        .hs(hs),
        .vs(vs),
        .video_on(video_on)
    );

    wire display_wen;
    wire [11:0] display_w_addr;
    wire [7:0] display_w_data;
    VgaDisplay vga_display(
        .clk(clk_100m),
        .video_on(video_on),
        .vga_x(vga_x),
        .vga_y(vga_y),
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b),
        .wen(display_wen),
        .w_addr(display_w_addr),
        .w_data(display_w_data)
    );
    

    VgaDebugger vga_debugger(
        // DEBUG
        .pc(PC_IF),
        .inst(inst_IF),
        .IfId_pc(PC_ID),
        .IfId_inst(inst_ID),
        .IfId_valid(),
        .IdEx_pc(PC_Ex),
        .IdEx_inst(),
        .IdEx_valid(),
        .IdEx_rd(),
        .IdEx_rs1(),
        .IdEx_rs2(),
        .IdEx_rs1_val(),
        .IdEx_rs2_val(),
        .IdEx_reg_wen(),
        .IdEx_is_imm(),
        .IdEx_imm(),
        .IdEx_mem_wen(MemRW_Ex),
        .IdEx_mem_ren(),
        .IdEx_is_branch(),
        .IdEx_is_jal(),
        .IdEx_is_jalr(),
        .IdEx_is_auipc(),
        .IdEx_is_lui(),
        .IdEx_alu_ctrl(),
        .IdEx_cmp_ctrl(),
        .ExMa_pc(),
        .ExMa_inst(),
        .ExMa_valid(),
        .ExMa_rd(),
        .ExMa_reg_wen(),
        .ExMa_mem_w_data(Data_out),
        .ExMa_alu_res(Addr_out),
        .ExMa_mem_wen(MemRW_Mem),
        .ExMa_mem_ren(),
        .ExMa_is_jal(),
        .ExMa_is_jalr(),
        .MaWb_pc(),
        .MaWb_inst(),
        .MaWb_valid(),
        .MaWb_rd(),
        .MaWb_reg_wen(),
        .MaWb_reg_w_data(Data_out_WB),
        .x0(),
        .ra(),
        .sp(),
        .gp(),
        .tp(),
        .t0(),
        .t1(),
        .t2(),
        .s0(),
        .s1(),
        .a0(),
        .a1(),
        .a2(),
        .a3(),
        .a4(),
        .a5(),
        .a6(),
        .a7(),
        .s2(),
        .s3(),
        .s4(),
        .s5(),
        .s6(),
        .s7(),
        .s8(),
        .s9(),
        .s10(),
        .s11(),
        .t3(),
        .t4(),
        .t5(),
        .t6(), 
        .clk(clk_100m),
        .display_wen(display_wen),
        .display_w_addr(display_w_addr),
        .display_w_data(display_w_data)
    );


    
endmodule