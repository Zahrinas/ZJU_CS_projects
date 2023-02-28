`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 15:17:29
// Design Name: 
// Module Name: P2S
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


module  		  P2S#(
    DATA_BITS = 64,  											// data length
	DATA_COUNT_BITS = 6 									// data shift bits

)(  input wire clk,		//parallel to serial
						input wire rst,
						input wire Serial,
						input wire[DATA_BITS-1:0] P_Data,
						output reg  s_clk,
						output wire s_clrn,
						output wire sout,
						output reg  EN
						);

//parameter
//	DATA_BITS = 64,  											// data length
//	DATA_COUNT_BITS = 6; 									// data shift bits
localparam
		S_IDLE = 0,  // idle
		S_TRAN = 1,  // clear
		S_CLKN = 2,  // converting
		S_DONE = 3;  // acknowledge	
		
reg [1:0] start=00,state;
reg [DATA_COUNT_BITS-1:0] shift_count = 0;	
reg [DATA_BITS-1:0] buffer;						

	assign s_clrn =1;
	assign sout = buffer[0];			//buffer[DATA_BITS-1]

	always @(posedge clk )
		start<= {start[0],Serial};
	
	always @(posedge clk or posedge rst )begin
		if (rst ) begin
			state <= 0;
			shift_count <= 0;
			s_clk <= 0;
			EN <=0;
		end
		else case(state)
				S_IDLE: if(start==2'b01)begin 
							  buffer <= {P_Data}; 
							  s_clk <= 0;
							  state  <= S_TRAN;
							  EN <=0;
							end	// 
							else begin 
								 EN <=1;
								  state <= S_IDLE;
								  s_clk <= 0;
								  shift_count <= 0;
								  end			
				S_TRAN: begin if(shift_count == DATA_BITS-1)begin			//shift_count == DATA_BITS-2
									  s_clk <= ~s_clk;
									  state <= S_DONE;			  
								  end
								  else if(s_clk==1) begin 
											shift_count <= shift_count+1;
											buffer <= {1'b0, buffer[DATA_BITS-1:1]};	//{buffer[DATA_BITS-2:0],1'b0}
											state <= S_TRAN;
											s_clk <= ~s_clk;
										 end
										 else begin 
										   state <= S_TRAN;
											s_clk <= ~s_clk;
										 end
							end
							
				S_DONE: begin 
 							s_clk <= ~s_clk;
							buffer <= {1'b0,buffer[DATA_BITS-1:1]};	//									  
							state <=  S_IDLE;
							end
							
			  endcase
	end
	
endmodule
