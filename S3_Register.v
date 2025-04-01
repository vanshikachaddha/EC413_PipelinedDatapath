`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 06:32:53 PM
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(
    input clk,
    input rst,
    input [31:0] R1,         
    
    input        S2_WriteEnable,  // Write enable signal
    input [4:0]  S2_WriteSelect,  // Write select (destination register)
    output reg [31:0] ALUOut,       // Latched Read Data 
    
    output reg        S3_WriteEnable, // Latched write enable
    output reg [4:0]  S3_WriteSelect  // Latched write select
 );

    always @(posedge clk) begin
        if (rst) begin
            ALUOut         <= 32'd0;
            S3_WriteEnable <= 1'b0;
            S3_WriteSelect <= 5'd0;
        end else begin
            ALUOut <= R1;

            S3_WriteEnable <= S2_WriteEnable;
            S3_WriteSelect <= S2_WriteSelect;
        end
    end
    
    
endmodule