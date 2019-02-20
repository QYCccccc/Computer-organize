`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 22:06:02
// Design Name: 
// Module Name: Controller
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

// ָ�����롢�����źŲ���
// ���룺ָ���op�ֶκ�func�ֶΣ�����5bits
// �����������������
// alu_op��ALU�����㷽��ѡ��
// memToReg�����ڴ����������д�뵽�Ĵ�����
// memWrite��д���ڴ��ź�
// syscall��ϵͳ�����ź�
// signedExt��������չ�ź�
// regDst���Ĵ��������Դ��Ϊ1������rd��Ϊ0������rt
// beq��bne��jr��jmp��jal��Ϊ��֧�ź�
module Controller(op, func, alu_op, memToReg, memWrite, alu_src, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal,multu,mflo,lh,bgez);
    input [5:0] op;
    input [5:0] func;
    output reg [3:0] alu_op;
    output reg memToReg, memWrite, alu_src, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal,multu,mflo,lh,bgez;
    
    
    always @(*) begin
        memToReg = 0; memWrite= 0; alu_src= 0; regWrite= 0; syscall= 0; signedExt= 0; regDst= 0; beq= 0; bne= 0; jr= 0; jmp= 0; jal = 0; multu=0 ; mflo=0 ; lh=0 ; bgez=0; // init to 0
        case(op) 
            0: begin // R type instruction
                case(func) 
                    0: begin alu_op = 0; regWrite = 1; regDst = 1; end // SLL
                    3: begin alu_op = 1; regWrite = 1; regDst = 1; end // SRA
                    2: begin alu_op = 2; regWrite = 1; regDst = 1; end // SRL
                    32: begin alu_op = 5; regWrite = 1; regDst = 1; end // ADD
                    33: begin alu_op = 5; regWrite = 1; regDst = 1; end // ADDU
                    34: begin alu_op = 6; regWrite = 1; regDst = 1; end // SUB
                    36: begin alu_op = 7; regWrite = 1; regDst = 1; end // AND
                    37: begin alu_op = 8; regWrite = 1; regDst = 1; end // OR
                    39: begin alu_op = 10; regWrite = 1; regDst = 1; end // NOR
                    42: begin alu_op = 11; regWrite = 1; regDst = 1; end // SLT
                    43: begin alu_op = 12; regWrite = 1; regDst = 1; end // SLTU
                    8: begin alu_op = 5; jr = 1; end // JR
                    12: begin syscall = 1; end // SYSCALL
                    25: begin alu_op = 3; multu = 1;end //MULTU
                    18: begin regWrite = 1; regDst = 1; mflo = 1; end //MFLO
                    // add your own R type instructions here
                endcase
            end
            1: begin alu_op = 11; bgez = 1; end //BGEZ
            2: begin jmp = 1; end // J
            3: begin regWrite = 1; jal = 1; end // JAL 
            4: begin signedExt = 1; beq = 1; end // BEQ
            5: begin signedExt = 1; bne = 1; end // BNE
            8: begin alu_op = 5; alu_src = 1; regWrite = 1; signedExt = 1; end // ADDI
            12: begin  alu_op = 7; alu_src = 1; regWrite = 1; end // ANDI
            9: begin  alu_op = 5; alu_src = 1; regWrite = 1; signedExt = 1; end // ADDIU
            10: begin  alu_op = 11; alu_src = 1; regWrite = 1; signedExt = 1; end // SLTI
            13: begin  alu_op = 8; alu_src = 1; regWrite = 1; end // ORI
            33: begin  alu_op = 5; memToReg = 1; alu_src = 1; regWrite = 1; signedExt = 1;lh = 1;end//LH
            35: begin  alu_op = 5; memToReg = 1; alu_src = 1; regWrite = 1; signedExt = 1;end // LW
            43: begin  alu_op = 5; memWrite = 1; alu_src = 1; signedExt = 1; end // SW
            // add your own M and J type instructions here
        endcase
    end
endmodule
