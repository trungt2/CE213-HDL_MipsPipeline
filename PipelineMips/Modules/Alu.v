module Alu(ALUcontrol, opA, opB, ALUresult);
input [3:0] ALUcontrol;
input [31:0] opA, opB;

output [31:0] ALUresult;

 wire [31:0] ss;
  assign ss = (opA<opB) ? 32'd1: 32'd0;
  
  assign ALUresult = (ALUcontrol == 4'b0010) ? (opA+opB):
						(ALUcontrol == 4'b0110) ? (opA-opB):
						(ALUcontrol == 4'b0000) ? (opA&opB):
						(ALUcontrol == 4'b0001) ?  (opA|opB): 
						(ALUcontrol == 4'b0111) ? ss : 
						(ALUcontrol == 4'b0100) ? opA << opB[10:6]:
						(ALUcontrol == 4'b0111) ? opA >> opB[10:6]: 32'd0;
  
endmodule 