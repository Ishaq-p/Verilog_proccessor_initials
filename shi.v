`timescale 1ns/1ps

module SPSR(
        clk,
        we,
        oe,
        cs,
        address,
        data);

    parameter data_width = 16;
    parameter addr_width = 16;
    parameter mem_depth = 1 << addr_width;

    input clk;
    input we;
    input oe;
    input cs;
    input [addr_width-1:0] address;

    inout [data_width-1:0] data;

    reg [data_width-1:0] data_out;
    reg [data_width-1:0] mem [0:mem_depth-1];
    reg oe_r;                                   

    assign data = (cs && oe && !we) ? data_out : 16'bz;

    always @ (posedge clk)
        begin : mem_write
            if (cs && we)
                begin
                    mem[address] = data;
                end 
        end

    always @ (posedge clk)
        begin : mem_read
            if (cs && oe && !we)
                begin
                    data_out = mem[address];
                end
        end

endmodule