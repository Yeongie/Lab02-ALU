# Lab 02 Report — MIPS ALU

## 1. Test Cases (Decimal)

| Test | alu_op | instr (funct) | A (decimal) | B (decimal) | zero | result (decimal) |
|------|--------|---------------|-------------|-------------|------|------------------|
| T1   | 2      | 36            | 4369        | 65535       | 0    | 4369             |
| T2   | 2      | 36            | 0           | 65535       | 1    | 0                |
| T3   | 2      | 37            | 4369        | 65535       | 0    | 65535            |
| T4   | 2      | 37            | 0           | 0           | 1    | 0                |
| T5   | 2      | 32            | 1           | 65535       | 0    | 65536            |
| T6   | 2      | 32            | 4369        | 65535       | 0    | 69904            |
| T7   | 2      | 32            | 1           | –1          | 1    | 0                |
| T8   | 2      | 32            | 1           | –2          | 0    | –1               |
| T9   | 2      | 34            | 1           | –1          | 0    | 2                |
| T10  | 2      | 34            | –1          | 1           | 0    | –2               |
| T11  | 2      | 34            | –1          | –1          | 1    | 0                |
| T12  | 2      | 34            | 1           | 1           | 1    | 0                |
| T13  | 2      | 42            | 2           | 2           | 1    | 0                |
| T14  | 2      | 42            | 2           | 1           | 1    | 0                |
| T15  | 2      | 42            | 1           | 2           | 0    | 1                |
| T16  | 2      | 42            | –1          | 1           | 0    | 1                |
| T17  | 2      | 42            | 1           | –1          | 1    | 0                |
| T18  | 2      | 39            | 4369        | 65535       | 0    | –65536           |
| T19  | 2      | 39            | 0           | 0           | 0    | –1               |
| T20  | 0      | 39            | 1           | 65535       | 0    | 65536            |
| T21  | 1      | 42            | 65535       | 1           | 0    | 65534            |
| T22  | 1      | 36            | 1           | 1           | 1    | 0                |


## 2. Issues & Fixes

- In alu.v ran into an issue with signed SLT logic. Verilog’s built-in `A < B` is unsigned, so SLT on negative numbers was wrong. Fixed by: ($signed(A) < $signed(B)) ? 1 : 0
- Also had trouble setting up initial tests
