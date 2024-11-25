

module RV_INT(
    input       clk,
    input       rst,
    input       INT,              // 外部中断信号
    input       ecall,            // ECALL 指令
    input       mret,             // MRET 指令
    input       illegal_inst,     // 非法指令信号
    input       l_access_fault,   // 数据访存不对齐
    input       j_access_fault,   // 跳转地址不对齐
    input [31:0] pc_current,      // 当前指令 PC 值
    input [31:0] PC_next,         // 当前正常指令流下一个 PC 值
    output[31:0] pc,               // 将执行的指令 PC 值
    output       CSRregs_wen,      // 是否写入 CSR 寄存器


    input [31:0] inst_in,          //
    input [31:0] mstatus,
    input [31:0] mtvec,
    input [31:0] mcause,
    input [31:0] mtval,
    input [31:0] mepc,

    output reg [31:0]mepc_bypasss_in,
    output reg [31:0]mcause_bypass_in,
    output reg [31:0]mtval_bypass_in,
    output reg [31:0]mstatus_bypass_in,
    output reg [31:0]mtvec_bypass_in
);


assign CSRregs_wen =(INT|ecall|illegal_inst|l_access_fault|j_access_fault|mret);//发生异常时需要写入CSR寄存器

always @(*) begin
    if (rst) begin
        mepc_bypasss_in <= 0;
        mcause_bypass_in <= 0;
        mtval_bypass_in <= 0;
        mstatus_bypass_in <= 0;
        mtvec_bypass_in <= 32'h320;
    end
    else begin
        if (mret) begin
            mstatus_bypass_in <= 0;//可以接受新的异常
            mcause_bypass_in <= 0; 
            mepc_bypasss_in <= 0;
            mtval_bypass_in <= 0;
        end

        //mepc and mstatus update
        else begin
            if(mstatus==0) begin
                mepc_bypasss_in <= pc_current;
                mstatus_bypass_in <= (INT|ecall|illegal_inst|l_access_fault|j_access_fault)?32'h1:32'h0;//有异常设置为1不再接受新的异常，无异常设置为0
                      //mcause update
                if(INT) begin
                    mcause_bypass_in <= 32'h1;
                    mtval_bypass_in <= mtval;
                end
                else if(ecall) begin
                    mcause_bypass_in <= 32'h2;
                    mtval_bypass_in <= mtval;
                end
                else if(illegal_inst) begin
                    mcause_bypass_in <= 32'h3;
                    mtval_bypass_in <=  inst_in;
                end
                else if(l_access_fault) begin
                    mcause_bypass_in <= 32'h4;
                    mtval_bypass_in <= mtval;
                end
                else if(j_access_fault) begin
                    mcause_bypass_in <= 32'h5;
                    mtval_bypass_in <= mtval;
                end
                else begin
                    mcause_bypass_in <= mcause;
                    mtval_bypass_in <= mtval;
                end
            end 
            else begin
                mepc_bypasss_in <= mepc;
                mstatus_bypass_in <= mstatus;
                mcause_bypass_in <= mcause;
                mtval_bypass_in <= mtval;
            end
        end
        //
    end
end

assign pc=(rst==1'b1)?32'h0:
          (mret==1'b1)?mepc:
          (mstatus==1'b1)?PC_next://正常指令流，继续执行
          (INT==1'b1)?32'h320:
          (ecall==1'b1)?32'h320:
          (illegal_inst==1'b1)?32'h320:
          (l_access_fault==1'b1)?32'h320:
          (j_access_fault==1'b1)?32'h320:
          PC_next;


endmodule
