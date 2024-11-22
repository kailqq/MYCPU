`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/02 15:59:58
// Design Name: 
// Module Name: MainCtrl
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

module MainCtrl(
    input [4:0]       OPcode,
    input [2:0]       Fun3,
    input             Fun7,
    //
    input [2:0]       Fun_ecall,//inst[22:20]
    input [1:0]       Fun_mret,//inst[29:28]


    output reg [2:0]  ImmSel,
    output reg        ALUSrc_B,
    output reg [2:0]  MemtoReg,
    output reg [1:0]  Jump,//jal-10 jalr-11
    output reg [4:0]  Branch,//beq-0001 bne-0010 blt,bltu-0100 bge,bgeu-1000 
    output reg        signal,//used for load/store instructions, 1 for unsigned, 0 for signed
    output reg [1:0]  width,
    output reg        RegWrite,
    output reg        MemRW,//0 for read, 1 for write
    output reg [1:0]  ALU_op,
    output reg        CPU_MIO,//1 enable, 0 disable

    //exception

    output reg [2:0]  CSRTYPE,//000 don't care// 001 csrrw// 010 csrrs// 011 csrrc// 101 csrrwi// 110 csrrsi// 111 csrrci
    output reg        MRET,//1 enable, 0 disable
    output reg        ECALL,//1 enable, 0 disable\
    output reg        illegal//not supported instruction illegal=1
    );



always @(*) begin
    case(OPcode)
    `OPCODE_ALU: begin // add, sub, and, or, xor, sll, srl, sra, slt, sltu
        ImmSel = 3'b000;
        ALUSrc_B = 0;
        MemtoReg = `MEM2REG_ALU;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b10;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end
    
    `OPCODE_ALU_IMM: begin // addi, andi, ori, xori, slti, sltiu, slli, srli, srai
        ImmSel = `IMM_SEL_I;
        ALUSrc_B = 1;
        MemtoReg = 3'b000;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b11;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;

    end

    `OPCODE_LOAD: begin // lb, lh, lw, lbu, lhu
        ImmSel = `IMM_SEL_I;
        ALUSrc_B = 1;
        MemtoReg = `MEM2REG_MEM;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b00;
        CPU_MIO = 1;
        signal = Fun3[2];
        width = Fun3[1:0];
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_JALR: begin // jalr
        ImmSel = `IMM_SEL_I;
        ALUSrc_B = 1;
        MemtoReg = `MEM2REG_PC_PLUS;
        Jump = 2'b11;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b00;
        signal = 0;
        width = 2'b00;
        CPU_MIO = 0;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_STORE: begin // sb, sh, sw  imm(rs1) <- rs2 
        ImmSel = `IMM_SEL_S;
        ALUSrc_B = 1;
        MemtoReg = 3'b000;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 0;
        MemRW = 1;
        ALU_op = 2'b00;
        CPU_MIO = 1;
        signal = 0;
        width = Fun3[1:0];
        //  
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_BRANCH: begin // beq, bne, blt, bge, bltu, bgeu
        ImmSel = `IMM_SEL_B;
        ALUSrc_B = 0;
        MemtoReg = 3'b000;
        Jump = 2'b00;
        case(Fun3)
        `FUNC_EQ: Branch = 4'b0001; // beq
        `FUNC_NE: Branch = 4'b0010; // bne
        `FUNC_LT: Branch = 4'b0100; // blt
        `FUNC_GE: Branch = 4'b1000; // bge
        `FUNC_LTU: Branch = 4'b0100; // bltu
        `FUNC_GEU: Branch = 4'b1000; // bgeu
        default: Branch = 4'b0000;
        endcase
        RegWrite = 0;
        MemRW = 0;
        ALU_op = 2'b01;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;

        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_JAL : begin // jal
        ImmSel = `IMM_SEL_J;
        ALUSrc_B = 0;
        MemtoReg = `MEM2REG_PC_PLUS;
        Jump = 2'b10;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b00;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //  
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_LUI: begin // lui
        ImmSel = `IMM_SEL_U;
        ALUSrc_B = 0;
        MemtoReg = `MEM2REG_LUI;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b00;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_AUIPC: begin // auipc
        ImmSel = `IMM_SEL_U;
        ALUSrc_B = 0;
        MemtoReg = `MEM2REG_AUIPC;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 1;
        MemRW = 0;
        ALU_op = 2'b00;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 0;
    end

    `OPCODE_ENV: begin // ecall, ebreak
        ImmSel = `IMM_SEL_I;
        ALUSrc_B = 0;
        MemtoReg = (Fun3==3'b000)?3'b000:`MEM2REG_CSR;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = (Fun3[0]|Fun3[1]|Fun3[2]);
        MemRW = `MEM2REG_CSR;
        ALU_op = 2'b00;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = Fun3;//000 ecall or mret// 001 csrrw// 010 csrrs// 011 csrrc// 101 csrrwi// 110 csrrsi// 111 csrrci  
        if(Fun3 == 3'b000) begin
            MRET = ((Fun_mret == 2'b11)&&(Fun_ecall == 3'b010));
            ECALL = (Fun_ecall == 3'b000);
        end
        else begin
            MRET = 0;
            ECALL = 0;
        end
        //
        illegal = 0;
        
    end

    default: begin
        ImmSel = 3'b000;
        ALUSrc_B = 0;
        MemtoReg = 3'b000;
        Jump = 2'b00;
        Branch = 4'b0000;
        RegWrite = 0;
        MemRW = 0;
        ALU_op = 2'b00;
        CPU_MIO = 0;
        signal = 0;
        width = 2'b00;
        //
        CSRTYPE = 3'b000;
        MRET = 0;
        ECALL = 0;
        //
        illegal = 1;
    end
    endcase
end

endmodule