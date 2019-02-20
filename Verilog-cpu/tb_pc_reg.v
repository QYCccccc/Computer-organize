`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 17:35:25
// Design Name: 
// Module Name: tb_pc_reg
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


module tb_pc_reg();
    reg clk = 0;
    reg en, rst;
    reg [31:0] Din;
    wire [31:0] Dout;
    
    always #20 clk = ~clk;
    
    initial begin
        en = 1;
        rst = 0;
        Din = 0;
        #50 en = 0;
        #50 en = 1;
        #100 rst = 1;
        #10 rst = 0;
        #50 rst = 1;
        #100 rst = 0;
    end
    
    always @(posedge clk)begin
        Din =  Din + 1;
    end
    
    PC_reg pc_reg(clk, en, rst, Din, Dout1);
    
endmodule
