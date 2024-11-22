`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/03 11:26:27
// Design Name: 
// Module Name: MyScpu
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


`include "SCPU_header.vh"

module MyScpu(
    input clk,
    input rst,
    input MIO_ready,
    input [31:0] inst_in,
    input [31:0] Data_in,
    `RegFile_Regs_Outputs
    output reg [3:0] RAM_wt_bits,
    output reg [31:0] Data_out,
    output reg [31:0] PC_out,
    output reg [31:0] Addr_out,
    output reg MemRW,
    output reg CPU_MIO,

    //debug signals
    output reg [4:0] rs1,
    output reg [31:0] rs1_val,
    output reg [4:0] rs2,
    output reg [31:0] rs2_val,
    output reg [4:0] rd,
    output reg [31:0] reg_i_data,
    output reg reg_wen,
    output reg is_imm,
    output reg is_auipc,
    output reg is_lui,
    output reg [31:0] imm,
    output reg [31:0] a_val,
    output reg [31:0] b_val,
    output reg [3:0] alu_ctrl,
    output reg       is_branch,
    output reg       is_jal,
    output reg       is_jalr,
    output reg       do_branch,
    output reg [31:0] pc_branch
    );

wire [2:0] ImmSel_tmp;
wire ALUSrc_B_tmp;
wire [2:0] MemtoReg_tmp;
wire [1:0] Jump_tmp;
wire [3:0] Branch_tmp;
wire RegWrite_tmp;
wire MemRW_tmp;
wire CPU_MIO_tmp;
wire signal_tmp;
wire [1:0] width_tmp;
wire [3:0] wt_bits_tmp;
wire [3:0] ALU_Control_tmp;
wire [31:0] Data_out_tmp;
wire [31:0] Addr_out_tmp;
wire [31:0] PC_out_tmp;
wire [4:0] rs1_tmp;
wire [31:0] rs1_val_tmp;
wire [4:0] rs2_tmp;
wire [31:0] rs2_val_tmp;
wire [4:0] rd_tmp;
wire [31:0] reg_i_data_tmp;
wire reg_wen_tmp;
wire is_imm_tmp;
wire is_auipc_tmp;
wire is_lui_tmp;
wire [31:0] imm_tmp;
wire [31:0] a_val_tmp;
wire [31:0] b_val_tmp;
wire [3:0] alu_ctrl_tmp;
wire is_branch_tmp;
wire is_jal_tmp;
wire is_jalr_tmp;
wire do_branch_tmp;
wire [31:0] pc_branch_tmp;

ScpuCtrl ctrl_inst(
    .OPcode(inst_in[6:2]),
    .Fun3(inst_in[14:12]),
    .Fun7(inst_in[30]),
    .MIO_ready(MIO_ready),
    .ImmSel(ImmSel_tmp),
    .ALUSrc_B(ALUSrc_B_tmp),
    .MemtoReg(MemtoReg_tmp),
    .Jump(Jump_tmp),
    .Branch(Branch_tmp),
    .RegWrite(RegWrite_tmp),
    .MemRW(MemRW_tmp),
    .ALU_Control(ALU_Control_tmp),
    .CPU_MIO(CPU_MIO_tmp),
    .signal(signal_tmp),
    .width(width_tmp)
);

Datapath datapath_inst(
    .clk(clk),
    .rst(rst),
    .inst_field(inst_in),
    .data_in(Data_in),
    .ALU_Control(ALU_Control_tmp),
    .ImmSel(ImmSel_tmp),
    .MemtoReg(MemtoReg_tmp),
    .Branch(Branch_tmp),
    .Jump(Jump_tmp),
    .ALUSrc_B(ALUSrc_B_tmp),
    .RegWrite(RegWrite_tmp),
    .signal(signal_tmp),
    .width(width_tmp),
    `RegFile_Regs_Arguments
    .RAM_wt_bits(wt_bits_tmp),
    .Data_out(Data_out_tmp),
    .ALU_out(Addr_out_tmp),
    .PC_out(PC_out_tmp),
    //debug signals
    .rs1_tmp(rs1_tmp),
    .rs1_val_tmp(rs1_val_tmp),
    .rs2_tmp(rs2_tmp),
    .rs2_val_tmp(rs2_val_tmp),
    .rd_tmp(rd_tmp),
    .reg_i_data_tmp(reg_i_data_tmp),
    .reg_wen_tmp(reg_wen_tmp),
    .is_imm_tmp(is_imm_tmp),
    .is_auipc_tmp(is_auipc_tmp),
    .is_lui_tmp(is_lui_tmp),
    .imm_tmp(imm_tmp),
    .a_val_tmp(a_val_tmp),
    .b_val_tmp(b_val_tmp),
    .alu_ctrl_tmp(alu_ctrl_tmp),
    .is_branch_tmp(is_branch_tmp),
    .is_jal_tmp(is_jal_tmp),
    .is_jalr_tmp(is_jalr_tmp),
    .do_branch_tmp(do_branch_tmp),
    .pc_branch_tmp(pc_branch_tmp)
    //debug signals
);

always @(*) begin
    MemRW = MemRW_tmp;
    RAM_wt_bits = wt_bits_tmp;
    CPU_MIO = CPU_MIO_tmp;
    Data_out = Data_out_tmp;
    Addr_out = Addr_out_tmp;
    PC_out = PC_out_tmp;
    //debug signals
    rs1 = rs1_tmp;
    rs1_val = rs1_val_tmp;
    rs2 = rs2_tmp;
    rs2_val = rs2_val_tmp;
    rd = rd_tmp;
    reg_i_data = reg_i_data_tmp;
    reg_wen = reg_wen_tmp;
    is_imm = is_imm_tmp;
    is_auipc = is_auipc_tmp;
    is_lui = is_lui_tmp;
    imm = imm_tmp;
    a_val = a_val_tmp;
    b_val = b_val_tmp;
    alu_ctrl = alu_ctrl_tmp;
    is_branch = is_branch_tmp;
    is_jal = is_jal_tmp;
    is_jalr = is_jalr_tmp;
    do_branch = do_branch_tmp;
    pc_branch = pc_branch_tmp;
end

endmodule
