`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 06:57:56 PM
// Design Name: 
// Module Name: MUX
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


module MUX #(parameter WIDTH = 32)(
    input Data_S,
    input [WIDTH-1:0] RD2, 
    input [WIDTH-1:0] IMM,
    output [WIDTH-1:0] mux_out 

    );
    
    assign mux_out = Data_S ? IMM : RD2; 
    
endmodule
