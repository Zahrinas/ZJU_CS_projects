module data_ram (
	input wire clk,
	input wire rst,
	input wire cs,
	input wire we,
	input wire [31:0] addr,
	input wire [31:0] din,
	output wire [31:0] dout,
	output wire stall,
	output reg ack = 0,
	output [2:0] ram_state
	);
	
	parameter
		ADDR_WIDTH = 11;

	localparam
		S_IDLE = 0,
		S_READING1 = 1,
		S_READING2 = 2,
		S_READ = 3,
		S_WRITING1 = 4,
		S_WRITING2 = 5,
		S_WRITE = 6;
	
	reg [31:0] data [0:(1<<ADDR_WIDTH)-1];
	
	integer i = 0;
	initial	begin
		for (i = 12; i < (1<<ADDR_WIDTH); i = i + 1) begin
			data[i] <= 32'b0;
		end
		$readmemh("ram.hex", data);
	end

	reg [2:0]state = 0;
	reg [31:0] out = 0;
	assign ram_state = state;

	reg [2:0]next_state = 0;

	always @ (posedge clk) begin
		if (rst) begin
			state = 0;
		end
		else begin
			state <= next_state;
		end
	end

	always @ (*) begin
		if (cs) begin
			if (we) begin
				if(state == S_IDLE)
					next_state = S_WRITING1;
				else if (S_WRITING1 <= state && state <= S_WRITING2)
					next_state = state + 1;
				else if (state == S_WRITE)
					next_state = S_IDLE;
				else
					next_state = 3'bxxx;
			end
			else begin
				if (S_IDLE <= state && state <= S_READING2)
					next_state = state + 1;
				else if (state == S_READ)
					next_state = S_IDLE;
				else
					next_state = 3'bxxx;
			end
		end
		else begin
			next_state = S_IDLE;
		end
	end

	always @ (posedge clk) begin
		if (state != S_READ && state != S_WRITE) begin
			ack <= 0;
			out <= 0;
		end

		else if (state == S_READ) begin
			ack <= 1;
			out <= data[addr[ADDR_WIDTH+1:2]];
		end

		else if (state == S_WRITE) begin
			ack <= 1;
			data[addr[ADDR_WIDTH+1:2]] <= din;
		end

		else begin
			ack <= 0;
			out <= 0;
		end
	end


	// always @ (posedge clk or posedge rst) begin
	// 	if (rst) begin
	// 		state <= S_IDLE;
	// 		ack <= 0;
	// 		out <= 0;
	// 	end else begin
	// 		if (cs) begin
	// 			if (we) begin // write
	// 				out <= 0;
	// 				if (state == S_IDLE) begin
	// 					state <= S_WRITING1;
	// 					ack <= 0;
	// 				end
	// 				else if (S_WRITING1 <= state && state <= S_WRITING2) begin
	// 					state <= state + 1;
	// 					ack <= 0;
    //                 end
	// 				else if (state == S_WRITE) begin
	// 					state <= S_IDLE;
	// 					ack <= 1;
	// 					data[addr[ADDR_WIDTH+1:2]] <= din;
	// 				end
	// 				else begin
	// 					state <= S_IDLE;
	// 					ack <= 0;
	// 					out <= 32'hxxxxxxxx;
	// 				end
	// 			end else begin // read
	// 				if (S_IDLE <= state && state <= S_READING2) begin
	// 					state <= state + 1;
	// 					ack <= 0;
	// 					out <= 0;
	// 				end
	// 				else if (state == S_READ) begin
	// 					state <= S_IDLE;
	// 					ack <= 1;
	// 					out <= data[addr[ADDR_WIDTH+1:2]];
	// 				end
	// 				else begin
	// 					state <= S_IDLE;
	// 					ack <= 0;
	// 					out <= 32'hxxxxxxxx;
	// 				end
	// 			end
	// 		end
	// 		else begin
	// 			state <= S_IDLE;
	// 			ack <= 0;
	// 			out <= 32'h00000000;
	// 		end
	// 	end
	// end

	assign dout = out;
	assign stall = cs & ~ack;
	
endmodule
