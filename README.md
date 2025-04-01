# EC413 Lab 6 – Pipelined 32-bit Datapath

This project implements a 4-stage pipelined 32-bit datapath in Verilog for EC413: Computer Organization. The pipeline includes Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), and Write Back (WB) stages, following a modular and hierarchical design.

## Features

- 4-stage pipelined datapath (S1–S4)
- Parameterized 32-bit ALU with support for R-type and I-type instructions
- Register file with configurable read/write
- MUX-controlled operand routing
- Behavioral Verilog-based design
- Testbenches for ALU, registers, and full pipeline
- Custom instruction format with simplified opcode decoding

## Key Modules

- `Pipeline.v` – Top-level datapath
- `ALU.v` – n-bit arithmetic and logic unit
- `nbit_register_file.v` – Parameterized register file
- `S1_Register.v`, `S2_Register.v`, `S3_Register.v` – Stage registers
- `MUX.v` – Multiplexer for operand selection
- `ALU_tb.v`, `Register_tb.v`, `Pipeline_tb.v` – Testbenches

## Testing

Includes waveforms and test cases for:
- ALU operations: ADD, SUB, MOV, SLT, NAND, NOR, etc.
- Instruction execution through all four stages
- Register read/write correctness
