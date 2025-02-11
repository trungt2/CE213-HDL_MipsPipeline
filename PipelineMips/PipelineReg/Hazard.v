module HazardUnit(rst, StallFi, StallDi, BranchDi, ForwardADi, ForwardBDi, FlushEi, 
		 ForwardAEi, ForwardBEi, MemtoRegEi, RegWriteEi, MemtoRegMi, RegWriteMi,
		 RegWriteWi, RsEi, RtEi, RsDi, RtDi, WriteRegMi, WriteRegWi, WriteRegEi);

  input rst, BranchDi, MemtoRegEi, RegWriteEi, MemtoRegMi, RegWriteMi, RegWriteWi;
  input [4:0] RsEi, RtEi, RsDi, RtDi, WriteRegMi, WriteRegWi, WriteRegEi;
  
  output StallFi, StallDi, FlushEi;
  output [1:0] ForwardAEi, ForwardBEi, ForwardADi, ForwardBDi;

  wire lwstall, branchstall;
  reg BranchD, MemtoRegE, RegWriteE, MemtoRegM, RegWriteM, RegWriteW;
  reg [4:0] RsE, RtE, RsD, RtD, WriteRegM, WriteRegW, WriteRegE;
  always @(*) begin
    BranchD <= BranchDi;
    MemtoRegE <= MemtoRegEi;
    RegWriteE <= RegWriteEi;
    MemtoRegM <= MemtoRegMi;
    RegWriteM <= RegWriteMi;
    RegWriteW <= RegWriteWi;
    RsE <= RsEi;
    RtE <= RtEi;
    RsD <= RsDi;
    RtD <= RtDi;
    WriteRegM <= WriteRegMi;
    WriteRegW <= WriteRegWi;
    WriteRegE <= WriteRegEi;


  end
  assign ForwardAEi = ((RsE!=0)&&(RsE==WriteRegM)&&(RegWriteM))? 2'b10:
							((RsE!=0)&&(RsE==WriteRegW)&&(RegWriteW))? 2'b01: 2'b00;
							
  assign ForwardBEi = ((RtE!=0)&&(RtE==WriteRegM)&&(RegWriteM))? 2'b10:
							((RtE!=0)&&(RtE==WriteRegW)&&(RegWriteW))? 2'b01: 2'b00;
							
  assign branchstall = (BranchD && RegWriteE &&((WriteRegE==RsD)|| (WriteRegE==RtD)) )||
							  (BranchD && MemtoRegM &&((WriteRegM==RsD)||(WriteRegM==RtD)));
							
  assign ForwardADi = ((RsD!=0)&&(RsD==WriteRegM)&&RegWriteM) ? 2'b01:
                      ((RsD!=0)&&(RsD==WriteRegW)&&RegWriteW) ? 2'b10: 2'b00;

  assign ForwardBDi = ((RtD!=0)&&(RtD==WriteRegM)&&RegWriteM) ? 2'b01:
                      ((RtD!=0)&&(RtD==WriteRegW)&&RegWriteW) ? 2'b10: 2'b00;

  assign lwstall = ((RsD==RtE)||(RtD==RtE))&& MemtoRegE;
  assign StallFi = (!rst) ? 1'b0: (lwstall || branchstall);
  assign StallDi = (!rst) ? 1'b0: lwstall || branchstall;
  assign FlushEi = (!rst) ? 1'b0: lwstall || branchstall;
  
  initial begin
    BranchD = 0;
    MemtoRegE = 0;
    RegWriteE = 0;
    MemtoRegM = 0;
    RegWriteM = 0;
    RegWriteW = 0;
    RsE = 0;
    RtD = 0;
    WriteRegM = 0;
    WriteRegW = 0;
    RtE = 0;
    RsD = 0;
    WriteRegE = 0;
  end
 
endmodule
