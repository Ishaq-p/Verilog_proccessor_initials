`timescale 1ns/1ps

module encoder( 
    encoder_in,         // 16-bit input
    encoder_out,        // 4-bit binary output
    enable              // enable signal
    );

output [3:0] encoder_out;
input enable;
input [15:0] encoder_in;

reg [3:0] encoder_out;

always @ (encoder_in or enable)
begin
  encoder_out = 0;
  if (enable) begin

        if (encoder_in == 16'h0002) begin
            encoder_out = 1;
        end if (encoder_in == 16'h0004) begin
            encoder_out = 2;
        end if (encoder_in == 16'h0008) begin
            encoder_out = 3;
        end if (encoder_in == 16'h0010) begin
            encoder_out = 4;
        end if (encoder_in == 16'h0020) begin
            encoder_out = 5;
        end if (encoder_in == 16'h0040) begin
            encoder_out = 6;
        end if (encoder_in == 16'h0080) begin
            encoder_out = 7;
        end if (encoder_in == 16'h0100) begin
            encoder_out = 8;
        end if (encoder_in == 16'h0200) begin
            encoder_out = 9;
        end if (encoder_in == 16'h0400) begin
            encoder_out = 10;
        end if (encoder_in == 16'h0800) begin
            encoder_out = 11;
        end if (encoder_in == 16'h1000) begin
            encoder_out = 12;
        end if (encoder_in == 16'h2000) begin
            encoder_out = 13;
        end if (encoder_in == 16'h4000) begin
            encoder_out = 14;
        end if (encoder_in == 16'h8000) begin
            encoder_out = 15;
        end
    end
end
endmodule