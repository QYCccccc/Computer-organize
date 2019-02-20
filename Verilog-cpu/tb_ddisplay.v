`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 10:31:09
// Design Name: 
// Module Name: tb_ddisplay
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


module tb_ddisplay();
    reg [31:0] data;
    reg clk = 0;
    reg isHex;
    wire [7:0] an, seg;
    
    always #10 clk = ~clk;
    
    initial begin 
        isHex = 1;
        data = 32'h00ff00ff;
        #200 isHex = 0;
        data = 1234;
    end
    
    dynamic_display dds(clk, isHex, data, an, seg);
endmodule
