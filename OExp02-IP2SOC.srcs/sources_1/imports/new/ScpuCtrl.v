`timescale 1ns / 1ps
// module SCPU_ctrl(
//   input [4:0]       OPcode, 
//   input [2:0]       Fun3,
//   input             Fun7,
//   input             MIO_ready,
//   output reg [1:0]  ImmSel,
//   output reg        ALUSrc_B,
//   output reg [1:0]  MemtoReg,
//   output reg        Jump,
//   output reg        Branch,
//   output reg        RegWrite,
//   output reg        MemRW,
//   output reg [3:0]  ALU_Control,
//   output reg        CPU_MIO
// );

// endmodule


module ScpuCtrl(
    input [4:0]       OPcode, 
    input [2:0]       Fun3,
    input             Fun7,
    //
    input [2:0]      Fun_ecall,
    input [2:0]      Fun_mret,
    //

    input             MIO_ready,
    output reg [2:0]  ImmSel,
    output reg        ALUSrc_B,
    output reg [2:0]  MemtoReg,
    output reg [1:0]  Jump,
    output reg [3:0] Branch,
    output reg        RegWrite,
    output reg        MemRW,
    output reg [3:0]  ALU_Control,
    output reg        CPU_MIO,
    output reg        signal,
    output reg [1:0]  width,

    //
    output reg [2:0]  CSRTYPE,
    output reg        MRET,
    output reg        ECALL,
    output reg        illegal
    //

);

wire [1:0] ALU_op_tmp;
wire [2:0] ImmSel_tmp;
wire ALUSrc_B_tmp;
wire [2:0] MemtoReg_tmp;
wire [1:0] Jump_tmp;
wire [3:0] Branch_tmp;
wire RegWrite_tmp;
wire MemRW_tmp;
wire [3:0] ALU_Control_tmp;
wire CPU_MIO_tmp;
wire signal_tmp;
wire [1:0] width_tmp;

//
wire [2:0] CSRTYPE_tmp;
wire MRET_tmp;
wire ECALL_tmp;
wire illegal_tmp;
//

MainCtrl MainCtrl_inst(
    .OPcode(OPcode),
    .Fun3(Fun3),
    .Fun7(Fun7),
    //
    .Fun_ecall(Fun_ecall),
    .Fun_mret(Fun_mret),
    //

    .ImmSel(ImmSel_tmp),
    .ALUSrc_B(ALUSrc_B_tmp),
    .MemtoReg(MemtoReg_tmp),
    .Jump(Jump_tmp),
    .Branch(Branch_tmp),
    .RegWrite(RegWrite_tmp),
    .MemRW(MemRW_tmp),
    .ALU_op(ALU_op_tmp),
    .CPU_MIO(CPU_MIO_tmp),
    .signal(signal_tmp),
    .width(width_tmp),
    //
    .CSRTYPE(CSRTYPE_tmp),
    .MRET(MRET_tmp),
    .ECALL(ECALL_tmp),
    .illegal(illegal_tmp)
);



ALU_ctrl ALU_ctrl_inst(
    .Fun3(Fun3),
    .Fun7(Fun7),
    .ALU_op(ALU_op_tmp),
    .ALU_Control(ALU_Control_tmp)
);


always @(*) begin
    ImmSel = ImmSel_tmp;
    ALUSrc_B = ALUSrc_B_tmp;
    MemtoReg = MemtoReg_tmp;
    Jump = Jump_tmp;
    Branch = Branch_tmp;
    RegWrite = RegWrite_tmp;
    MemRW = MemRW_tmp;
    ALU_Control = ALU_Control_tmp;
    CPU_MIO = CPU_MIO_tmp;
    signal = signal_tmp;
    width = width_tmp;

    //
    CSRTYPE = CSRTYPE_tmp;
    MRET = MRET_tmp;
    ECALL = ECALL_tmp;
    illegal = illegal_tmp;
    //
end

endmodule




