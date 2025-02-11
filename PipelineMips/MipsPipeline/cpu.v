module cpu(clk, rst);
input clk, rst;

// IF
wire StallF, PCSrcD;
wire [31:0] PC, PCF, PCPlus4F, PCBranchD, RDF;

// ID
wire StallD, RegWriteW, RegWriteD, MemToRegD, MemWriteD, ALUSrcD, RegDstD, BranchD, Jump;
wire [3:0] ALUcontrolD;
wire [31:0] InstrD, PCPlus4D, RD1_in, RD2_in, SignImmD, ALUOutM, JA, ResultW ; 
wire [4:0] RsD, RtD,RdD, WriteRegW;

// EX
wire FlushE, RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE;
wire [3:0] ALUControlE;
wire [31:0]  RD1_out, RD2_out, SignImmE, ALUOutE, WriteDataE;
wire [1:0] ForwardAE, ForwardBE, ForwardAD, ForwardBD;
wire [4:0] WriteRegE, RsE, RtE, RdE;

// MEM
wire RegWriteM, MemtoRegM, MemWriteM;
wire [31:0] WriteDataM, ReadDataM;
wire [4:0] WriteRegM;

//WB
wire MemtoRegW;
wire [31:0] ReadDataW, ALUOutW;

RegFe fe(clk, rst, StallF, PC, PCF);
Fetch fetch(clk, rst, StallF, RDF, PCSrcD, PCBranchD, PCPlus4F, PCF, PC, JA, Jump);

RegFe_De fe_de(clk, rst, StallD, PCSrcD, RDF, InstrD, PCPlus4F, PCPlus4D);
Decode decode(clk, rst, InstrD, PCPlus4D, RegWriteW, WriteRegW, ResultW, RegWriteD, MemToRegD, MemWriteD, ALUcontrolD, ALUSrcD, RegDstD, PCSrcD, RD1_in, RD2_in, 
RsD, RtD,RdD, SignImmD, PCBranchD, BranchD, ForwardAD, ForwardBD, ALUOutM, JA, Jump, StallD);

RegDe_Ex de_ex(clk, rst, FlushE, RegWriteD, RegWriteE, MemToRegD,
		 MemtoRegE, MemWriteD, MemWriteE, ALUcontrolD, ALUControlE, 
		 ALUSrcD, ALUSrcE, RegDstD, RegDstE, RD1_in, RD1_out, RD2_in,
		 RD2_out, RsD, RsE, RtD, RtE, RdE, RdD, SignImmE, SignImmD);

Ex ex(ALUControlE, ALUSrcE, RegDstE, RD1_out, RD2_out, RtE, RdE, ForwardAE, 
ForwardBE, ResultW, ALUOutM, SignImmE, ALUOutE, WriteDataE, WriteRegE);

RegEx_Mem ex_mem(clk, rst, RegWriteE, RegWriteM, MemtoRegE,
		 MemtoRegM, MemWriteE, MemWriteM, ALUOutE, ALUOutM,
		 WriteDataE, WriteDataM, WriteRegE, WriteRegM);

Mem memo(clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM);

RegMem_WB mem_wb(clk, rst, RegWriteM, RegWriteW, MemtoRegM, MemtoRegW,
		 ReadDataM, ReadDataW, ALUOutM, ALUOutW, WriteRegM, WriteRegW);

WB wb(MemtoRegW, ReadDataW, ALUOutW, ResultW);

HazardUnit hazard(rst, StallF, StallD, BranchD, ForwardAD, ForwardBD, FlushE, 
		 ForwardAE, ForwardBE, MemtoRegE, RegWriteE, MemtoRegM, RegWriteM,
		 RegWriteW, RsE, RtE, RsD, RtD, WriteRegM, WriteRegW, WriteRegE);


endmodule