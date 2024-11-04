module Ex(ALUcontrolE, ALUSrcE, RegDstE, RD1, RD2, RtE, RdE, ForwardAE, 
ForwardBE, ResultW, ALUOutM, SignImmE, ALUOutE, WriteDataE, WriteRegE);

input [3:0] ALUcontrolE;
input ALUSrcE, RegDstE;
input [31:0] ALUOutM, ResultW, RD1, RD2, SignImmE;
input [4:0] RtE, RdE;
input [1:0] ForwardAE, ForwardBE;

output [31:0] ALUOutE, WriteDataE;
output [4:0] WriteRegE;

wire [31:0] SrcAE, SrcBE;

mux2_32bits muxRegDst(RtE, RdE, RegDstE, WriteRegE);

mux3_32bits m1(RD1, ResultW, ALUOutM, ForwardAE, SrcAE);

mux3_32bits m2(RD2, ResultW, ALUOutM, ForwardBE, WriteDataE);

mux2_32bits m3(WriteDataE, SignImmE, ALUSrcE, SrcBE);

Alu alu(ALUcontrolE, SrcAE, SrcBE, ALUOutE);

endmodule

