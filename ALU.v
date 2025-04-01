`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/18/2025 06:50:29 PM
// Design Name:
// Module Name: ALU
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


module ALU #(parameter WIDTH = 32)(
    input [2:0] ALUOp, // Operation selector
    input [WIDTH-1:0] A, B, // ALU operands
    output reg [WIDTH-1:0] Result // ALU result
);

    always @(*) begin
        case (ALUOp)
            3'b000: Result = A;                  // MOV (pass B)
            3'b001: Result = ~A;                 // NOT (bitwise NOT B)
            3'b011: Result = A + B; // ADD / ADDI (A + B or A + Imm)
            3'b100: Result = ~(A | B);           // NOR (bitwise NOR)
            3'b110: Result = A - B; // SUB / SUBI (A - B or A - Imm)
            3'b101: Result = ~(A & B);           // NAND (bitwise NAND)
            3'b010: Result = A & B;              // AND (bitwise AND)
            3'b111: Result = (A < B) ? 32'b1 : 32'b0; // SLT (Set Less Than)
            default: Result = 32'b0;
        endcase
    end

endmodule