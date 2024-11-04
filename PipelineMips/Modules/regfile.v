module regfile(clk, rst, A1, A2, A3, WD, RegWrite, RD1, RD2);
input clk, rst, RegWrite;
input [4:0] A1, A2, A3;
input [31:0] WD;

output [31:0] RD1, RD2;

reg [31:0] mem[0:31];
integer i;

assign RD1 = mem[A1];
assign RD2 = mem[A2];

always @(posedge clk or negedge rst) begin
    if (!rst) 
        for(i = 0; i<32; i = i+1) 
            mem[i] <= 32'd0;
    else if(RegWrite)
        mem[A3] <= WD;
end

initial begin
for(i = 0; i < 32; i= i +1) begin
    mem[i] = 32'd0;
end

end


endmodule 
