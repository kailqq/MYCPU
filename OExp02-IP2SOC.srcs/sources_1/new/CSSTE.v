`timescale 1ns / 1ps


`include "scpu_header.vh"

module CSSTE(
    input         clk_100mhz,
    input         RSTN,
    input  [3:0]  BTN_y,
    input  [15:0] SW,
    // output [3:0]  Blue,
    // output [3:0]  Green,
    // output [3:0]  Red,
    // output        HSYNC,
    // output        VSYNC,
    output [15:0] LED_out,
    output [7:0] AN,
    output [7:0] segment,
    output wire tx
);
   
   `RegFile_Regs_Declaration
    //U9
    wire [3:0] U9_BTN_OK;
    wire [15:0] U9_SW_OK;
    wire U9_rst;
    SAnti_jitter U9(
        .clk(clk_100mhz),
        .RSTN(RSTN),
        .Key_y(BTN_y),
        .SW(SW),
        .BTN_OK(U9_BTN_OK),
        .SW_OK(U9_SW_OK),
        .rst(U9_rst)
    );
    //

    //U8
    wire [31:0] U8_clk_div;
    wire U8_Clk_CPU;
    clk_div U8(
      .clk(clk_100mhz),
      .rst(U9_rst),
      .SW2(U9_SW_OK[2]),
      .SW8(U9_SW_OK[8]),
      .STEP(U9_SW_OK[10]),
      .clkdiv(U8_clk_div),
      .Clk_CPU(U8_Clk_CPU) 
    );
    //

    //U2
    wire [31:0] U2_spo;
   dist_mem_gen_0 U2(
        .a(U1_PC_out[11:2]),
        .spo(U2_spo)
    );
    //

    //U1
    wire U1_MemRW;
    wire [31:0] U1_Addr_out;
    wire [31:0] U1_Data_out;
    wire [31:0] U1_PC_out;
    wire [3:0] U1_wt_bits;
    //debug signals
    wire [4:0] U1_rs1,
               U1_rs2,
               U1_rd;
    wire [31:0] U1_rs1_val,
                U1_rs2_val,
                U1_reg_i_data;
    wire U1_reg_wen,
         U1_is_imm,
         U1_is_auipc,
         U1_is_lui,
         U1_is_branch,
         U1_is_jal,
         U1_is_jalr,
         U1_do_branch;
    wire [31:0] U1_imm,
                U1_a_val,
                U1_b_val,
                U1_pc_branch;
    wire [3:0] U1_alu_ctrl;

    wire [31:0] U1_mstatus,
                U1_mepc,
                U1_mtval,
                U1_mcause,
                U1_mtvec;
    //
    MyScpu U1(
        .clk(U8_Clk_CPU),
        .rst(U9_rst),
        .INT(U9_SW_OK[13]),
        .Data_in(U4_Cpu_data4bus),
        .inst_in(U2_spo),
        .MemRW(U1_MemRW),
        .Addr_out(U1_Addr_out),
        .Data_out(U1_Data_out),
        .PC_out(U1_PC_out),
        `RegFile_Regs_Arguments
        .RAM_wt_bits(U1_wt_bits),
        //debug
        .rs1(U1_rs1),
        .rs1_val(U1_rs1_val),
        .rs2(U1_rs2),
        .rs2_val(U1_rs2_val),
        .rd(U1_rd),
        .reg_i_data(U1_reg_i_data),
        .reg_wen(U1_reg_wen),
        .is_imm(U1_is_imm),
        .is_auipc(U1_is_auipc),
        .is_lui(U1_is_lui),
        .is_branch(U1_is_branch),
        .is_jal(U1_is_jal),
        .is_jalr(U1_is_jalr),
        .do_branch(U1_do_branch),
        .imm(U1_imm),
        .a_val(U1_a_val),
        .b_val(U1_b_val),
        .pc_branch(U1_pc_branch),
        .alu_ctrl(U1_alu_ctrl),
        .mstatus_o(U1_mstatus),
        .mepc_o(U1_mepc),
        .mtval_o(U1_mtval),
        .mcause_o(U1_mcause),
        .mtvec_o(U1_mtvec)
    );
    //

    //U3
    wire [31:0] U3_douta;
    RAM_B U3(
        .clka(~clk_100mhz),
        .wea({4{U4_data_ram_we}}&U1_wt_bits),
        .addra(U4_ram_addr),
        .dina(U4_ram_data_in),
        .douta(U3_douta)
    );
    //

    //U4
    wire [31:0] U4_Cpu_data4bus,
                U4_ram_data_in;
    wire [9:0] U4_ram_addr;
    wire U4_data_ram_we,
         U4_GPIOf0000000_we,
         U4_GPIOe0000000_we,
         U4_counter_we;
    wire [31:0] U4_Peripheral_in;
    MIO_BUS U4(
        .clk(clk_100mhz),
        .rst(U9_rst),
        .BTN(U9_BTN_OK),
        .SW(U9_SW_OK),
        .mem_w(U1_MemRW),
        .Cpu_data2bus(U1_Data_out),
        .addr_bus(U1_Addr_out),
        .ram_data_out(U3_douta),
        .led_out(U7_LED_out),
        .counter_out(U10_counter_out),
        .counter0_out(U10_counter0_OUT),
        .counter1_out(U10_counter1_OUT),
        .counter2_out(U10_counter2_OUT),
        .Cpu_data4bus(U4_Cpu_data4bus),
        .ram_data_in(U4_ram_data_in),
        .ram_addr(U4_ram_addr),
        .data_ram_we(U4_data_ram_we),
        .GPIOf0000000_we(U4_GPIOf0000000_we),
        .GPIOe0000000_we(U4_GPIOe0000000_we),
        .counter_we(U4_counter_we),
        .Peripheral_in(U4_Peripheral_in)
    );
    //

    //U10
    wire U10_counter0_OUT;
    wire U10_counter1_OUT;
    wire U10_counter2_OUT;
    wire [31:0] U10_counter_out;
    Counter_x U10(
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .clk0(U8_clk_div[6]),
        .clk1(U8_clk_div[9]),
        .clk2(U8_clk_div[11]),
        .counter_we(U4_counter_we),
        .counter_val(U4_Peripheral_in),
        .counter_ch(U7_counter_set),
        .counter0_OUT(U10_counter0_OUT),
        .counter1_OUT(U10_counter1_OUT),
        .counter2_OUT(U10_counter2_OUT),
        .counter_out(U10_counter_out)
    );
    //

    //U5
    wire [7:0] U5_point_out,
               U5_LE_out;
    wire [31:0] U5_Disp_num;
    Multi_8CH32 U5(
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .EN(U4_GPIOe0000000_we),
        .Test(U9_SW_OK[7:5]),
        .point_in({U8_clk_div[31:0],U8_clk_div[31:0]}),
        .LES(64'b0),
        .Data0(U4_Peripheral_in),
        .data1({2'b0,U1_PC_out[31:2]}),
        .data2(U2_spo),
        .data3(U10_counter_out),
        .data4(U1_Addr_out),
        .data5(U1_Data_out),
        .data6(U4_Cpu_data4bus),
        .data7(U1_PC_out),
        .point_out(U5_point_out),
        .LE_out(U5_LE_out),
        .Disp_num(U5_Disp_num)
    ); 
    //

    //U6
    Seg7_Dev U6(
        .disp_num(U5_Disp_num),
        .point(U5_point_out),
        .les(U5_LE_out),
        .scan(U8_clk_div[18:16]),
        .AN(AN),
        .segment(segment)
    );
    //

    //U7
    wire [1:0] U7_counter_set;
    wire [15:0] U7_LED_out;
    assign LED_out=U7_LED_out;
    SPIO U7(
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .Start(U8_clk_div[20]),
        .EN(U4_GPIOf0000000_we),
        .P_Data(U4_Peripheral_in),
        .counter_set(U7_counter_set),
        .LED_out(U7_LED_out)
    );
    //

    UART uart_inst(
         .clk(clk_100mhz),
         .rst(U9_SW_OK[0]), 
         .tx(tx), 
         `URAT_RegFile_Arguments
         .pc(U1_PC_out), 
         .inst(U2_spo),
         .alu_res(U1_Addr_out),
         .mem_wen(U1_MemRW),
        .dmem_o_data(U3_douta),
        .dmem_i_data(U4_ram_data_in),
        .dmem_addr(U1_Addr_out),

        //
        .rs1(U1_rs1),
        .rs2(U1_rs2),
        .rd(U1_rd),
        .rs1_val(U1_rs1_val),
        .rs2_val(U1_rs2_val),
        .reg_i_data(U1_reg_i_data),
        .reg_wen(U1_reg_wen),
        .is_imm(U1_is_imm),
        .is_auipc(U1_is_auipc),
        .is_lui(U1_is_lui),
        .is_branch(U1_is_branch),
        .is_jal(U1_is_jal),
        .is_jalr(U1_is_jalr),
        .do_branch(U1_do_branch),
        .imm(U1_imm),
        .a_val(U1_a_val),
        .b_val(U1_b_val),
        .pc_branch(U1_pc_branch),
        .alu_ctrl(U1_alu_ctrl),
        .mstatus_o(U1_mstatus),
        .mepc_o(U1_mepc),
        .mtval_o(U1_mtval),
        .mcause_o(U1_mcause),
        .mtvec_o(U1_mtvec)
         );
    //
endmodule
