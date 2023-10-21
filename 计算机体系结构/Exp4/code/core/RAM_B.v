`timescale 1ns / 1ps

module RAM_B(
	input [31:0] addra,
    input clka,      // normal clock
    input[31:0] dina,
    input wea, 
    output[31:0] douta,
    input[2:0] mem_u_b_h_w
);
	wire[31:0] core_in, core_out;

	RAM_core ram(.addra(addra[11:2]),.clka(~clka),.dina(core_in),.wea(wea),.douta(core_out));

	wire [7:0] core_out_byte1 = core_out[31:24];
	wire [7:0] core_out_byte2 = core_out[23:16];
	wire [7:0] core_out_byte3 = core_out[15:8];
	wire [7:0] core_out_byte4 = core_out[7:0];

	wire[31:0] core_out_w = {core_out_byte4, core_out_byte3, core_out_byte2, core_out_byte1};
	wire[15:0] core_out_h = addra[1] ? {core_out_byte4, core_out_byte3} : {core_out_byte2, core_out_byte1};
	wire[7:0]  core_out_b = {8{ addra[1] &  addra[0]}} & core_out_byte4 |
							{8{ addra[1] & ~addra[0]}} & core_out_byte3 |
							{8{~addra[1] &  addra[0]}} & core_out_byte2 |
							{8{~addra[1] & ~addra[0]}} & core_out_byte1 ;

	assign douta = 
		mem_u_b_h_w[1] ? core_out_w :
		mem_u_b_h_w[0] ? {mem_u_b_h_w[2] ? 16'b0 : {16{core_out_h[15]}}, core_out_h} :
		{mem_u_b_h_w[2] ? 24'b0 : {24{core_out_b[7]}}, core_out_b};
	
	wire[31:0] core_in_w = {dina[7:0], dina[15:8], dina[23:16], dina[31:24]};
	wire[31:0] core_in_h = addra[1] ? {core_out_byte1, core_out_byte2, dina[7:0], dina[15:8]} :
								{dina[7:0], dina[15:8], core_out_byte3, core_out_byte4};
	wire[31:0] core_in_b = {~addra[1] & ~addra[0] ? dina[7:0] : core_out_byte1,
					  ~addra[1] &  addra[0] ? dina[7:0] : core_out_byte2,
					   addra[1] & ~addra[0] ? dina[7:0] : core_out_byte3,
					   addra[1] &  addra[0] ? dina[7:0] : core_out_byte4};
	
	assign core_in = mem_u_b_h_w[1] ? core_in_w :
					 mem_u_b_h_w[0] ? core_in_h : core_in_b;
endmodule