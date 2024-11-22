`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/14 20:18:53
// Design Name: 
// Module Name: ALU_ctrl
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

module ALU_ctrl(
    input [2:0]       Fun3,
    input             Fun7,
    input [1:0]       ALU_op,
    output reg [3:0]  ALU_Control
    );

always @(*) begin
    case(ALU_op) 
    2'b00: ALU_Control = `ALU_OP_ADD; // add for jal jalr SB-type
    2'b01: begin
        case(Fun3) //compare operations
        `FUNC_EQ: ALU_Control = `ALU_OP_XOR; // xor=0 zero=1,state=(b[0]&zero)
        `FUNC_NE: ALU_Control = `ALU_OP_XOR; // xor!=0, zero=0 ,state=(b[1]&(~zero))
        `FUNC_LT: ALU_Control = `ALU_OP_SLT; // slt state=(b[2]&res[1])
        `FUNC_GE: ALU_Control = `ALU_OP_SLT; // ge state=(b[3]&(~res[1]))
        `FUNC_LTU: ALU_Control = `ALU_OP_SLTU; // sltus state=(b[2]&res[1])
        `FUNC_GEU: ALU_Control = `ALU_OP_SLTU; // sltu state=(b[3]&(~res[1]))
        default: ALU_Control = `ALU_OP_EMPTY;
        endcase
    end
    // R-type normal ALU
    2'b10: begin
        case(Fun3)
        `FUNC_ADD: ALU_Control = Fun7 ? `ALU_OP_SUB : `ALU_OP_ADD; // sub/add
        `FUNC_SL: ALU_Control = `ALU_OP_SLL; // sll
        `FUNC_SLT: ALU_Control = `ALU_OP_SLT; // slt
        `FUNC_SLTU: ALU_Control = `ALU_OP_SLTU; // sltu
        `FUNC_XOR: ALU_Control = `ALU_OP_XOR; // xor
        `FUNC_SR: ALU_Control = Fun7 ? `ALU_OP_SRA : `ALU_OP_SRL; // srar/srl
        `FUNC_OR: ALU_Control = `ALU_OP_OR; // or
        `FUNC_AND: ALU_Control = `ALU_OP_AND; // and
        default: ALU_Control = `ALU_OP_EMPTY;
        endcase
    end
    // I-type ALU op Immidiate
    2'b11: begin
        case(Fun3)
        `FUNC_ADD: ALU_Control = `ALU_OP_ADD; // add
        `FUNC_SL: ALU_Control = `ALU_OP_SLL; // sll
        `FUNC_SLT: ALU_Control = `ALU_OP_SLT; // slt
        `FUNC_SLTU: ALU_Control = `ALU_OP_SLTU; // sltu
        `FUNC_XOR: ALU_Control = `ALU_OP_XOR; // xor
        `FUNC_SR: ALU_Control = Fun7 ? `ALU_OP_SRA : `ALU_OP_SRL; // sra/srl
        `FUNC_OR: ALU_Control = `ALU_OP_OR; // or
        `FUNC_AND: ALU_Control =  `ALU_OP_AND; // and
        default: ALU_Control = `ALU_OP_EMPTY;
    endcase
    end
    default: ALU_Control = `ALU_OP_EMPTY;
    endcase
end

endmodule