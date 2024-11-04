module tb_cpu;
reg clk, rst;

always #10 clk = ~clk;

cpu dut(clk, rst);
initial begin
clk = 0;
rst = 1;

#2 rst = 0;
#1 rst = 1;
#20000 $stop;

end





endmodule