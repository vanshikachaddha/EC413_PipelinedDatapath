`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		InstrIn = 32'b000011_00010_00001_00010_00000000000;				// Read out R1 and R2, write result to R2
		
		#10;
		InstrIn = 32'b000011_00100_00011_00100_00000000000;				// Read out R3 and R4, write result to R4
		
		#10;
		InstrIn = 32'b000011_00110_00101_00110_00000000000;				// Read out R5 and R6, write result to R6
  
 // To Do: implement more test cases here      
		#10;
		InstrIn = 32'b000011_00001_00101_00001_00000000000;				// Read out R5 and R1, write result to R1 
		
		#10
		InstrIn = 32'b000011_0010_00100_00010_000000000000;             // Read out R2 and R4, write result to R2

        #10
		InstrIn = 32'b000011_0000_00000_00000_000000000000; 

		#10;

        // ---- MOV
        InstrIn = 32'b000000_00010_00001_00001_00000000000;
        #10; 
    
        // ---- NOT
        InstrIn = 32'b000001_00010_00001_00001_00000000000;
        #10; 
    
        // ---- ADD
        InstrIn = 32'b000011_00010_00011_00001_00000000000;
        #10; 
    
        // ---- ADDI
        InstrIn = 32'b001011_00010_00001_00000_00000000010;
        #10; 
    
        // ---- NOR
        InstrIn = 32'b000100_00010_00011_00001_00000000000;
        #10;
    
        // ---- SUB
        InstrIn = 32'b000110_00010_00011_00001_00000000000;
        #10; 
    
        // ---- SUBI
        InstrIn = 32'b001110_00010_00001_00000_00000000101;
        #10;
    
        // ---- NAND
        InstrIn = 32'b000101_00010_00011_00001_00000000000;
        #10; 
    
        // ---- AND
        InstrIn = 32'b000010_00010_00011_00001_00000000000;
        #10; 
    
        // ---- SLT
        InstrIn = 32'b000111_00010_00011_00001_00000000000;
        #10; 
        
        // ---- SLT
        InstrIn = 32'b000111_00010_00001_00011_00000000000;
        #10; 

    #100;
    $finish;
		$finish;

	end
      
endmodule

