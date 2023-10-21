`timescale 1ns / 1ps

module FU_mul(
    input clk, EN,
    input[31:0] A, B,
    output[31:0] res,
    output finish
);

    reg[6:0] state;
    assign finish = state[0] == 1'b1;
    initial begin
        state = 0;
    end

    reg[31:0] A_reg, B_reg;
    
    wire[63:0] mulres;
    
    always@(posedge clk) begin
        if(EN & ~|state) begin
            A_reg <= A;
            B_reg <= B;
            state <= 7'b1000000;
        end
        else begin
           state <= {1'b0, state[6:1]};
        end
    end

    multiplier mul(.CLK(clk),.A(A_reg),.B(B_reg),.P(mulres));

    assign res = mulres[31:0];

endmodule