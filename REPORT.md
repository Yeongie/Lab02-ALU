# Lab 02 Report — MIPS ALU
# Isaac Lee, ilee002@ucr.edu

## 1. Test Cases (Decimal)

T1: alu_op=2, instr (funct)=36, A=4369, B=65535 → zero=0, result=4369

T2: alu_op=2, instr=36, A=0, B=65535 → zero=1, result=0

T3: alu_op=2, instr=37, A=4369, B=65535 → zero=0, result=65535

T4: alu_op=2, instr=37, A=0, B=0 → zero=1, result=0

T5: alu_op=2, instr=32, A=1, B=65535 → zero=0, result=65536

T6: alu_op=2, instr=32, A=4369, B=65535 → zero=0, result=69904

T7: alu_op=2, instr=32, A=1, B=-1 → zero=1, result=0

T8: alu_op=2, instr=32, A=1, B=-2 → zero=0, result=-1

T9: alu_op=2, instr=34, A=1, B=-1 → zero=0, result=2

T10: alu_op=2, instr=34, A=-1, B=1 → zero=0, result=-2

T11: alu_op=2, instr=34, A=-1, B=-1 → zero=1, result=0

T12: alu_op=2, instr=34, A=1, B=1 → zero=1, result=0

T13: alu_op=2, instr=42, A=2, B=2 → zero=1, result=0

T14: alu_op=2, instr=42, A=2, B=1 → zero=1, result=0

T15: alu_op=2, instr=42, A=1, B=2 → zero=0, result=1

T16: alu_op=2, instr=42, A=-1, B=1 → zero=0, result=1

T17: alu_op=2, instr=42, A=1, B=-1 → zero=1, result=0

T18: alu_op=2, instr=39, A=4369, B=65535 → zero=0, result=-65536

T19: alu_op=2, instr=39, A=0, B=0 → zero=0, result=-1

T20: alu_op=0, instr=39, A=1, B=65535 → zero=0, result=65536

T21: alu_op=1, instr=42, A=65535, B=1 → zero=0, result=65534

T22: alu_op=1, instr=36, A=1, B=1 → zero=1, result=0


## 2. Issues & Fixes

- In alu.v ran into an issue with signed SLT logic. Verilog’s built-in `A < B` is unsigned, so SLT on negative numbers was wrong. Fixed by: ($signed(A) < $signed(B)) ? 1 : 0
- Also had trouble setting up initial tests
