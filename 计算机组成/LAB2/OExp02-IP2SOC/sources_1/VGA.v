`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 18:40:52
// Design Name: 
// Module Name: VGA
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


module VGA(
    input wire clk_25m,
    input wire clk_100m,
    input wire rst,
    input wire [31:0] pc,
    input wire [31:0] inst,
    input wire [31:0] alu_res,
    input wire mem_wen,
    input wire [31:0] dmem_o_data,
    input wire [31:0] dmem_i_data,
    input wire [31:0] dmem_addr,
    
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
           .clk          (clk_25m      ),
           .rst          (rst          ),
           .vga_x        (vga_x        ),
           .vga_y        (vga_y        ),
           .hs           (hs           ),
           .vs           (vs           ),
           .video_on     (video_on     )
      );
 wire display_wen;
 wire [11:0] display_w_addr;
 wire [7:0] display_w_data;
 VgaDisplay vga_display(
          .clk          (clk_100m      ),
          .video_on     (video_on      ),
          .vga_x        (vga_x         ),
          .vga_y        (vga_y         ),
          .vga_r        (vga_r         ),
          .vga_g        (vga_g         ),
          .vga_b        (vga_b         ),
          .wen          (display_wen   ),
          .w_addr       (display_w_addr),
          .w_data       (display_w_data)
      );
 VgaDebugger vga_debugger(
         .clk           (clk_100m      ),
         .display_wen   (display_wen   ),
         .display_w_addr(display_w_addr),
         .display_w_data(display_w_data),
         .pc            (pc             ),
         .inst          (inst           ),
         .rs1           (               ),
         .rs1_val       (               ),
         .rs2           (               ),
         .rs2_val       (               ),
         .rd            (               ),
         .reg_i_data    (               ),
         .reg_wen       (               ),
         .is_imm        (               ),
         .is_auipc      (               ),
         .is_lui        (               ),
         .imm           (               ),
         .a_val         (               ),
         .b_val         (               ),
         .alu_ctrl      (               ),
         .cmp_ctrl      (               ),
         .alu_res       (alu_res        ),
         .cmp_res       (               ),
         .is_branch     (               ),
         .is_jal        (               ),
         .is_jalr       (               ),
         .do_branch     (               ),
         .pc_branch     (               ),
         .mem_wen       (mem_wen        ),
         .mem_ren       (               ),
         .dmem_o_data   (dmem_o_data    ),
         .dmem_i_data   (dmem_i_data    ),
         .dmem_addr     (dmem_addr      ),
         .csr_wen       (               ),
         .csr_ind       (               ),
         .csr_ctrl      (               ),
         .csr_r_data    (               ),
         .x0            (               ),
         .ra            (               ),
         .sp            (               ),
         .gp            (               ),
         .tp            (               ),
         .t0            (               ),
         .t1            (               ),
         .t2            (               ),
         .s0            (               ),
         .s1            (               ),
         .a0            (               ),
         .a1            (               ),
         .a2            (               ),
         .a3            (               ),
         .a4            (               ),
         .a5            (               ),
         .a6            (               ),
         .a7            (               ),
         .s2            (               ),
         .s3            (               ),
         .s4            (               ),
         .s5            (               ),
         .s6            (               ),
         .s7            (               ),
         .s8            (               ),
         .s9            (               ),
         .s10           (               ),
         .s11           (               ),
         .t3            (               ),
         .t4            (               ),
         .t5            (               ),
         .t6            (               ),
         .mstatus_o     (               ),
         .mcause_o      (               ),
         .mepc_o        (               ),
         .mtval_o       (               ),
         .mtvec_o       (               ),
         .mie_o         (               ),
         .mip_o         (               )
     );
endmodule
