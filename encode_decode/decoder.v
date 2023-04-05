`timescale 1ns/1ps

module decoder_with_if( 
    decoder_in,         // 4-bit binary input
    decoder_out,        // 16-bit output
    enable              // enable signal
    );

input [3:0] decoder_in;
input enable;
output [15:0] decoder_out;

reg [15:0] decoder_out;

always @ (decoder_in or enable)
begin
    decoder_out = 0;
    if (enable) begin

        if (decoder_in == 4'b0001) begin
            decoder_out = 16'h0001;
        end if (decoder_in == 4'b0010) begin
            decoder_out = 16'h0002;
        end if (decoder_in == 4'b0100) begin
            decoder_out = 16'h0004;
        end if (decoder_in == 4'b1000) begin
            decoder_out = 16'h0008;
        end if (decoder_in == 4'b0001) begin
            decoder_out = 16'h0010;
        end if (decoder_in == 4'b0010) begin
            decoder_out = 16'h0020;
        end if (decoder_in == 4'b0100) begin
            decoder_out = 16'h0040;
        end if (decoder_in == 4'b1000) begin
            decoder_out = 16'h0080;
        end if (decoder_in == 4'b0001) begin
            decoder_out = 16'h0100;
        end if (decoder_in == 4'b0010) begin
            decoder_out = 16'h0200;
        end if (decoder_in == 4'b0100) begin
            decoder_out = 16'h0400;
        end if (decoder_in == 4'b1000) begin
            decoder_out = 16'h0800;
        end if (decoder_in == 4'b0001) begin
            decoder_out = 16'h1000;
        end if (decoder_in == 4'b0010) begin
            decoder_out = 16'h2000;
        end if (decoder_in == 4'b0100) begin
            decoder_out = 16'h4000;
        end if (decoder_in == 4'b1000) begin
            decoder_out = 16'h8000;
        end
    end
end
endmodule




`timescale 1ns/1ps
module decoder_with_case( 
    binary_in,         // 4-bit binary input
    decoder_out,        // 16-bit output
    enable              // enable signal
    );

input [3:0] binary_in;
input enable;
output [15:0] decoder_out;

reg [15:0] decoder_out;

always @ (binary_in or enable)
begin
    decoder_out = 0;
    if (enable) begin
        case (binary_in)
            4'h0 : decoder_out = 16'h0001;
            4'h1 : decoder_out = 16'h0002;
            4'h2 : decoder_out = 16'h0004;
            4'h3 : decoder_out = 16'h0008;
            4'h4 : decoder_out = 16'h0010;
            4'h5 : decoder_out = 16'h0020;
            4'h6 : decoder_out = 16'h0040;
            4'h7 : decoder_out = 16'h0080;
            4'h8 : decoder_out = 16'h0100;
            4'h9 : decoder_out = 16'h0200;
            4'ha : decoder_out = 16'h0400;
            4'hb : decoder_out = 16'h0800;
            4'hc : decoder_out = 16'h1000;
            4'hd : decoder_out = 16'h2000;
            4'he : decoder_out = 16'h4000;
            4'hf : decoder_out = 16'h8000;
        endcase
    end
end
endmodule