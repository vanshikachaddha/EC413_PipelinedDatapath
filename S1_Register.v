`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 03/07/2025 
// Design Name: 
// Module Name:    S1_Register 
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

module S1_Register(
    input clk,
    input rst,
    input [31:0] InstrIn,
    output reg [4:0]  S1_ReadSelect1,   // Source register 1 (r2)
    output reg [4:0]  S1_ReadSelect2,   // Source register 2 (r3) for R-format
    output reg [4:0]  S1_WriteSelect,   // Destination register (r1)
    output reg        S1_WriteEnable,
    output reg        Data_S,
    output reg [31:0] Imm,
    output reg [2:0] ALUOp

    // To Do: implement the rest of the logic according to the figure

);
    
    always @(posedge clk) begin
        if (rst) begin
            S1_ReadSelect1    <= 5'd0;
            S1_ReadSelect2    <= 5'd0;
            S1_WriteSelect    <= 5'd0;
            S1_WriteEnable    <= 1'b0;


        end else begin
            // Decode register fields:
            // r1 (destination) is bits [25:21]
            // r2 (source1) is bits [20:16]
            // r3 (source2) is bits [15:11] (for R-format instructions)
            S1_WriteSelect <= InstrIn[25:21];
            S1_ReadSelect1 <= InstrIn[20:16];
            S1_ReadSelect2 <= InstrIn[15:11];
            // Always enable writing in this simple design. This is because we focus on R and I format instructions.
			// For these format of instructions, the destination register is always written.
            S1_WriteEnable <= 1'b1;
            
            
            // To Do Below: implement the rest of the logic according to the figure
          
     
            // Decode the immediate value by sign-extending the lower 16 bits.
            Imm <= {{16{InstrIn[15]}}, InstrIn[15:0]}; 

            // Decode ALU operation:
            // Bits [28:26] are fed into the ALU's ALUOp.
            
            ALUOp <= InstrIn[28:26];

            // Data source selection:
            // Bit 29 indicates whether the instruction uses an immediate (1) or a register (0)
            
            //            R type --> 0      I type --> 1      if 29-bit = 1 I = Data_S = 1
            Data_S <= InstrIn[29];
            
            

        end
    end

endmodule
