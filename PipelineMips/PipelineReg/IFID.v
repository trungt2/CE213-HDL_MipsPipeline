module RegFe_De(clk, rst, StallD, Flush, Ins_i, Ins_o, PC_i, PC_o);
input clk, rst, StallD, Flush;
input [31:0] Ins_i, PC_i;
input Flush;

output reg [31:0] PC_o, Ins_o;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        Ins_o <= 32'd0;
        PC_o <= 32'd0;
    end
    else if(!StallD) begin
        if(!Flush) begin
        Ins_o <= Ins_i;
        PC_o <= PC_i;
        end else begin
            Ins_o <= 32'd0;
            PC_o <= 32'd0;
        end
    end
end

initial begin
  Ins_o = 32'd0;
  PC_o = 32'd0;
  end
endmodule