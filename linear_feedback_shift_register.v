`timescale 1ns/1ps


module linear_feedback_shift_register (
    clk,        // clock
    reset,      // will reset the out to 0
    enable,     // will shift the out
    data_in,    // 8-bit input
    out         // 8-bit output
    );

input clk, reset, enable;   //one-bit inputs
input [7:0] data_in;        //8-bit input
output [7:0] out;           //8-bit output

reg [7:0] out;              //8-bit register for output

wire feedback;              //feedback wire

assign feedback = !(out[7] ^ out[3]);       //feedback is the XNOR of the 7th and 3rd bit

always @(posedge clk)begin                  
    if (reset) begin                        //reset out to 0 whenever reset is high
        out <= 8'b0;
    end else if (enable) begin              //shift out by 1 whenever enable is high
        out <= {out[6:0], feedback};
    end
end
endmodule
