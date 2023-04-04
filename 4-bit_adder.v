`timescale 1ns/1ps


// half adder
// module half_addr (a,b, c, s);

//     input a, b;
//     output c, s;

//     wire a,b, c,s;

//     assign s = a ^ b;
//     assign c = a & b;

// endmodule


// // full adder
// module full_addr(x,y,z, c,s);

//     input x,y,z;
//     output c,s;

//     wire x,y,z,c,s;
//     wire i1,i2,i3;

//     half_addr ha1(x,y, i1, i2);
//     half_addr ha2(i1,z, i3, s);

//     assign c = i2 || i3;

// endmodule


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


// 4-bit adder using 4 full adders

module bit4_4fullAdders (
    input [3:0] a, b,
    input c_in,
    output [3:0] sum,
    output c_out);

    `ifdef NO_GATES
        wire [4:0] sum_4;
        assign sum_4 = a + b + c_in;
        assign sum = sum_4[3:0];
        assign c_out = sum_4[4];
    `else
        wire [2:0] carry;

    full_addr FA_0(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(carry[0]));

    full_addr FA_1(
        .a(a[1]),
        .b(b[1]),
        .c_in(carry[0]),
        .sum(sum[1]),
        .c_out(carry[1]));

    full_addr FA_2(
        .a(a[2]),
        .b(b[2]),
        .c_in(carry[1]),
        .sum(sum[2]),
        .c_out(carry[2]));
    
    full_addr FA_3(
        .a(a[3]),
        .b(b[3]),
        .c_in(carry[2]),
        .sum(sum[3]),
        .c_out(c_out)); 
    `endif
endmodule



