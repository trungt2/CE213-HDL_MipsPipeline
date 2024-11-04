module imem(A, RD);
input [31:0] A;

output [31:0] RD;

reg [31:0] mem [0:1024];

initial begin
    $readmemh("memfile.txt", mem);
end

assign RD = mem[A[31:2]];

endmodule
