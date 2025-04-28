//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Isaac Lee
// Email: ilee002@ucr.edu
// 
// Assignment name: Lab02 ALU
// Lab section: 21
// TA: Sakshar Chakravarty
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

// lab02_tb.v
`timescale 1ns / 1ps

module lab02_tb;

    // Inputs to control logic 
    reg  [1:0] alu_op;
    reg  [5:0] funct;

    // ALU operands 
    reg  [31:0] A, B;

    // Outputs from control logic and ALU 
    wire [3:0]  alu_control;
    wire [31:0] result;
    wire        zero;

    // Instantiate provided ALU control (do NOT modify this file)
    alu_control ctrl (
        .alu_op      (alu_op),
        .funct       (funct),
        .alu_control (alu_control)
    );

    // Instantiate your ALU implementation
    alu dut (
        .alu_control (alu_control),
        .A           (A),
        .B           (B),
        .result      (result),
        .zero        (zero)
    );

    initial begin
        // Test  1: AND (R-type funct=0x24)
        alu_op = 2'b10; funct = 6'h24; A = 32'h00001111; B = 32'h0000FFFF; #10;
        $display("T1  AND       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  2: AND zero
        alu_op = 2'b10; funct = 6'h24; A = 32'h00000000; B = 32'h0000FFFF; #10;
        $display("T2  AND zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  3: OR  (R-type funct=0x25)
        alu_op = 2'b10; funct = 6'h25; A = 32'h00001111; B = 32'h0000FFFF; #10;
        $display("T3  OR        A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  4: OR zero
        alu_op = 2'b10; funct = 6'h25; A = 32'h00000000; B = 32'h00000000; #10;
        $display("T4  OR zero   A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  5: ADD (R-type funct=0x20)
        alu_op = 2'b10; funct = 6'h20; A = 32'h00000001; B = 32'h0000FFFF; #10;
        $display("T5  ADD       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  6: ADD
        alu_op = 2'b10; funct = 6'h20; A = 32'h00001111; B = 32'h0000FFFF; #10;
        $display("T6  ADD       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  7: ADD zero
        alu_op = 2'b10; funct = 6'h20; A = 32'h00000001; B = 32'hFFFFFFFF; #10;
        $display("T7  ADD zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  8: ADD
        alu_op = 2'b10; funct = 6'h20; A = 32'h00000001; B = 32'hFFFFFFFE; #10;
        $display("T8  ADD       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test  9: SUB (R-type funct=0x22)
        alu_op = 2'b10; funct = 6'h22; A = 32'h00000001; B = 32'hFFFFFFFF; #10;
        $display("T9  SUB       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 10: SUB
        alu_op = 2'b10; funct = 6'h22; A = 32'hFFFFFFFF; B = 32'h00000001; #10;
        $display("T10 SUB       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 11: SUB zero
        alu_op = 2'b10; funct = 6'h22; A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; #10;
        $display("T11 SUB zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 12: SUB zero
        alu_op = 2'b10; funct = 6'h22; A = 32'h00000001; B = 32'h00000001; #10;
        $display("T12 SUB zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 13: SLT zero
        alu_op = 2'b10; funct = 6'h2A; A = 32'h00000002; B = 32'h00000002; #10;
        $display("T13 SLT zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 14: SLT zero
        alu_op = 2'b10; funct = 6'h2A; A = 32'h00000002; B = 32'h00000001; #10;
        $display("T14 SLT zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 15: SLT
        alu_op = 2'b10; funct = 6'h2A; A = 32'h00000001; B = 32'h00000002; #10;
        $display("T15 SLT       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 16: SLT
        alu_op = 2'b10; funct = 6'h2A; A = 32'hFFFFFFFF; B = 32'h00000001; #10;
        $display("T16 SLT       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 17: SLT zero
        alu_op = 2'b10; funct = 6'h2A; A = 32'h00000001; B = 32'hFFFFFFFF; #10;
        $display("T17 SLT zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 18: NOR
        alu_op = 2'b10; funct = 6'h27; A = 32'h00001111; B = 32'h0000FFFF; #10;
        $display("T18 NOR       A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 19: NOR zero
        alu_op = 2'b10; funct = 6'h27; A = 32'h00000000; B = 32'h00000000; #10;
        $display("T19 NOR zero  A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 20: ADD (I-type lw/sw)
        alu_op = 2'b00; funct = 6'h27; A = 32'h00000001; B = 32'h0000FFFF; #10;
        $display("T20 ADD(I)    A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 21: SUB (I-type beq)
        alu_op = 2'b01; funct = 6'h2A; A = 32'h0000FFFF; B = 32'h00000001; #10;
        $display("T21 SUB(I)    A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        // Test 22: SUB zero (I-type beq)
        alu_op = 2'b01; funct = 6'h24; A = 32'h00000001; B = 32'h00000001; #10;
        $display("T22 SUB(I) zero A=0x%h B=0x%h => res=0x%h zero=%b", A, B, result, zero);

        $finish;
    end

endmodule
