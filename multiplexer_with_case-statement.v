`timescale 1ns/1ps


module multiplexer_with_case (
    input_1,    // mux inputs
    input_2,    // mux inputs
    select,     // mux select
    out         // mux output
    );

input input_1, input_2, select; 
output out; 
reg out;

always @(input_1 or input_2 or select) 
    begin: MUX
        case (select)                                // case statement
            2'b0: out = input_1;                    // if select is 0, input_1 will connect to the output
            2'b1: out = input_2;                   // if select is 1, input_2 will connect to the output
        endcase
    end
endmodule