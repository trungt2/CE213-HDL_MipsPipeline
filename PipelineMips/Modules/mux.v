module mux2_32bits(i1, i2, s, o);
input [31:0] i1, i2;
input s;

output [31:0] o;

assign o = s ? i2: i1;

endmodule

module mux3_32bits(i1, i2, i3, s, o);
input [31:0] i1, i2, i3;
input [1:0] s;

output [31:0] o;

assign o = (s == 2'd0) ? i1 :
            (s == 2'd1) ? i2: 
            (s == 2'd2) ? i3: 32'd0;
            
endmodule