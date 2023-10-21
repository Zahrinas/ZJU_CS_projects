`timescale 1ns / 1ps

module cmu_sim (
	input wire clk,
	input wire rst,
	output reg [7:0] clk_count = 0,
	output reg [7:0] inst_count = 0,
	output reg [7:0] hit_count = 0
	);
	
	// instruction
	reg [3:0] index = 0;
	wire valid;
	wire write;
	wire [31:0] addr;
	wire [2:0] u_b_h_w;
	wire stall;
	inst INST (
		.clk(clk),
		.rst(rst),
		.index(index),
		.valid(valid),
		.write(write),
		.addr(addr),
		.u_b_h_w(u_b_h_w)
	);

	always @(posedge clk) begin
		if (rst)
			index <= 0;
		else if (valid && ~stall)
			index <= index + 1'h1;
	end
	// ram
	wire mem_cs;
	wire mem_we;
	wire [31:0] mem_addr;
	wire [31:0] mem_din;
	wire [31:0] mem_dout;
	wire mem_ack;
 	data_ram RAM (
		.clk(clk),
		.rst(rst),
		.addr({21'b0, mem_addr[10:0]}),
		.cs(mem_cs),
		.we(mem_we),
		.din(mem_din),
		.dout(mem_dout),
		.stall(),
		.ack(mem_ack),
		.ram_state()
		);
    
    // cache
    wire [31:0] data_r;
	cmu CMU (
		.clk(clk),
		.rst(rst),
		.addr_rw(addr),
		.u_b_h_w(u_b_h_w),
		.en_r(~write),
		.data_r(data_r),
		.en_w(write),
		.data_w({16'h5678, clk_count, inst_count}),
		.stall(stall),
		.mem_cs_o(mem_cs),
		.mem_we_o(mem_we),
		.mem_addr_o(mem_addr),
		.mem_data_i(mem_dout),
		.mem_data_o(mem_din),
		.mem_ack_i(mem_ack),
		.cmu_state()
	);

    // counter
	reg stall_prev;
	
	always @(posedge clk) begin
		if (rst)
			stall_prev <= 0;
		else
			stall_prev <= stall;
	end
	
	always @(posedge clk) begin
		if (rst) begin
			clk_count <= 0;   // 时钟计数
			inst_count <= 0;  // 指令计数
			hit_count <= 0;   // 命中计数
		end
		else if (valid) begin
			clk_count <= clk_count + 1'h1;
			inst_count <= index + 1'h1;
			if (~stall_prev && ~stall)
				hit_count <= hit_count + 1'h1;
		end
	end

endmodule

