`timescale 1ns/1ps

module d_flipflop(D, clk, Q, Q_bar);

    input D, clk;
    output Q, Q_bar;

    wire n1, n2, n3, Q_bar_n;
    wire dn, cn, n4, n5, n6;

    // first latch

    not (n1, d);

    nand(n3, n1,clk);
    nand(n2, d, clk);

    nand(dn, n2,Q_bar_n);
    nand(Q_bar_n, n3, dn);

    // second latch

    not (cn, clk);
    not (n4, dn);

    nand(n5, n4, cn);
    nand(n6, n4, cn);

    nand(Q, n5, Q_bar);
    nand(Q_bar, n6, Q);

endmodule