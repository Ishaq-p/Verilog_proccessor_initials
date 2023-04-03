`timescale 1ns/1ps

module dp_ram_sync_rw(
    address0,
    address1,    // memory address

    we0,
    we1,         // write/read enable

    oe0,
    oe1,        // output enable

    data0,
    data1,       

    cs0,
    cs1          // chip select
    );

    parameter DATA_WIDTH = 8;               // the width of the data bus
    parameter ADDR_WIDTH = 8;               // the width of the address bus
    parameter MEM_DEPTH = 1 << ADDR_WIDTH;  // the depth of the memory = 8bit

    input [ADDR_WIDTH-1:0] address0;         // the address 8bit
    input we0;                               // write enable
    input oe0;                               // output enable
    input cs0;                               // chip select
    input [ADDR_WIDTH-1:0] address1;         // the address 8bit
    input we1;                               // write enable
    input oe1;                               // output enable
    input cs1;                               // chip select

    inout [DATA_WIDTH-1:0] data0;            // the data bus
    inout [DATA_WIDTH-1:0] data1;            // the data bus


    reg [DATA_WIDTH-1:0] data_out0;          // the data output 8bit
    reg [DATA_WIDTH-1:0] data_out1;
    reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];   // the memory 8x8bit



    always @ (address0 or cs0 or we0 or oe0 or data0 or address1 or cs1 or we1 or oe1 or data1)) 
    begin : MEM_WRITE
        if (cs0 && we0)                       // if chip select and write enable are high
        begin                               // write the data to the memory
            mem[address] <= data0;

        end else if  (cs1 && we1)                       // if chip select and write enable are high
        begin                               // write the data to the memory
            mem[address] <= data1;
        end
    end


    assign data0 = (cs0 && oe0 && !we0) ? data_out0 : 8'bz;  // the data bus; if True, data_out, else 8'bz

    always @ (address0 or cs0 or we0 or oe0)
        begin : MEM_READ_0
            if (cs0 && oe0 && !we0)                // if chip select and output enable are high and write enable is low
            begin                               // read the data from the memory
                data_out0 <= mem[address0];
            end else begin
                data_out0 <= 0;
            end


    assign data1 = (cs1 && oe1 && !we1) ? data_out1 : 8'bz;  // the data bus; if True, data_out, else 8'bz

    always @ (address1 or cs1 or we1 or oe1)
        begin : MEM_READ_1
            if (cs1 && oe1 && !we1)                // if chip select and output enable are high and write enable is low
            begin                               // read the data from the memory
                data_out1 <= mem[address1];
            end else begin
                data_out1 <= 0;
            end
    end

endmodule