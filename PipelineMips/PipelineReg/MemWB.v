module RegMem_WB(clk, rst, RegWriteM, RegWriteW, MemtoRegM, MemtoRegW,
		 ReadDataM, ReadDataW, ALUOutM, ALUOutW, WriteRegM, WriteRegW);
		 
  input clk, rst, RegWriteM, MemtoRegM;
  input [31:0] ReadDataM, ALUOutM;
  input [4:0] WriteRegM;

  output reg RegWriteW, MemtoRegW;
  output reg [31:0] ReadDataW, ALUOutW;
  output reg [4:0] WriteRegW;

  always @ (posedge clk or negedge rst) 
  begin
    if (!rst) 
	 begin
      RegWriteW <= 0;
		MemtoRegW <= 0;
		ReadDataW <= 0;
		ALUOutW <= 0;
		WriteRegW <= 0;
    end
    else 
	 begin
	   WriteRegW <= WriteRegM;
      RegWriteW <= RegWriteM;
		MemtoRegW <= MemtoRegM;
		ReadDataW <= ReadDataM;
		ALUOutW <= ALUOutM;
    end
  end
endmodule


