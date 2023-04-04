`timescale 1ns/1ps

module half_addr (a,b, c, s);

    input a, b;
    output c, s;

    wire a,b, c,s;

    assign s = a ^ b;
    assign c = a & b;

endmodule


module full_addr(x,y,z, c,s);

    input x,y,z;
    output c,s;

    wire x,y,z,c,s;
    wire i1,i2,i3;

    half_addr ha1(x,y, i1, i2);
    half_addr ha2(i1,z, i3, s);

    assign c = i2 || i3;

endmodule

