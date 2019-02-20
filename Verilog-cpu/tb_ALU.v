`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 21:33:57
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();
        reg [31:0] a;        //OP1
        reg [31:0] b;        //OP2
        reg [3:0] aluop;    //controller
        reg [4:0] shamt; // shift number
        wire [31:0] r1;    //result1
        wire [31:0] r2;   // result 2
        wire equ;
        reg clk = 0;
        always #10clk = ~clk;
        initial begin
        a = 1;
        b = 32'h000000f0;
        shamt = 4;
        aluop = 0;
        #250 a = 32'hf0000000;
        shamt = 1;
        end
       
        always @(posedge clk) begin
            aluop = aluop + 1;
            if (aluop == 13) aluop = 0;
        end
        ALU alu(a, b, aluop, shamt, r1, r2, equ);
endmodule
