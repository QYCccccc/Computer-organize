`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 20:29:40
// Design Name: 
// Module Name: tb_RAM
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


module tb_RAM();
    reg clk = 0, rst = 0;
    reg [9:0] addr;
    reg we;
    reg [31:0] Din;
    wire  [31:0] Dout;
    always #20 clk = ~clk;
    initial begin
        addr = 0;
        we = 1;
        Din = 32'h000000ff;
        #30 we = 0;
        addr = 10;
        Din = 32'h0000ff00;
        #10 we = 1;
        #20 we = 0;
        addr = 0;
        #5 addr = 3;
        #20 rst = 1;
        addr = 0;
        #20 rst = 0;
        
    end
    RAM ram(.clk(clk), .rst(rst), .we(we), .addr(addr), .Din(Din), .Dout(Dout));
endmodule
