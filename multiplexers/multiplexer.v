`timescale 1ns/1ps


module multiplexer( D, select, Y);

input [1:0] select;
input [3:0] D;
output Y;

wire [1:0] select;
wire [3:0] D;
wire Y;

assign Y = D[select];

endmodule