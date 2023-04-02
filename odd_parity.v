`timescale 1ns/1ps

module odd_parity (
    data_in,        // 8-bit input
    parity          // 1-bit output
    );

input [7:0] data_in;
output parity;

wire parity;        //1-bit wire for parity

// XOR operation is applied on parity assignment
assign parity = (data_in[0] ^ data_in[1]) ^ (data_in[2] ^ data_in[3]) ^ (data_in[4] ^ data_in[5]) ^ (data_in[6] ^ data_in[7]);

endmodule