`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 07:58:18
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
    input [3:0]BTN_y,
    input [15:0]SW,
    output HSYNC,
    output VSYNC,
    output [3:0]Red,
    output [3:0]Green,
    output [3:0]Blue,
    output led_clk,
    output led_sout,
    output led_clrn,
    output LED_PEN,
    output seg_clk,
    output seg_clrn,
    output SEG_PEN,
    output seg_sout
    );
    
    wire [3:0]BTN_OK;
    wire [15:0]SW_OK;
    wire rst;
    wire [31:0]clkdiv;
    wire Clk_CPU;
    wire counter0_OUT;
    wire counter1_OUT;
    wire counter2_OUT;
    wire [31:0]counter_out;
    wire [31:0]Cpu_data4bus;
    wire [31:0]ram_data_in;
    wire [9:0]ram_addr;
    wire data_ram_we;
    wire GPIOf0000000_we;
    wire GPIOe0000000_we;
    wire counter_we;
    wire [31:0]Peripheral_in;
    wire [31:0]douta;
    wire [1:0]counter_set;
    wire [15:0]LED_out;
    wire [31:0]spo;
    wire [31:0]PC_out_IF;
    wire [31:0]PC_out_ID;
    wire [31:0]inst_ID;
    wire [31:0]PC_out_Ex;
    wire MemRW_Ex;
    wire MemRW_Mem;
    wire [31:0]Data_out;
    wire [31:0]Addr_out;
    wire [31:0]Data_out_WB;
    wire [7:0]point_out;
    wire [7:0]LE_out;
    wire [31:0]Disp_num;
    
    Pipeline_CPU U1(
        .clk(Clk_CPU),
        .rst(rst),
        .inst_IF(spo),
        .Data_in(Cpu_data4bus),
        .PC_out_IF(PC_out_IF),
        .PC_out_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_out_Ex(PC_out_Ex),
        .MemRW_Ex(MemRW_Ex),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),
        .Addr_out(Addr_out),
        .Data_out_WB(Data_out_WB)
    );
    ROM_D U2(
        .a(PC_out_IF[11:2]),
        .spo(spo)
    );
    RAM_B U3(
        .clka(~clk_100mhz),
        .wea(data_ram_we),
        .addra(ram_addr),
        .dina(ram_data_in),
        .douta(douta)
    );
    MIO_BUS U4(
        .clk(clk_100mhz),
        .rst(rst),
        .BTN(BTN_OK),
        .SW(SW_OK),
        .mem_w(MemRW_Mem),
        .Cpu_data2bus(Data_out),
        .addr_bus(Addr_out),
        .ram_data_out(douta),
        .led_out(LED_out),
        .counter_out(counter_out),
        .counter0_out(counter0_OUT),
        .counter1_out(counter1_OUT),
        .counter2_out(counter2_OUT),
        .Cpu_data4bus(Cpu_data4bus),
        .ram_data_in(ram_data_in),
        .ram_addr(ram_addr),
        .data_ram_we(data_ram_we),
        .GPIOf0000000_we(GPIOf0000000_we),
        .GPIOe0000000_we(GPIOe0000000_we),
        .counter_we(counter_we),
        .Peripheral_in(Peripheral_in)
    );
    Multi_8CH32 U5(
        .clk(~Clk_CPU),
        .rst(rst),
        .EN(GPIOe0000000_we),
        .Test(SW_OK[7:5]),
        .point_in({clkdiv[31:0],clkdiv[31:0]}),
        .LES(64'b0),
        .Data0({2'b0,PC_out_IF[31:2]}),
        .data1(Peripheral_in),
        .data2(spo),
        .data3(counter_out),
        .data4(Addr_out),
        .data5(Data_out),
        .data6(Cpu_data4bus),
        .data7(PC_out_IF),
        .point_out(point_out),
        .LE_out(LE_out),
        .Disp_num(Disp_num)
    );
    SSeg7_Dev U6(
        .clk(clk_100mhz),
        .flash(clkdiv[25]),
        .Hexs(Disp_num),
        .LES(LE_out),
        .point(point_out),
        .rst(rst),
        .Start(clkdiv[20]),
        .SW0(SW_OK[0]),
        .seg_clk(seg_clk),
        .seg_clrn(seg_clrn),
        .SEG_PEN(SEG_PEN),
        .seg_sout(seg_sout)
    );
    SPIO U7(
        .clk(~Clk_CPU),
        .rst(rst),
        .Start(clkdiv[20]),
        .EN(GPIOf0000000_we),
        .P_Data(Peripheral_in),
        .counter_set(counter_set),
        .LED_out(LED_out),
        .led_clk(led_clk),
        .led_sout(led_sout),
        .led_clrn(led_clrn),
        .LED_PEN(LED_PEN)
    );
    clk_div U8(
        .clk(clk_100mhz),
        .rst(rst),
        .SW2(SW_OK[2]),
        .SW8(SW_OK[8]),
        .STEP(SW_OK[10]),
        .clkdiv(clkdiv),
        .Clk_CPU(Clk_CPU)
    );
    SAnti_jitter U9(
        .clk(clk_100mhz),
        .RSTN(RSTN),
        .readn(1'b0),
        .Key_y(BTN_y),
        .SW(SW),
        .BTN_OK(BTN_OK),
        .SW_OK(SW_OK),
        .rst(rst)
    );
    Counter_x U10(
        .clk(~Clk_CPU),
        .rst(rst),
        .clk0(clkdiv[6]),
        .clk1(clkdiv[9]),
        .clk2(clkdiv[11]),
        .counter_we(counter_we),
        .counter_val(Peripheral_in),
        .counter_ch(counter_set),
        .counter0_OUT(counter0_OUT),
        .counter1_OUT(counter1_OUT),
        .counter2_OUT(counter2_OUT),
        .counter_out(counter_out)
    );
    VGA U11(
        .clk_25m(clkdiv[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .PC_IF(PC_out_IF),
        .inst_IF(spo),
        .PC_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_Ex(PC_out_Ex),
        .MemRW_Ex(MemRW_Ex),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),
        .Addr_out(Addr_out),
        .Data_out_WB(Data_out_WB),
        .hs(HSYNC),
        .vs(VSYNC),
        .vga_r(Red),
        .vga_g(Green),
        .vga_b(Blue)
    );
endmodule
