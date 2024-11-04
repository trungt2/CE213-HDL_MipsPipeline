module Mem(clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM);
input clk, MemWriteM;
input [31:0] ALUOutM, WriteDataM;

output [31:0] ReadDataM;

dmem dmem(clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM);

endmodule