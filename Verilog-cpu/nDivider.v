`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 19:45:30
// Design Name: 
// Module Name: nDivider
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


module nDivider(
    input clk,
    output reg clk_N
    );
    parameter N = 300_000; 
    reg [31:0] i = 0;
    initial clk_N = 0;
    
    always @(posedge clk) begin
        if(i == N /2 - 1) begin 
            clk_N <= ~clk_N;
            i <= 0;
        end
        else i <= i + 1;
    end
endmodule
