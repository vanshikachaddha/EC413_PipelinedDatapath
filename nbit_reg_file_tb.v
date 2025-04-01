`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/19/2025 04:31:01 PM
// Design Name:
// Module Name: nbit_register_file_tb
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


module nbit_reg_file_tb;
    parameter data_width = 32;
    parameter select_width = 5;
   
    reg clk;
    reg RegWrite;
    reg [data_width-1:0] write_data;
    reg [data_width-1:0] read_sel_1, read_sel_2, write_address;
   
    wire [data_width-1:0] read_data_1, read_data_2;
   
    nbit_register_file g1(
        .clk(clk),
        .RegWrite(RegWrite),
        .write_data(write_data),
        .read_sel_1(read_sel_1),
        .read_sel_2(read_sel_2),
        .write_address(write_address),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2)
    );
   
    always #5 clk = ~clk;
   
    initial begin
   
        clk = 0;
        RegWrite = 0;
        write_data = 0;
        write_address = 0;
        read_sel_1 = 0;
        read_sel_2 = 0;
       
        #10
       
        // reading from register
       
        read_sel_1 = 1;
        read_sel_2 = 2;
        #10;
       
        // writing to register
       
        RegWrite = 1;
        write_address = 2;
        write_data = 32'hffffffff;
       
        #10
       
        RegWrite = 0;
        read_sel_1 = 2;
       
        #10
       
        RegWrite = 1;
        write_address = 5;
        write_data = 32'heeeeeeee;
        #10
       
        RegWrite = 0;
        read_sel_2 = 5;
       
       #100
       
        $finish;
    end
endmodule
