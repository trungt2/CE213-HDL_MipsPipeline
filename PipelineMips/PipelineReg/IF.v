module RegFe(clk, rst, StallF, PC, PCF);
input clk, rst, StallF;
input [31:0] PC;

output reg [31:0] PCF;

always @(posedge clk or negedge rst) begin
    if(!rst) begin

    end else if (!StallF)
        PCF <= PC;
end

initial begin
    PCF = 32'd0;
end
endmodule