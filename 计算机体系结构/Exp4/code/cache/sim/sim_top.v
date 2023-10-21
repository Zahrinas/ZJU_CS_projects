module sim_top;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] clk_count;
	wire [7:0] inst_count;
	wire [7:0] hit_count;

	// Instantiate the Unit Under Test (UUT)
	cmu_sim uut (
		.clk(clk), 
		.rst(rst), 
		.clk_count(clk_count), 
		.inst_count(inst_count), 
		.hit_count(hit_count)
	);


	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#95 rst = 0;
        
		// Add stimulus here
		

	end
	
	initial forever #10 clk = ~clk;
      
endmodule
