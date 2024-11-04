module WB(MemToRegW, ReadDataW, ALUOutW, ResultW);
input MemToRegW;
input [31:0] ReadDataW, ALUOutW;

output [31:0] ResultW;

mux2_32bits mux6(ALUOutW, ReadDataW, MemToRegW, ResultW);

endmodule