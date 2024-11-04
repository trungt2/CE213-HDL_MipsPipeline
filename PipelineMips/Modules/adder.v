module adder(i1, i2, o);
input [31:0] i1, i2;

output [31:0] o;

assign o = i1 + i2;

endmodule