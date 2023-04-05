`timescale 1ns/1ps

module ALU( s, A, B, F);

    input [2:0] s;
    input [3:0] A, B;

    output [3:0] F;

    reg [3:0] F;

    always @ (s or A or B)
        begin
            case (s)
                3'b000: F = A + B;
                3'b001: F = A - B;
                3'b010: F = A & B;
                3'b011: F = A | B;
                3'b100: F = A ^ B;
                3'b101: F = ~A;
                3'b110: F = ~B;
                3'b111: F = 4'b0000;
            endcase
        end
endmodule