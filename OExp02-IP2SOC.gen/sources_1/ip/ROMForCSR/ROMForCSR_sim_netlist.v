// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov 23 08:55:49 2024
// Host        : Kailqq running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               k:/Computer_organization/OExp02-IP2SOC/OExp02-IP2SOC.gen/sources_1/ip/ROMForCSR/ROMForCSR_sim_netlist.v
// Design      : ROMForCSR
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROMForCSR,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module ROMForCSR
   (a,
    spo);
  input [9:0]a;
  output [31:0]spo;

  wire [9:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "10" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1024" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "ROMForCSR.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  ROMForCSR_dist_mem_gen_v8_0_14 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uwBH4JaTzmENPjp1VK18+NmHqz3idKCCPayqakkK6bYDVk0JtRfycJYNxbcnLmlw5yuLTcDXBBKk
FqBPE2n7wWKg9tfz2Y8PrWAvnbsIFMfxBK8sfWUf8PPnz8vUwwMHjbXUWcgCgvtygj/TbB+jcZ8Z
CjYnBZ8tNdKOO1iDLpQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ff7o4KDFniNgPFT3cDZtw4HhiKzFbOFtLXtuci0MZhgQ8oZ15BcuowAfxUJXngU8JkWI9cbWKkG8
h/PODwnWEt4eK4VDKRk6Hw3QkZiKAa1N3QupC8D5bR7vJ/+RhJwSayz9t2JpdZaEhKgCgqTcX6oZ
4fCEOmSTUWVob+DXV4UfaMyfVm5VI0wxZ7q0mjFx+pdkt56PuNREX9kH4a9Ma1P0sYo8XaTpANLa
JC6eXOuUQlp40M9F/NL1Xajpys0YfGx8AveMAFEyfRmHZs+NbXmny/79vednrm+FhwtS9LveegmF
NZW9jiiR+9Igeraaz+QXPc6JO/nCDTr4Fuwusg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
enb/INzHPP7GNdz8dyyqgVCJiMs9JXcjMywZXhzPersGm0A258UOUwtOqcF1rO7lnrKwTeWbNFVN
dO3BxXBpzGnYWUqDda208CYV9hTWFhfySQdX58qn1Z8QY5G7KniMCVjaGuPPCfToPOOdbAxR9XUp
XbMr0vrZKWxz8nBhGYc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RKZNANfa63/n14iwmSxsB/UeV76BNqjEiYgjlZ2LdFWOArCv6D+jhC4sjGMiaz8GJ8J5kQeiWB0Y
e1+zdHflgzODs6eVC82MlEcfgP0vdDIBn0PP8rVDg5O31eQuJ7n5zn4XJu+vzjpkvJIHKrktAsP4
jg+LRxcTOu0dILImk7Vwgyuwhi8OxNN+jBVbLVxdNj0l5aQMgRZlU/8FVh3u958SH7z/fHnwGaOw
P8QgNv0ZZblWvpxa8TJIwlgVb9354a0eyD9XsKy5VfuUG03nmputxNzUuIUmGtBGCqx+4D4pyCch
j/ixD5iiKRmeKD1/RtGzxmrJap7SAHMuzic1Hw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OQMD0qoDy+4W8+jfTV63GDTwmjWvJILCTofeYJTZqWc2KhrzQXwVMW48dTyIriC6bA4bmXD5BwcB
W2gGbVUvY1Y1+wEFEwYIC0LiPrJO0DhpM1JhP2vkxnTEwaODiEp5x3XqHgsiys0I2/9mE4z4Hlbl
jzftQ/8sVSYokhMp9eaIHk3HNCSBllv90qeBfH3fOdVI2gA1r/22PktttbkyKji24r7jM5o4aMIc
Sp6u0DCnD2cSPCuCuMW3A9sFRuTKbXiLAeeymFIAXHKYQgWXXOqmbKHrk4GviHQyz31C9d+hm6dh
RMtaCyWnhqo3QE/QxP0TsYk3CgkjDCU+KK/ozA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uV1eryjGs1SHbpKIAk5r3BY2SLKX9RlfGw6gbw/UtzBYt4U7vTBIy+x767ojEcmbGLos8kr8vilV
cnNOnsbu7vOAUIe+1PgpaPaCkv2OTPXaE0tfps6+Q6D3zB6j2a2FE1gRIPOniwAdlIn69jL2tuWD
M2BN1efQhi0lZHuKtTgzBOVXIg+zbTiH2k2kHWThOi6WayoBEny+g88wRi6pUBeB6aW3ezFYNmsl
zeOY9xmt+UhRMcr87DCcZdmjsIk6VrsIKF60y93pM0IoQ56iWpQ2OKZK+Ng9qC+pNHBEYEhiMQFb
kUesHtcFOIS7Ok6S9O9SMgf7lMQFOh9w0L31UA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GM2VxmvaiVBg1DsqOLewt6rcWtfH/Gj1QS7fUSMudF5qJ2fn+TXd8kcCwwrxdcXNXjoVi2As5jmL
yw1/NZreemrkS1YCJJDxmnE8CW2q9/4N4a79kApF1VfD5XdpaULhVn+Eb+jXCQFG+GEEOvnPb0Me
bbfRkfc0DAIWgtG2D81EQ28mg7KAWtsDpdUCi+BKdIAj8RXoTiQbFbiBeT7EiRIrz2PQF9nhQBfF
FjlrCNwDP4hRQJQeZcf/1Pl8SFyKGQb6iVF+VhhCVCunL7VBmzaCOW/gowPM7hRM2dvzmxcgeKfs
dZx/fy2rk1iokUi+3B+Jc6CycMWbHu8EfCh7iQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NSZoNMCco4gpYPcg8pb9mtee1JxEWDcDzt6wnS0LeSPMi2upLvQXnSQKMvJGGOKStJOcu1eu7x33
4Xa3ApbjbfZ+lgs1PYlyY4V+B2Lio1EEo1uzZVWFrVFvmknOZwj6Gcmj5N/osaiqKaeIw7NTTbyX
HNHOabVsQJ540qnP4u/nzS/h/AQcm0PFLadGZtHJZEzyQDSSdghD/y/OLprdBcInfQDwAxQuJpCy
ExX4lD2WMrCkymNBS9NMH0vYh4kvpYKRO/oHuGcOZVg0p8vfMmz/BJDHuxTcS3FpLT0WxGVcmUIk
cuqKQFiVwwgnW9AfYkbsMrwfl9po2pofaAY2JC5ZTMyO1qEfSu4fxTRJNnDRvW65KkMdJhZFa36p
82hcDlaYvBowndZfMc42Sxt+ZULFDTFN0HT50iteAG1yEvJ9jKBiJla+kDQJB0VD0kj4+k8aBug3
uPKVykvf1/Uaw8NoW591pML42qlh8v1RzAm6aDnPRdsDaCc5Dq9QDPuE

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oRNld8VrAuP/xHUguZzkh8+wROOItnvw1FQUP5KHjxeh8nudEYH2PGefTPsV73QyEruJanGifjCR
m8XHiIxqAY9fk4CAm+2n67YLFUEHjC1Qri9htrL4W5fnj7OIdzcwttvmGEuGOuYOFA98RcnR0jSL
Nyqq5u/eILCh2MiKiELfsBjRv/WckpboJ+gzO1btduECvdBGjsIcjjHiIzPwNSGxnX3G6zG9OiWq
hXP2Jh0Ril7rGbajit90p+gJpDpuLee/aOh0BUXbYYLU0YIXK8bskgMir7D6cfu5oWDKwYH6/YRR
tFjIhRzFsqwjtmaxUnGTZzxsWGazk+uFfHXl7w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18464)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
