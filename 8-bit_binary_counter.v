`timescale 1ns/1ps


module b_counter( 
    clk,        // clock
    reset,      // will reset the counter to 0
    enable,     // will increment the counter
    counter_out // 8-bit output
    );

input clk, reset, enable;   //one-bit inputs
output [7:0] counter_out;   //8-bit output

reg [7:0] counter_out;      //8-bit register for output


always @ (posedge clk)      
begin       
    if (reset) begin
        counter_out <= 8'b0;        // reset counter to 0 whenever reset is high
    end else if (enable) begin      // increment counter by 1 whenever enable is high
        counter_out <= counter_out + 1;
    end
end
endmodule