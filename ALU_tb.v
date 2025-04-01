`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/19/2025 11:57:27 AM
// Design Name:
// Module Name: ALU_tb
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


`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [31:0] RD1, RD2, Imm;
    reg [2:0] ALUOp;
    reg Data_S;
   

    // Output
    wire [31:0] ALU_out;

    // Instantiate the ALU module
    ALU g1(
        .A(RD1),
        .B(RD2),
        .ALUOp(ALUOp),
        .Result(ALU_out)
    );

  // Testbench stimulus
    initial begin
        // Initialize Inputs
        RD1     = 0;
        RD2     = 0;
        ALUOp  = 0;
        Imm = 0;
        Data_S = 0;
       
        // Wait 10 ns for global reset to finish
        #10;
       
        // Case 1: MOV
        RD1 = 32'h00000000;
        RD2 = 32'hffffffff;
        ALUOp = 3'b000;
        Data_S = 0;
       
        #10;
       
        // Case 2: NOT
        RD1 = 32'h00000000;
        RD2 = 32'hffffffff;
        ALUOp = 3'b001;
        Data_S = 0;
       
        #10;
       
        // Case 2: NOT
        RD1 = 32'h00000000;
        RD2 = 32'h11111111;
        ALUOp = 3'b001;
        Data_S = 0;
       
        #10;
       
        // Case 2: NOT
        RD1 = 32'h00000000;
        RD2 = 32'h10101010;
        ALUOp = 3'b001;
        Data_S = 0;
       
        #10;
       
        // Case 3: ADD
        RD1 = 32'h00000000;
        RD2 = 32'h11111111;
        ALUOp = 3'b011;
        Data_S = 0;
       
        #10;
       
               
        // Case 3: ADD
        RD1 = 32'h10101010;
        RD2 = 32'h01010101;
        ALUOp = 3'b011;
        Data_S = 0;
       
        #10;
       
       
        // Case 4: ADDI
        RD1 = 32'h10101010;
        Imm = 32'h00000010;
        ALUOp = 3'b011;
        Data_S = 1;
        #10;

        // Case 5: NOR (Bitwise NOR of RD1 and RD2)
        RD1 = 32'h10101010;
        RD2 = 32'h01010101;
        ALUOp = 3'b100;
        Data_S = 0;
        #10;  

        // Case 6: SUB (RD1 - RD2)
        RD1 = 32'h10101010;
        RD2 = 32'h01010101;
        ALUOp = 3'b110;
        Data_S = 0;
        #10;

        // Case 7: SUBI (RD1 - Imm)
        RD1 = 32'h10101010;
        Imm = 32'h00000001;
        ALUOp = 3'b110;
        Data_S = 1;
        #10;

        // Case 8: NAND (Bitwise NAND of RD1 and RD2)
        RD1 = 32'h10101010;
        RD2 = 32'h01010101;
        ALUOp = 3'b101;
        Data_S = 0;
        #10;

        // Case 9: AND (Bitwise AND of RD1 and RD2)
        RD1 = 32'h10101010;
        RD2 = 32'h01010101;
        ALUOp = 3'b010;
        Data_S = 0;
        #10;

        // Case 10: SLT (Set Less Than)
        RD1 = 32'h00000002;
        RD2 = 32'h00000003;
        ALUOp = 3'b111;
        Data_S = 0;
        #10;  

        $finish;
    end

endmodule