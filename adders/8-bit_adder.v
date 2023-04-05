`timescale 1ns/1ps

module full_addr(
    input a, b, c_in,
    output sum, c_out);

    wire n1, n2, n3;

    xor (n1, a,b);
    xor (sum, n1,c_in);
    and (n2, n1,c_in);
    and (n3, a,b);
    or (c_out, n2,n3);
endmodule


module bit8_8fulAdders(a, b, c_in, sum, c_cout);

    input [7:0] a;
    input [7:0] b;
    input c_in;
    output [7:0] sum;
    output c_cout;

    wire [6:0] carry;

    full_addr FA_0(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_1(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_2(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_3(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_4(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_5(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_6(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));
        
    full_addr FA_7(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_8(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

endmodule