module CSRRegs(
    input clk, rst,
    input[11:0] raddr, waddr,       // 读、写 CSR 寄存器的地址
    input[31:0] wdata,              // 写入 CSR 寄存器的数据
    input csr_w,                    // 写使能
    input[1:0] csr_wsc_mode,        // 写入 CSR 寄存器的模式
    output[31:0] rdata,             // 读出 CSR 寄存器的数据
    output wire [31:0]mstatus,
    output wire [31:0]mtvec,
    output wire [31:0]mcause,
    output wire [31:0]mtval,
    output wire [31:0]mepc,

    input expt_int,                // 是否有异常中断
    // 旁路输入
    input [31:0]mepc_bypasss_in,
    input [31:0]mcause_bypass_in,
    input [31:0]mtval_bypass_in,
    input [31:0]mstatus_bypass_in,
    input [31:0]mtvec_bypass_in

);

reg[31:0] csrs[1:5];            // CSR 寄存器

assign mstatus = csrs[1];//h300
assign mtvec = csrs[2];//h305
assign mcause = csrs[3];//h342
assign mtval = csrs[4];//h343
assign mepc = csrs[5];//h341

reg[31:0] readcsr;

assign rdata = readcsr;

initial begin
    csrs[1]<=32'h0;
    csrs[2]<=32'h320;//trap 地址
    csrs[3]<=32'h0;
    csrs[4]<=32'h0;
    csrs[5]<=32'h0;
end

always @ (*) begin
    case(raddr)
        12'h300: readcsr = csrs[1];
        12'h305: readcsr = csrs[2];
        12'h342: readcsr = csrs[3];
        12'h343: readcsr = csrs[4];
        12'h341: readcsr = csrs[5];
        default: readcsr = 32'h0;
    endcase
end



always @(posedge clk or posedge rst) begin
    if (rst) begin
        csrs[1]<=32'h0;
        csrs[2]<=32'h320;//trap 地址
        csrs[3]<=32'h0;
        csrs[4]<=32'h0;
        csrs[5]<=32'h0;
    end
    else begin
    if (csr_w) begin
        case(waddr)
            12'h300: csrs[1] <= wdata;
            12'h305: csrs[2] <= wdata;
            12'h342: csrs[3] <= wdata;
            12'h343: csrs[4] <= wdata;
            12'h341: csrs[5] <= wdata;
            default: ;
        endcase
    end

    if (expt_int) begin
        csrs[5] <= mepc_bypasss_in;
        csrs[3] <= mcause_bypass_in;
        csrs[4] <= mtval_bypass_in;
        csrs[1] <= mstatus_bypass_in;
        csrs[2] <= mtvec_bypass_in;
    end
    end

end



endmodule
