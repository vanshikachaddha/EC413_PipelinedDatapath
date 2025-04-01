`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 03/07/2025 
// Design Name: 
// Module Name:    Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Pipeline(
    input         clk,
    input         rst,
    input  [31:0] InstrIn,  // Instruction input (from testbench)
    output [31:0] Out    // Final ALU output
);

    // --- S1 Stage: Instruction Decode (IF/ID Register) ---
    wire [4:0]  S1_ReadSelect1, S1_ReadSelect2, S1_WriteSelect;
    wire        S1_WriteEnable;
    wire [31:0] S1_ImmediateValue;
    wire [2:0]  S1_ALUOp;
    wire        S1_DataSrc;
    
    S1_Register S1_Reg (
        // Register 1 Inputs 
        .clk(clk),
        .rst(rst),
        .InstrIn(InstrIn),
        
        //Register 1 Outputs 
        .S1_ReadSelect1(S1_ReadSelect1),
        .S1_ReadSelect2(S1_ReadSelect2),
        .S1_WriteSelect(S1_WriteSelect),
        .S1_WriteEnable(S1_WriteEnable),
        .Data_S(S1_DataSrc),
        .Imm(S1_ImmediateValue),
        .ALUOp(S1_ALUOp)

    );

    // --- Register File ---
    wire [31:0] RF_ReadData1, RF_ReadData2;
    nbit_register_file RF (
        .clk(clk),
        .RegWrite(S3_WriteEnable),
        .write_address(S3_WriteSelect),
        .write_data(S3_ALUOut),
        .read_sel_1(S1_ReadSelect1), 
        .read_sel_2(S1_ReadSelect2),    
        .read_data_1(RF_ReadData1), // Output 
        .read_data_2(RF_ReadData2) // Output 
    );

    // --- S2 Stage: Execute (ID/EX Register) ---
    wire [31:0] S2_RD1, S2_RD2;
    wire        S2_DataSrc;
    wire [2:0]  S2_ALUOp;
    wire        S2_WriteEnable;
    wire [4:0]  S2_WriteSelect;
    wire [31:0] S2_ImmediateValue;
    
    S2_Register S2_Reg (
        // Register 2 Inputs 
        .clk(clk),
        .rst(rst),
        .RD1(RF_ReadData1),
        .RD2(RF_ReadData2),
        .S1_WriteEnable(S1_WriteEnable),
        .S1_WriteSelect(S1_WriteSelect),
        .ALUOp(S1_ALUOp),
        .Data_S(S1_DataSrc),
        .Imm(S1_ImmediateValue),
        
        //Register 2 Outputs 
        .S2_RD1(S2_RD1),
        .S2_RD2(S2_RD2),
        .Imm2(S2_ImmediateValue),
        .Data_S2(S2_DataSrc),
        .ALUOp2(S2_ALUOp),
        .S2_WriteEnable(S2_WriteEnable),
        .S2_WriteSelect(S2_WriteSelect)
    );
    

    // --- ALU Operand MUX ---
    wire [31:0] R3; 
    MUX five_big_booms(
        .Data_S(S2_DataSrc),
        .RD2(S2_RD2),
        .IMM(S2_ImmediateValue),
        .mux_out(R3)
    );
    
    // --- ALU ---
    wire [31:0] alu_out;
    ALU aluuuuuu(
        .ALUOp(S2_ALUOp),
        .A(S2_RD1),
        .B(R3),
        .Result(alu_out)
    );
         
    // --- S3 Stage: Write Back (EX/WB Register) ---
    wire [31:0] S3_ALUOut;
    wire [4:0]  S3_WriteSelect;
    wire        S3_WriteEnable;
    
    S3_Register_right S3_right(
        // Register 3 Inputs 
        .clk(clk),
        .rst(rst),
        .R1(alu_out),
        .S2_WriteEnable(S2_WriteEnable),
        .S2_WriteSelect(S2_WriteSelect),
        
        // Register 3 Output 
        .ALUOut(S3_ALUOut),
        .S3_WriteEnable(S3_WriteEnable),
        .S3_WriteSelect(S3_WriteSelect)
    );

    // S3_Register

    // --- Final Output ---
    assign Out = S3_ALUOut;

endmodule
