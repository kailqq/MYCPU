`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/03 10:52:39
// Design Name: 
// Module Name: Datapath
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

module Datapath(
    input clk,
    input rst,
    input [31:0] inst_field,
    input [31:0] data_in,
    input [3:0] ALU_Control,
    input [2:0] ImmSel,
    input [2:0] MemtoReg,
    input [3:0] Branch,
    input [1:0] Jump,
    input ALUSrc_B,
    input RegWrite,
    input signal,
    input [1:0] width,
    `RegFile_Regs_Outputs
    output reg [3:0] RAM_wt_bits,
    output reg [31:0] Data_out,
    output reg [31:0] ALU_out,
    output reg [31:0] PC_out,

     //debug signals
    output reg [4:0] rs1_tmp,
    output reg [31:0] rs1_val_tmp,
    output reg [4:0] rs2_tmp,
    output reg [31:0] rs2_val_tmp,
    output reg [4:0] rd_tmp,
    output reg [31:0] reg_i_data_tmp,
    output reg reg_wen_tmp,
    output reg is_imm_tmp,
    output reg is_auipc_tmp,
    output reg is_lui_tmp,
    output reg [31:0] imm_tmp,
    output reg [31:0] a_val_tmp,
    output reg [31:0] b_val_tmp,
    output reg [3:0] alu_ctrl_tmp,
    output reg       is_branch_tmp,
    output reg       is_jal_tmp,
    output reg       is_jalr_tmp,
    output reg       do_branch_tmp,
    output reg [31:0] pc_branch_tmp
);


reg [31:0] Wt_data;
wire [31:0] A, B;
wire [31:0] ALUSrc_B_Imm;
wire [31:0] ALUSrc_B_Reg;
wire [31:0] ALUSrc_A_Reg;
wire [31:0] Imm_out;
wire [31:0] ALU_res;
wire [31:0] PC_in;
wire [31:0] PC_res;
wire [4:0] rd, rs1, rs2;
wire Branch_state;
wire zero;

Immgen U1(.inst_field(inst_field), .ImmSel(ImmSel), .Imm_out(Imm_out));


assign rd = inst_field[11:7];
assign rs1 = inst_field[19:15];
assign rs2 = inst_field[24:20];


Regs U2(.clk(clk),
 .rst(rst), 
 .Rs1_addr(rs1), 
 .Rs2_addr(rs2), 
 .Wt_addr(rd),
.Wt_data(Wt_data), 
.RegWrite(RegWrite), 
`RegFile_Regs_Arguments
.Rs1_data(ALUSrc_A_Reg),
.Rs2_data(ALUSrc_B_Reg)
);


//ALU input
assign ALUSrc_B_Imm = Imm_out;
assign A = ALUSrc_A_Reg;
assign B = ALUSrc_B ? ALUSrc_B_Imm : ALUSrc_B_Reg;


ALU U3(.A(A), .B(B), .ALU_operation(ALU_Control), .res(ALU_res), .zero(zero));

assign Branch_state = (Branch[0] & zero) | (Branch[1] & ~zero) | (Branch[2] & ALU_res[0]) | (Branch[3] & ~ALU_res[0]);


PC U4(.clk(clk), .rst(rst), .PC_in(PC_in), .ctrl(1'b1), .PC_out(PC_res));
assign PC_in = Jump[1] ? (Jump[0] ? ALU_res : Imm_out + PC_res) : (Branch_state ? (Imm_out + PC_res) : (PC_res + 4));


always @(*) begin
   ALU_out = ALU_res;
   PC_out = PC_res;
   //sb sh sw
   if ({signal, width} == `FUNC_BYTE) begin
    case(ALU_res[1:0])
        `MOD_ZERO: begin
            Data_out = {24'b0, ALUSrc_B_Reg[7:0]};
            RAM_wt_bits = 4'b0001;
        end
        `MOD_ONE: begin
            Data_out = {16'b0, ALUSrc_B_Reg[7:0], 8'b0};
            RAM_wt_bits = 4'b0010;
        end
        `MOD_TWO: begin
            Data_out = {8'b0, ALUSrc_B_Reg[7:0], 16'b0};
            RAM_wt_bits = 4'b0100;
        end
        `MOD_THREE: begin
            Data_out = {ALUSrc_B_Reg[7:0], 24'b0};
            RAM_wt_bits = 4'b1000;
        end
        default: begin
            Data_out = 32'b0;
            RAM_wt_bits = 4'b0000;
        end
    endcase
   end
   else if ({signal, width} == `FUNC_HALF) begin
    case(ALU_res[1:0])
        `MOD_ZERO: begin
            Data_out = {16'b0, ALUSrc_B_Reg[15:0]};
            RAM_wt_bits = 4'b0011;
        end
        `MOD_ONE: begin
            Data_out = {8'b0, ALUSrc_B_Reg[15:0], 8'b0};
            RAM_wt_bits = 4'b0110;
        end
        `MOD_TWO: begin
            Data_out = {ALUSrc_B_Reg[15:0], 16'b0};
            RAM_wt_bits = 4'b1100;
        end
        default: begin
            Data_out = 32'b0;
            RAM_wt_bits = 4'b0000;
        end
    endcase
   end
   else if ({signal, width} == `FUNC_WORD) begin
    Data_out = ALUSrc_B_Reg;
    RAM_wt_bits = 4'b1111;
   end

   //lb lh lw lbu lhu
   case(MemtoReg)
    `MEM2REG_ALU: Wt_data = ALU_res;
    `MEM2REG_MEM: begin
        case({signal, width, ALU_res[1:0]})
            {`FUNC_BYTE, `MOD_ZERO}: Wt_data = {{24{data_in[7]}}, data_in[7:0]};
            {`FUNC_BYTE, `MOD_ONE}: Wt_data = {{24{data_in[15]}}, data_in[15:8]};
            {`FUNC_BYTE, `MOD_TWO}: Wt_data = {{24{data_in[23]}}, data_in[23:16]};
            {`FUNC_BYTE, `MOD_THREE}: Wt_data = {{24{data_in[31]}}, data_in[31:24]};
            {`FUNC_HALF, `MOD_ZERO}: Wt_data = {{16{data_in[15]}}, data_in[15:0]};
            {`FUNC_HALF, `MOD_ONE}: Wt_data = {{16{data_in[23]}}, data_in[23:8]};
            {`FUNC_HALF, `MOD_TWO}: Wt_data = {{16{data_in[31]}}, data_in[31:16]};
            {`FUNC_WORD, `MOD_ZERO}: Wt_data = data_in;

            //unsigned lbu lhu
            {`FUNC_BYTE_UNSIGNED, `MOD_ZERO}: Wt_data = {{24{1'b0}}, data_in[7:0]};
            {`FUNC_BYTE_UNSIGNED, `MOD_ONE}: Wt_data = {{24{1'b0}}, data_in[15:8]};
            {`FUNC_BYTE_UNSIGNED, `MOD_TWO}: Wt_data = {{24{1'b0}}, data_in[23:16]};
            {`FUNC_BYTE_UNSIGNED, `MOD_THREE}: Wt_data = {{24{1'b0}}, data_in[31:24]};
            {`FUNC_HALF_UNSIGNED, `MOD_ZERO}: Wt_data = {{16{1'b0}}, data_in[15:0]};
            {`FUNC_HALF_UNSIGNED, `MOD_ONE}: Wt_data = {{16{1'b0}}, data_in[23:8]};
            {`FUNC_HALF_UNSIGNED, `MOD_TWO}: Wt_data = {{16{1'b0}}, data_in[31:16]};

            default: Wt_data = 32'b0;
        endcase
    end
    `MEM2REG_PC_PLUS: Wt_data = PC_res + 4;
    `MEM2REG_LUI: Wt_data = Imm_out;
    `MEM2REG_AUIPC: Wt_data = Imm_out + PC_res;
    default: Wt_data = 32'b0;
   endcase


   //debug signals
rs1_tmp = rs1;
rs1_val_tmp = ALUSrc_A_Reg;
rs2_tmp = rs2;
rs2_val_tmp = ALUSrc_B_Reg;
rd_tmp = rd;
reg_i_data_tmp = Wt_data;
reg_wen_tmp = RegWrite;
is_imm_tmp = ALUSrc_B;
is_auipc_tmp = (MemtoReg == `MEM2REG_AUIPC);
is_lui_tmp = (MemtoReg == `MEM2REG_LUI);
imm_tmp = Imm_out;
a_val_tmp = A;
b_val_tmp = B;
alu_ctrl_tmp = ALU_Control;
is_branch_tmp = (Branch[0]||Branch[1]||Branch[2]||Branch[3]);
is_jal_tmp = Jump[1]&&(~Jump[0]);
is_jalr_tmp = Jump[1]&&Jump[0];
do_branch_tmp = Branch_state;
pc_branch_tmp = PC_in;
//
end


//debug signa
//end debug signals

endmodule