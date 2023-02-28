`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 16:12:32
// Design Name: 
// Module Name: CSSTE
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


module CSSTE(
    input clk_100mhz,
    input RSTN,
    input [3:0] BTN_y,
    input [15:0] SW,
    output [3:0] Blue,
    output [3:0] Green,
    output [3:0] Red,
    output HSYNC,
    output VSYNC,
    output LED_PEN,
    output SEG_PEN,
    output led_clk,
    output led_clrn,
    output led_sout,
    output seg_clk,
    output seg_clrn,
    output seg_sout
);
    wire [31:0]Addr_out;
    wire [31:0]Data_in;
    wire [31:0]Data_out;
    wire MemRW;
    wire [31:0]PC_out;
    wire Clk_CPU;
    wire [31:0]Inst_in;
    wire rst;
    wire [9:0]ram_addr;
    wire [31:0]ram_data_in;
    wire [31:0]RAM_B_0_douta;
    wire U4_data_ram_we;
    wire [3:0]BTN;
    wire [15:0]SW_OK;
    wire [15:0]led_out;
    wire [31:0]counter_out;
    wire counter0_out;
    wire counter1_out;
    wire counter2_out;
    wire GPIOf0000000_we;
    wire GPIOe0000000_we;
    wire counter_we;
    wire [31:0]Peripheral_in;
    wire [31:0]clk_div;
    wire [7:0]point_out;
    wire [7:0]LE_out;
    wire [31:0]Disp_num;
    wire [1:0]counter_set;
    
    SCPU U1
        (.Addr_out(Addr_out),
        .Data_in(Data_in),
        .Data_out(Data_out),
        .MemRW(MemRW),
        .MIO_ready(1'b0),
        .PC_out(PC_out),
        .clk(Clk_CPU),
        .inst_in(Inst_in),
        .rst(rst));
    ROM_D U2
        (.a(PC_out[11:2]),
        .spo(Inst_in));
    RAM_B U3
        (.addra(ram_addr),
        .clka(~clk_100mhz),
        .dina(ram_data_in),
        .douta(RAM_B_0_douta),
        .wea(U4_data_ram_we));
    MIO_BUS U4
        (.clk(clk_100mhz),
        .rst(rst),
        .BTN(BTN),
        .SW(SW_OK),
        .mem_w(MemRW),
        .Cpu_data2bus(Data_out),
        .addr_bus(Addr_out),
        .ram_data_out(RAM_B_0_douta),
        .led_out(led_out),
        .counter_out(counter_out),
        .counter0_out(counter0_out),
        .counter1_out(counter1_out),
        .counter2_out(counter2_out),
        .Cpu_data4bus(Data_in),
        .ram_data_in(ram_data_in),
        .ram_addr(ram_addr),
        .data_ram_we(U4_data_ram_we),
        .GPIOf0000000_we(GPIOf0000000_we),
        .GPIOe0000000_we(GPIOe0000000_we),
        .counter_we(counter_we),
        .Peripheral_in(Peripheral_in));
    Multi_8CH32 U5
        (.clk(~Clk_CPU),
        .rst(rst),
        .EN(GPIOe0000000_we),
        .Test(SW_OK[7:5]),
        .point_in({clk_div[31:0],clk_div[31:0]}),
        .LES(64'b0),
        .Data0(Peripheral_in),
        .data1({2'b0,PC_out[31:2]}),
        .data2(Inst_in),
        .data3(counter_out),
        .data4(Addr_out),
        .data5(Data_out),
        .data6(Data_in),
        .data7(PC_out),
        .point_out(point_out),
        .LE_out(LE_out),
        .Disp_num(Disp_num));
    SSeg7_Dev U6
        (.clk(clk_100mhz),
        .flash(clk_div[25]),
        .Hexs(Disp_num),
        .LES(LE_out),
        .point(point_out),
        .rst(rst),
        .Start(clk_div[20]),
        .SW0(SW_OK[0]),
        .seg_clk(seg_clk),
        .seg_clrn(seg_clrn),
        .SEG_PEN(SEG_PEN),
        .seg_sout(seg_sout)
        );
    SPIO U7
        (.clk(~Clk_CPU),
        .rst(rst),
        .Start(clk_div[20]),
        .EN(GPIOf0000000_we),
        .P_Data(Peripheral_in),
        .counter_set(counter_set),
        .LED_out(led_out),
        .led_clk(led_clk),
        .led_sout(led_sout),
        .led_clrn(led_clrn),
        .LED_PEN(LED_PEN)
        );
    clk_div U8
        (.clk(clk_100mhz),
        .rst(rst),
        .SW2(SW_OK[2]),
        .SW8(SW_OK[8]),
        .STEP(SW_OK[10]|BTN[0]),
        .clkdiv(clk_div),
        .Clk_CPU(Clk_CPU)
        );
    SAnti_jitter U9
        (.clk(clk_100mhz),
        .RSTN(RSTN),
        .readn(1'b0),
        .Key_y(BTN_y),
        .SW(SW),
        .BTN_OK(BTN),
        .SW_OK(SW_OK),
        .rst(rst)
        );
    Counter_x U10
        (.clk(~Clk_CPU),
        .rst(rst),
        .clk0(clk_div[6]),
        .clk1(clk_div[9]),
        .clk2(clk_div[11]),
        .counter_we(counter_we),
        .counter_val(Peripheral_in),
        .counter_ch(counter_set),
        .counter0_OUT(counter0_out),
        .counter1_OUT(counter1_out),
        .counter2_OUT(counter2_out),
        .counter_out(counter_out)
        );
    VGA U11
        (.clk_25m(clk_div[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .pc(PC_out),
        .inst(Inst_in),
        .alu_res(Addr_out),
        .mem_wen(MemRW),
        .dmem_o_data(RAM_B_0_douta),
        .dmem_i_data(ram_data_in),
        .dmem_addr(Addr_out),
        .hs(HSYNC),
        .vs(VSYNC),
        .vga_r(Red),
        .vga_g(Green),
        .vga_b(Blue)
        );
endmodule