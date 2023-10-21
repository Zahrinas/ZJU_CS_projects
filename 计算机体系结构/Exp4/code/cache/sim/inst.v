module inst (
	input wire clk,
	input wire rst,
	input wire [3:0] index,  // instruction index
	output wire valid,  // stop running if valid is 0
	output wire write,  // write enable signal for cache
	output wire [31:0] addr,  // address for cache
	output wire [2:0] u_b_h_w
	);
	reg [39:0] data [0:9];
	initial begin
		data[0] = 40'h0_2_00000004;  // read miss               1+17
		data[1] = 40'h0_3_00000019;  // write miss              1+17
		data[2] = 40'h1_2_00000008;  // read hit                1
		data[3] = 40'h1_3_00000014;  // write hit               1
		
		data[4] = 40'h2_2_00000204;  // read miss               1+17
		data[5] = 40'h2_3_00000218;  // write miss              1+17
		data[6] = 40'h0_3_00000208;  // write hit               1
		data[7] = 40'h4_2_00000414;  // read miss + dirty       1+17+17
		data[8] = 40'h1_3_00000404;  // write miss + clean      1+17
		data[9] = 40'h0;           // end                     total: 128
	end
	assign
		u_b_h_w = data[index][38:36],
		valid = data[index][33],
		write = data[index][32],
		addr = data[index][31:0];
        
endmodule
