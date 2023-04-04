`timescale 1ns/1ps

module sp_ram_sync_rw(
    clk,        // clock
    address,    // memory address
    we,         // write/read enable
    oe,         // output enable
    data,       
    cs          // chip select
    );

    parameter DATA_WIDTH = 8;               // the width of the data bus
    parameter ADDR_WIDTH = 8;               // the width of the address bus
    parameter MEM_DEPTH = 1 << ADDR_WIDTH;  // the depth of the memory = 8bit

    input clk;                              // the clock
    input [ADDR_WIDTH-1:0] address;         // the address 8bit
    input we;                               // write enable
    input oe;                               // output enable
    input cs;                               // chip select

    inout [DATA_WIDTH-1:0] data;            // the data bus

    reg [DATA_WIDTH-1:0] data_out;          // the data output 8bit
    reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];   // the memory 8x8bit
    // reg oe_r;                                   // the output enable register

    assign data = (cs && oe && !we) ? data_out : 8'bz;  // the data bus; if True, data_out, else 8'bz

    always @ (posedge clk) 
    begin : MEM_WRITE
        if (cs && we)                       // if chip select and write enable are high
        begin                               // write the data to the memory
            mem[address] = data;
        end
    end

    always @ (posedge clk)
    begin : MEM_READ
        if (cs && oe && !we)                // if chip select and output enable are high and write enable is low
        begin                               // read the data from the memory
            data_out = mem[address];
        end
    end 

endmodule