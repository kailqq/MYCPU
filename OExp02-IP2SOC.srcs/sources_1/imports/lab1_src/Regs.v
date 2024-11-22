module Regs(
    input clk,
    input rst,
    input [4:0] Rs1_addr, 
    input [4:0] Rs2_addr, 
    input [4:0] Wt_addr, 
    input [31:0]Wt_data, 
    input RegWrite, 
    output [31:0] Rs1_data, 
    output [31:0] Rs2_data,
    output [31:0] Reg00,
    output [31:0] Reg01,
    output [31:0] Reg02,
    output [31:0] Reg03,
    output [31:0] Reg04,
    output [31:0] Reg05,
    output [31:0] Reg06,
    output [31:0] Reg07,
    output [31:0] Reg08,
    output [31:0] Reg09,
    output [31:0] Reg10,
    output [31:0] Reg11,
    output [31:0] Reg12,
    output [31:0] Reg13,
    output [31:0] Reg14,
    output [31:0] Reg15,
    output [31:0] Reg16,
    output [31:0] Reg17,
    output [31:0] Reg18,
    output [31:0] Reg19,
    output [31:0] Reg20,
    output [31:0] Reg21,
    output [31:0] Reg22,
    output [31:0] Reg23,
    output [31:0] Reg24,
    output [31:0] Reg25,
    output [31:0] Reg26,
    output [31:0] Reg27,
    output [31:0] Reg28,
    output [31:0] Reg29,
    output [31:0] Reg30,
    output [31:0] Reg31
);
// Your code here

    reg [31:0] Reg_file[31:1];

    assign Reg00 = 32'h00000000;
    assign Reg01 = Reg_file[1];
    assign Reg02 = Reg_file[2];
    assign Reg03 = Reg_file[3];
    assign Reg04 = Reg_file[4];
    assign Reg05 = Reg_file[5];
    assign Reg06 = Reg_file[6];
    assign Reg07 = Reg_file[7];
    assign Reg08 = Reg_file[8];
    assign Reg09 = Reg_file[9];
    assign Reg10 = Reg_file[10];
    assign Reg11 = Reg_file[11];
    assign Reg12 = Reg_file[12];
    assign Reg13 = Reg_file[13];
    assign Reg14 = Reg_file[14];
    assign Reg15 = Reg_file[15];
    assign Reg16 = Reg_file[16];
    assign Reg17 = Reg_file[17];
    assign Reg18 = Reg_file[18];
    assign Reg19 = Reg_file[19];
    assign Reg20 = Reg_file[20];
    assign Reg21 = Reg_file[21];
    assign Reg22 = Reg_file[22];
    assign Reg23 = Reg_file[23];
    assign Reg24 = Reg_file[24];
    assign Reg25 = Reg_file[25];
    assign Reg26 = Reg_file[26];
    assign Reg27 = Reg_file[27];
    assign Reg28 = Reg_file[28];
    assign Reg29 = Reg_file[29];
    assign Reg30 = Reg_file[30];
    assign Reg31 = Reg_file[31];

    assign Rs1_data = Rs1_addr? Reg_file[Rs1_addr] :0;
    assign Rs2_data = Rs2_addr? Reg_file[Rs2_addr] :0;

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                Reg_file[i] <= 32'h00000000;
            end
        end
        else begin
            if (RegWrite && Wt_addr) begin
                Reg_file[Wt_addr] <= Wt_data;
            end
        end
    end

endmodule
