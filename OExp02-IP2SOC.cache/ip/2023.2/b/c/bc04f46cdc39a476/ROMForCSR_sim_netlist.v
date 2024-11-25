// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov 23 08:55:48 2024
// Host        : Kailqq running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ROMForCSR_sim_netlist.v
// Design      : ROMForCSR
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROMForCSR,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18496)
`pragma protect data_block
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
LWVAMxjxcQZO4CmsHiaho0CS5QDl+xZzkOJxmg==
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
