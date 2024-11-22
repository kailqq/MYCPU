`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 10:11:11
// Design Name: 
// Module Name: testbench
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


module testbench(
    input clk,
    input rst,
	input INT
    );

     /* SCPU 中接出 */
    wire [3:0] wt_bit;
    wire [31:0] Addr_out;
    wire [31:0] Data_out;       
    wire        CPU_MIO;
    wire        MemRW;
    wire [31:0] PC_out;
    /* RAM 接出 */
    wire [31:0] douta;
    /* ROM 接出 */
    wire [31:0] spo;

MyScpu inst0(
    .clk(clk),
    .rst(rst),
	.INT(INT),
    .Data_in(douta),
    .MIO_ready(CPU_MIO),
    .inst_in(spo),
    .RAM_wt_bits(wt_bit),
    .Addr_out(Addr_out),
    .Data_out(Data_out),
    .CPU_MIO(CPU_MIO),
    .MemRW(MemRW),
    .PC_out(PC_out)
);


RAM_B u1(
    .clka(~clk),
    .wea({4{MemRW}} & wt_bit),
    .addra(Addr_out[11:2]), 
    .dina(Data_out),
    .douta(douta)
);


ROM_in_testbench u2(
    .addr(PC_out[11:2]),
    .spo(spo)
);

endmodule



module ROM_for_CSR (
    input [9:0] addr,
    output [31:0] spo
);

reg [31:0] inst [0:1023];

assign spo = inst[addr];

initial begin
// 0x0FE00093
// 0x300091F3
// 0x00100113
// 0x300121F3
// 0x00110113
// 0x300131F3
// 0x300151F3
// 0x3000E1F3
// 0x3000F1F3
// addi x1 x0 0xFE #X1=0xFE
// csrrw x3 0x300 x1#X3=0,mstatus=0xFE
// addi x2 x0 1 #x2=1
// csrrs x3 0x300 x2 # x3=0xFE mstatus=0xFF
// addi  x2 x2 1 # x2=2
// csrrc x3 0x300 x2 #x3=0xFF,mstatus=0xFD
// csrrwi x3 0x300 x2 #x3=0xFD,mstatus=0x02
// csrrsi x3 0x300 x1 #x3=2,mstatus=3
// csrrci x3 0x300 x1 #x3=3,mstatus=2
	inst[0]=32'h0FE00093;
	inst[1]=32'h300091F3;
	inst[2]=32'h00100113;
	inst[3]=32'h300121F3;
	inst[4]=32'h00110113;
	inst[5]=32'h300131F3;
	inst[6]=32'h300151F3;
	inst[7]=32'h3000E1F3;
	inst[8]=32'h3000F1F3;
end

endmodule // ROM_for_CSR







module ROM_for_lab44(
	input [9:0] addr,
	output [31:0] spo
);

reg [31:0] inst [0:1023];
assign spo = inst[addr];

initial begin
// 0x00000033
// 0x00000033
// 0x00000073
// 0x06608093
// 0x000080B3
// 0x00600113
inst[0] = 32'h00000033;
inst[1] = 32'h00000033;
inst[2] = 32'h00000073;
inst[3] = 32'h06608093;
inst[4] = 32'h000080FF;//illegal
inst[5] = 32'h00600113;

// add x0 x0 x0
// add x0 x0 x0
// ecall
// addi x1 x1 0x66
// abc x1 x1 x0 #illigel 
// addi x2 x0 0x6
   
inst[200]	 <= 32'h30003B73;
inst[201]	 <= 32'h30503BF3;
inst[202]	 <= 32'h34203C73;
inst[203]	 <= 32'h34303CF3;
inst[204]	 <= 32'h34103D73;
inst[205]	 <= 32'h00100713;
inst[206]	 <= 32'h01870663;
inst[207]	 <= 32'h004D0D13;
inst[208]	 <= 32'h341D1073;
inst[209]	 <= 32'h30200073;

// trap:
// csrrc x22 0x300 x0 #mstatus
// csrrc x23 0x305 x0 #mtvec
// csrrc x24 0x342 x0 #mcause
// csrrc x25 0x343 x0 #mtval
// csrrc x26 0x341 x0 #mepc
// addi  x14  x0    1
// beq   x14 x24    int_trap
// addi  x26 x26    4
// csrrw x0  0x341  x26
// int_trap:
// mret
end



endmodule // ROM_for_lab44


module ROM_in_testbench(
    input [9:0] addr,
    output [31:0] spo,
    output [8*30:1] inst_msg
);
    reg[8*30:1] inst_string[0:197];
    reg[31:0] inst [0:1023];

    assign spo = inst[addr];
    assign inst_msg = inst_string[addr];

    // Initial inst
	initial begin
		inst[0]	 <= 32'h00000097;
		inst[1]	 <= 32'h0240006F;
		inst[2]	 <= 32'h00000013;
		inst[3]	 <= 32'h00000013;
		inst[4]	 <= 32'h00000013;
		inst[5]	 <= 32'h00000013;
		inst[6]	 <= 32'h00000013;
		inst[7]	 <= 32'h00000013;
		inst[8]	 <= 32'h00000013;
		inst[9]	 <= 32'hFE5FF06F;
		inst[10]	 <= 32'hFE0090E3;
		inst[11]	 <= 32'h00000863;
		inst[12]	 <= 32'h00000F93;
		inst[13]	 <= 32'h00000F17;
		inst[14]	 <= 32'hFD1FF06F;
		inst[15]	 <= 32'h00100F93;
		inst[16]	 <= 32'hFC0014E3;
		inst[17]	 <= 32'hFC0062E3;
		inst[18]	 <= 32'hFFF00093;
		inst[19]	 <= 32'h0010C193;
		inst[20]	 <= 32'h003181B3;
		inst[21]	 <= 32'h003181B3;
		inst[22]	 <= 32'h003181B3;
		inst[23]	 <= 32'h003181B3;
		inst[24]	 <= 32'h003181B3;
		inst[25]	 <= 32'h003181B3;
		inst[26]	 <= 32'h003181B3;
		inst[27]	 <= 32'h003181B3;
		inst[28]	 <= 32'h003181B3;
		inst[29]	 <= 32'h003181B3;
		inst[30]	 <= 32'h003181B3;
		inst[31]	 <= 32'h003181B3;
		inst[32]	 <= 32'h003181B3;
		inst[33]	 <= 32'h003181B3;
		inst[34]	 <= 32'h003181B3;
		inst[35]	 <= 32'h003181B3;
		inst[36]	 <= 32'h003181B3;
		inst[37]	 <= 32'h003181B3;
		inst[38]	 <= 32'h003181B3;
		inst[39]	 <= 32'h003181B3;
		inst[40]	 <= 32'h003181B3;
		inst[41]	 <= 32'h003181B3;
		inst[42]	 <= 32'h003181B3;
		inst[43]	 <= 32'h003181B3;
		inst[44]	 <= 32'h003181B3;
		inst[45]	 <= 32'h003182B3;
		inst[46]	 <= 32'h005281B3;
		inst[47]	 <= 32'h00318233;
		inst[48]	 <= 32'h00420333;
		inst[49]	 <= 32'h006303B3;
		inst[50]	 <= 32'h00106413;
		inst[51]	 <= 32'h01F06E13;
		inst[52]	 <= 32'h01C3DEB3;
		inst[53]	 <= 32'h00000F17;
		inst[54]	 <= 32'hF3D418E3;
		inst[55]	 <= 32'h00000F17;
		inst[56]	 <= 32'hF27444E3;
		inst[57]	 <= 32'h41C3DEB3;
		inst[58]	 <= 32'h003EFEB3;
		inst[59]	 <= 32'h00000F17;
		inst[60]	 <= 32'hF1D19CE3;
		inst[61]	 <= 32'h00040E93;
		inst[62]	 <= 32'h007EE663;
		inst[63]	 <= 32'h00000F17;
		inst[64]	 <= 32'hF09FF06F;
		inst[65]	 <= 32'h00000013;
		inst[66]	 <= 32'h00200F93;
		inst[67]	 <= 32'h407301B3;
		inst[68]	 <= 32'h40338233;
		inst[69]	 <= 32'h00102493;
		inst[70]	 <= 32'h0041A533;
		inst[71]	 <= 32'h00322533;
		inst[72]	 <= 32'h00000F17;
		inst[73]	 <= 32'hEEA482E3;
		inst[74]	 <= 32'h01E1DE93;
		inst[75]	 <= 32'h009E8663;
		inst[76]	 <= 32'h00000F17;
		inst[77]	 <= 32'hED5FF06F;
		inst[78]	 <= 32'h00000013;
		inst[79]	 <= 32'h00300F93;
		inst[80]	 <= 32'h0030A513;
		inst[81]	 <= 32'h0012A5B3;
		inst[82]	 <= 32'h0030A633;
		inst[83]	 <= 32'h0FF57513;
		inst[84]	 <= 32'h00B57533;
		inst[85]	 <= 32'h00C57533;
		inst[86]	 <= 32'h00000F17;
		inst[87]	 <= 32'hEA0506E3;
		inst[88]	 <= 32'h0080B533;
		inst[89]	 <= 32'h00000F17;
		inst[90]	 <= 32'hEA0510E3;
		inst[91]	 <= 32'h00343533;
		inst[92]	 <= 32'h00000F17;
		inst[93]	 <= 32'hE8050AE3;
		inst[94]	 <= 32'h0030B513;
		inst[95]	 <= 32'h00000F17;
		inst[96]	 <= 32'hE80514E3;
		inst[97]	 <= 32'h00100593;
		inst[98]	 <= 32'h00B51663;
		inst[99]	 <= 32'h00000F17;
		inst[100]	 <= 32'hE79FF06F;
		inst[101]	 <= 32'h00000013;
		inst[102]	 <= 32'h00400F93;
		inst[103]	 <= 32'h0033E5B3;
		inst[104]	 <= 32'h00658663;
		inst[105]	 <= 32'h00000F17;
		inst[106]	 <= 32'hE61FF06F;
		inst[107]	 <= 32'h00000013;
		inst[108]	 <= 32'h00500F93;
		inst[109]	 <= 32'h02000913;
		inst[110]	 <= 32'h00592023;
		inst[111]	 <= 32'h00492223;
		inst[112]	 <= 32'h00092D83;
		inst[113]	 <= 32'h005DCDB3;
		inst[114]	 <= 32'h00692023;
		inst[115]	 <= 32'h00092E03;
		inst[116]	 <= 32'h01C34DB3;
		inst[117]	 <= 32'h00000F17;
		inst[118]	 <= 32'hE20D98E3;
		inst[119]	 <= 32'hA0000A37;
		inst[120]	 <= 32'h01492423;
		inst[121]	 <= 32'hFEDCBDB7;
		inst[122]	 <= 32'h40CDDD93;
		inst[123]	 <= 32'h00800E13;
		inst[124]	 <= 32'h01CD9DB3;
		inst[125]	 <= 32'h0FFDED93;
		inst[126]	 <= 32'h00B90E83;
		inst[127]	 <= 32'h01DDFDB3;
		inst[128]	 <= 32'h01B92423;
		inst[129]	 <= 32'h00895D83;
		inst[130]	 <= 32'hFFFF0A37;
		inst[131]	 <= 32'h01BA7A33;
		inst[132]	 <= 32'h00000F17;
		inst[133]	 <= 32'hDE0A1AE3;
		inst[134]	 <= 32'h00600F93;
		inst[135]	 <= 32'h00A94E03;
		inst[136]	 <= 32'h00B94E83;
		inst[137]	 <= 32'h008E9E93;
		inst[138]	 <= 32'h01CEEEB3;
		inst[139]	 <= 32'h010E9E93;
		inst[140]	 <= 32'h01DDEEB3;
		inst[141]	 <= 32'h00892E03;
		inst[142]	 <= 32'h00000F17;
		inst[143]	 <= 32'hDDDE16E3;
		inst[144]	 <= 32'h00092023;
		inst[145]	 <= 32'h01B91023;
		inst[146]	 <= 32'h0D000E13;
		inst[147]	 <= 32'h01C90123;
		inst[148]	 <= 32'h00092E03;
		inst[149]	 <= 32'h00D0DEB7;
		inst[150]	 <= 32'hBA0E8E93;
		inst[151]	 <= 32'h00000F17;
		inst[152]	 <= 32'hDBDE14E3;
		inst[153]	 <= 32'h00291D83;
		inst[154]	 <= 32'h0D000E13;
		inst[155]	 <= 32'h00000F17;
		inst[156]	 <= 32'hD9CD9CE3;
		inst[157]	 <= 32'h00700F93;
		inst[158]	 <= 32'h00000F17;
		inst[159]	 <= 32'hD800D6E3;
		inst[160]	 <= 32'h00145663;
		inst[161]	 <= 32'h00000F17;
		inst[162]	 <= 32'hD81FF06F;
		inst[163]	 <= 32'h00000F17;
		inst[164]	 <= 32'hD6107CE3;
		inst[165]	 <= 32'h00000F17;
		inst[166]	 <= 32'hD61478E3;
		inst[167]	 <= 32'h00000A17;
		inst[168]	 <= 32'h2AC00AE7;
		inst[169]	 <= 32'h00000F17;
		inst[170]	 <= 32'hD61FF06F;
		inst[171]	 <= 32'h008A0A13;
		inst[172]	 <= 32'h00000F17;
		inst[173]	 <= 32'hD55A1AE3;
		inst[174]	 <= 32'h66600F93;
		// inst[175]	 <= 32'hD4DFF06F; j dummy
		inst[175] <= 32'h00000033;
		inst[176] <= 32'h00000033;
		inst[177] <= 32'h00000073;
		inst[178] <= 32'h06608093;
		inst[179] <= 32'h000080FF;//illegal
		inst[180] <= 32'h66000F93;//li x31 0x660
		inst[181] <= 32'hD4DFF06F;//j dummy
		// add x0 x0 x0
		// add x0 x0 x0
		// ecall
		// addi x1 x1 0x66
		// abc x1 x1 x0 #illigel 
		// li x31 0x660
		// j dummy
        inst[182]	 <= 32'h00000033;
		inst[183]	 <= 32'h00000033;
		inst[184]	 <= 32'h00000033;
		inst[185]	 <= 32'h00000033;
		inst[186]	 <= 32'h00000033;
		inst[187]	 <= 32'h00000033;
		inst[188]	 <= 32'h00000033;
		inst[189]	 <= 32'h00000033;
		inst[190]	 <= 32'h00000033;
		inst[191]	 <= 32'h00000033;
		inst[192]	 <= 32'h00000033;
		inst[193]	 <= 32'h00000033;
		inst[194]	 <= 32'h00000033;
		inst[195]	 <= 32'h00000033;
		inst[196]	 <= 32'h00000033;
		inst[197]	 <= 32'h00000033;
		inst[198]	 <= 32'h00000033;
		inst[199]	 <= 32'h00000033;
		
        
		inst[200]	 <= 32'h30003B73;
		inst[201]	 <= 32'h30503BF3;
		inst[202]	 <= 32'h34203C73;
		inst[203]	 <= 32'h34303CF3;
		inst[204]	 <= 32'h34103D73;
		inst[205]	 <= 32'h00100713;
		inst[206]	 <= 32'h01870663;
		inst[207]	 <= 32'h004D0D13;
		inst[208]	 <= 32'h341D1073;
		inst[209]	 <= 32'h30200073;
        
		// trap:
		// csrrc x22 0x300 x0 #mstatus
		// csrrc x23 0x305 x0 #mtvec
		// csrrc x24 0x342 x0 #mcause
		// csrrc x25 0x343 x0 #mtval
		// csrrc x26 0x341 x0 #mepc
		// addi  x14  x0    1
		// beq   x14 x24    int_trap
		// addi  x26 x26    4
		// csrrw x0  0x341  x26
		// int_trap:
		// mret

	end

	
endmodule // ROM_in_test

// x22 x23 x24 x25 x26
//x14