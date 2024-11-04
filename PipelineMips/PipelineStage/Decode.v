module Decode(clk, rst, InstrD, PCPlus4D, RegWriteW, WriteRegW, ResultW,
RegWriteD, MemToRegD, MemWriteD, ALUcontrolD, ALUSrcD, RegDstD,
PCSrcD, RD1, RD2, RsD, RtD,RdD, SignImmD, PCBranchD, BranchD, ForwardAD, ForwardBD, ALUOutM, JA, Jump, stall);

input clk, rst, RegWriteW, stall;
input [4:0] WriteRegW;
input [31:0] PCPlus4D, ResultW, InstrD;
input [1:0] ForwardAD, ForwardBD;

output RegWriteD, MemToRegD, MemWriteD, ALUSrcD, RegDstD, PCSrcD, BranchD, Jump;
output [3:0] ALUcontrolD;
output [31:0] PCBranchD, SignImmD, RD1, RD2, ALUOutM, JA;
output [4:0] RsD, RtD, RdD;

wire equal, br;
wire [31:0] shifted, c1, c2, s1, RD1i, RD2i;

control c(InstrD[31:26], InstrD[5:0],
RegDstD, MemWriteD, MemToRegD, 
ALUcontrolD, ALUSrcD, RegWriteD, BranchD, Jump, stall);

regfile rf(clk, rst, InstrD[25:21], InstrD[20:16], WriteRegW, ResultW, RegWriteW, RD1i, RD2i);

signextend se(InstrD[15:0], SignImmD);

assign shifted = SignImmD << 2;

mux3_32bits mu7(RD1i, ALUOutM, ResultW, ForwardAD, c1);
mux3_32bits mu8(RD2i, ALUOutM, ResultW, ForwardBD, c2);

adder add4_PC(shifted, PCPlus4D, PCBranchD);

assign JA = InstrD[25:0] << 2;

assign br = ((InstrD[31:26] == 6'h05) && (c1 != c2)) ? 1'b1 :
             ((InstrD[31:26] == 6'h04) && (c1  == c2)) ? 1'b1 :1'b0;

assign PCSrcD = ((br || Jump) && BranchD);

assign RsD = InstrD[25:21];
assign RtD = InstrD[20:16];
assign RdD = InstrD[15:11];
assign RD1 = c1;
assign RD2 = c2;
endmodule
