`timescale 1ns / 1ps

module ExceptionUnit(
    input clk, rst,
    input csr_rw_in,
    input[1:0] csr_wsc_mode_in,
    input csr_w_imm_mux,
    input[11:0] csr_rw_addr_in,
    input[31:0] csr_w_data_reg,
    input[4:0] csr_w_data_imm,
    output[31:0] csr_r_data_out,

    input interrupt,
    input illegal_inst,
    input l_access_fault,
    input s_access_fault,
    input ecall_m,

    input mret,

    input[31:0] epc_cur,
    input[31:0] epc_next,
    output[31:0] PC_redirect,
    output redirect_mux,

    output reg_FD_flush, reg_DE_flush, reg_EM_flush, reg_MW_flush, 
    output RegWrite_cancel
);

    reg[11:0] csr_raddr, csr_waddr;
    reg[31:0] csr_wdata;
    reg csr_w;
    reg[1:0] csr_wsc;

    wire[31:0] mstatus;

    CSRRegs csr(.clk(clk),.rst(rst),.csr_w(csr_w),.raddr(csr_raddr),.waddr(csr_waddr),
        .wdata(csr_wdata),.rdata(csr_r_data_out),.mstatus(mstatus),.csr_wsc_mode(csr_wsc));

    parameter STATE_IDLE = 2'b00;
    parameter STATE_MEPC = 2'b01;
    parameter STATE_MCAUSE = 2'b10;
    
    parameter MSTATUS = 12'h300;
    parameter MIE = 12'h304;
    parameter MTVEC = 12'h305;
    parameter MEPC = 12'h341;
    parameter MCAUSE = 12'h342;
    parameter MTVAL = 12'h343;
    parameter MIP = 12'h344;
    
    wire trap_in = interrupt | illegal_inst | l_access_fault | s_access_fault | ecall_m;
    
    reg[31:0] epc_cur_IDLE;
    reg[31:0] epc_next_IDLE;
    reg interrupt_IDLE;
    reg illegal_inst_IDLE;
    reg l_access_fault_IDLE;
    reg s_access_fault_IDLE;
    reg ecall_m_IDLE;
    reg trap_in_IDLE;
    
    reg interrupt_MEPC;
    reg illegal_inst_MEPC;
    reg l_access_fault_MEPC;
    reg s_access_fault_MEPC;
    reg ecall_m_MEPC;
    
    reg[1:0] state;
    
    always@(posedge clk) begin
        if(rst) begin
            epc_cur_IDLE <= 0;
            epc_next_IDLE <= 0;
            interrupt_IDLE <= 0;
            illegal_inst_IDLE <= 0;
            l_access_fault_IDLE <= 0;
            s_access_fault_IDLE <= 0;
            ecall_m_IDLE <= 0;
            trap_in_IDLE <= 0;
            
            interrupt_MEPC <= 0;
            illegal_inst_MEPC <= 0;
            l_access_fault_MEPC <= 0;
            s_access_fault_MEPC <= 0;
            ecall_m_MEPC <= 0;
            
            state <= 0;
        end
        else begin
            epc_cur_IDLE <= epc_cur;
            epc_next_IDLE <= epc_next;
            interrupt_IDLE <= interrupt;
            illegal_inst_IDLE <= illegal_inst;
            l_access_fault_IDLE <= l_access_fault;
            s_access_fault_IDLE <= s_access_fault;
            ecall_m_IDLE <= ecall_m;
            trap_in_IDLE <= trap_in;
            
            interrupt_MEPC <= interrupt_IDLE;
            illegal_inst_MEPC <= illegal_inst_IDLE;
            l_access_fault_MEPC <= l_access_fault_IDLE;
            s_access_fault_MEPC <= s_access_fault_IDLE;
            ecall_m_MEPC <= ecall_m_IDLE;
            
            case(state)
                STATE_IDLE: begin
                    if(trap_in | mret) state <= STATE_MEPC;
                    else state <= STATE_IDLE;
                end
                STATE_MEPC: begin
                    state <= STATE_MCAUSE;
                end
                STATE_MCAUSE: begin
                    state <= STATE_IDLE;
                end
            endcase
        end
    end
    
    always@* begin
        if(rst) begin
            csr_w <= 0;
            csr_raddr <= 0;
        end
        else begin
            case(state)
                STATE_IDLE: begin
                    if(trap_in) begin
                        csr_w = 1'b1;
                        csr_wsc = 2'b01;
                        csr_waddr = MSTATUS;
                        csr_wdata = {mstatus[31:8], mstatus[3], mstatus[6:4], 1'b0, mstatus[2:0]};
                    end
                    else if(mret) begin
                        csr_w = 1'b1;
                        csr_wsc = 2'b01;
                        csr_waddr = MSTATUS;
                        csr_raddr = MEPC;
                        csr_wdata = {mstatus[31:8], 1'b1, mstatus[6:4], mstatus[7], mstatus[2:0]};
                    end
                    else if(csr_rw_in) begin
                        csr_w = 1'b1;
                        csr_wsc = csr_wsc_mode_in;
                        csr_raddr = csr_rw_addr_in;
                        csr_waddr = csr_rw_addr_in;
                        csr_wdata = csr_w_imm_mux ? {{27{0}}, csr_w_data_imm} : csr_w_data_reg;
                    end
                    else begin
                        csr_w = 1'b0;
                    end
                end
                STATE_MEPC: begin
                    csr_w = 1'b1;
                    csr_wsc = 2'b01;
                    csr_waddr = MEPC;
                    csr_raddr = MTVEC;
                    csr_wdata = interrupt_IDLE ? epc_next_IDLE : epc_cur_IDLE;
                end
                STATE_MCAUSE: begin
                    csr_w = 1'b1;
                    csr_wsc = 2'b01;
                    csr_waddr = MCAUSE;
                    csr_wdata = {32{interrupt_MEPC}} & 32'h8000 |
                                {32{illegal_inst_MEPC}} & 32'd2 |
                                {32{l_access_fault_MEPC}} & 32'd5 |
                                {32{s_access_fault_MEPC}} & 32'd7 |
                                {32{ecall_m_MEPC}} & 32'd11;
                end
            endcase
        end
    end

    assign PC_redirect = csr_r_data_out;
    assign redirect_mux = trap_in_IDLE | mret;
    
    assign reg_MW_flush = trap_in | mret;
    assign reg_EM_flush = trap_in | mret;
    assign reg_DE_flush = trap_in | mret;
    assign reg_FD_flush = trap_in | trap_in_IDLE | mret;
    
    assign RegWrite_cancel = trap_in & ~interrupt;
    
endmodule