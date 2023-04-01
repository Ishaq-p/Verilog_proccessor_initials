`timescale 1ns/1ps

module D_flipflop( D, CLK, Q);
input D, CLK;
output Q;
reg Q;
always @(posedge CLK)
if (CLK)
Q=D;

endmodule