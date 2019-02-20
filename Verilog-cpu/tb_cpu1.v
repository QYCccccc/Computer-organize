`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 20:16:10
// Design Name: 
// Module Name: tb_cpu1
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


module tb_cpu1();
    reg clk, rst, hf, go, addrI;
    reg [2:0] dataSel;
    wire [7:0] an, seg;
    wire [2:0] led;
    wire haltLed;
    
    initial begin
        clk = 0;
        rst = 0;
        dataSel = 0;
        addrI = 0;
        go = 0;
        hf = 0;
        # 9000 dataSel = 1;
    end
    
    always #1 clk = ~clk;
    
    CPU_in_DDR4 cpu(clk, rst, go, hf, addrI, dataSel, an, seg, led, haltLed);
    
endmodule
