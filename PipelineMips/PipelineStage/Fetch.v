module Fetch(clk, rst, StallF, RD, PCSrcD, PCBranchD, PCPlus4_F, PCF, PC, JA, Jump);
input clk, rst, StallF, PCSrcD, Jump;
input [31:0] PCBranchD, PCF, JA;

output [31:0] RD, PCPlus4_F;
output [31:0] PC;

wire [31:0] P;
mux2_32bits PC_mux(PCPlus4_F, PCBranchD, PCSrcD, P);
mux2_32bits PCJ(P, JA, Jump, PC);
adder add4_PC(32'd4, PCF, PCPlus4_F);

imem inst(PCF, RD);
endmodule