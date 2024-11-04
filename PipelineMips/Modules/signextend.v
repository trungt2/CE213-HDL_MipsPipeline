module signextend (i, o);
    input [15:0] i;

    output [31:0] o;

    assign o = i[15] ? {16'hffff, i}: {16'd0, i};
endmodule