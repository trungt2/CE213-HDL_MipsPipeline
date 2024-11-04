module control(opcode, inst,
RegDst, MemWrite, MemToReg, 
ALUcontrol, ALUSrc, RegWrite, Branch, Jump, stall);

input [5:0] opcode, inst;
input stall;
output RegDst, MemWrite, MemToReg, ALUSrc, RegWrite, Branch, Jump;
output [3:0] ALUcontrol;

parameter R = 6'h00;
parameter lw = 6'h23;
parameter sw = 6'h2b;
parameter beq = 6'h04;
parameter addi = 6'h08;
parameter bne = 6'h05;
parameter J  = 6'h02;

wire [9:0] c;
assign c = 
            (opcode == R) ? 10'h122 :
            (opcode == lw) ? 10'h0f0 :
            (opcode == sw) ? 10'h1c8 :
            (opcode == beq) ? 10'h005 :
            (opcode == bne) ? 10'h004 :
            (opcode == addi) ? 10'h0a0 : 
            (opcode == J) ? 10'h200 : 10'd0 ; 
            
/*always @(*) begin
  if(!stall) begin
    case(opcode) 
      R: c =  10'h122;
      lw: c = 10'h0f0;
      sw: c = 10'h1c8;
      beq: c = 10'h005;
      bne: c = 10'h004;
      addi: c = 10'h0a0;
      J: c = 10'h200;
      default: c = 10'd0;
    endcase
  
end */

assign Jump = c[9];
assign RegDst = c[8];
assign ALUSrc = c[7];
assign MemToReg = c[6];
assign RegWrite = c[5];
assign MemWrite = c[3];
assign Branch = c[2];

wire [1:0] alu_control;
assign alu_control = c[1:0];

wire Rtype;
assign Rtype = (alu_control == 2'b10) ? 1'b1: 1'b0;

wire lww; // lw, sw, addi
assign lww = (alu_control == 2'b00) ? 1'b1: 1'b0;

parameter [5:0] And = 6'h24;
parameter [5:0] Add = 6'h20;
parameter [5:0] Sub = 6'h22;
parameter [5:0] Or = 6'h25;
parameter [5:0] Slt = 6'h2a;
parameter [5:0] Sll = 6'h00;
parameter [5:0] Srl = 6'h02;

assign ALUcontrol = lww ? 4'b0010:
                 (alu_control == 2'b01) ? 4'b0110: 
						    	(Rtype && inst == Add) ? 4'b0010:
						     (Rtype && inst == Sub) ? 4'b0110:
						     (Rtype && inst == And) ? 4'b0000:
						     (Rtype && inst == Or) ? 4'b0001:
						     (Rtype && inst == Slt) ? 4'b0111: 
						     (Rtype && inst == Sll) ? 4'b0100:
						     (Rtype && inst == Srl) ? 4'b0111: 4'b1111; 
						


endmodule



