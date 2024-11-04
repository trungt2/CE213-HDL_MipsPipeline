module dmem(clk, MemWrite, A, WD, RD);
input clk, MemWrite;
input [31:0] A;
input [31:0] WD;

output [31:0] RD;

reg [31:0] mem [0:1023];

assign RD = mem[A[31:2]];

always @(posedge clk) begin
    if (MemWrite)
        mem[A[31:2]] <= WD;
end

integer i;
initial begin
for(i = 0; i< 1024; i = i +1) begin
  mem[i] = 32'd0;
  end
  end
endmodule