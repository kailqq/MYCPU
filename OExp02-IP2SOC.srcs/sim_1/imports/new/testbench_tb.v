`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 10:38:19
// Design Name: 
// Module Name: testbench_tb
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


module testbench_tb();
    reg clk;
    reg rst;
    reg INT;

    testbench m0(.clk(clk), .rst(rst),.INT(INT));

    initial begin
        clk = 1'b0;
        INT = 1'b0;
        rst = 1'b1;
        #5;
        rst = 1'b0;
        #10;
        INT = 1'b1;
    end

    always #5 clk = ~clk;

endmodule
