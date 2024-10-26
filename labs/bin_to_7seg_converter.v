module bin_to_7seg_converter
(
    input   wire[3:0] bin,
    output  wire[6:0] HEX
);

assign HEX  =   (bin == 4'h0) ? 7'b1000000 :      // 0
                (bin == 4'h1) ? 7'b1111001 :      // 1
                (bin == 4'h2) ? 7'b0100100 :      // 2
                (bin == 4'h3) ? 7'b0110000 :      // 3
                (bin == 4'h4) ? 7'b0011001 :      // 4
                (bin == 4'h5) ? 7'b0010010 :      // 5
                (bin == 4'h6) ? 7'b0000010 :      // 6
                (bin == 4'h7) ? 7'b1111000 :      // 7
                (bin == 4'h8) ? 7'b0000000 :      // 8
                (bin == 4'h9) ? 7'b0010000 :      // 9
                (bin == 4'hA) ? 7'b0001000 :      // A
                (bin == 4'hB) ? 7'b0000011 :      // B
                (bin == 4'hC) ? 7'b1000110 :      // C
                (bin == 4'hD) ? 7'b0100001 :      // D
                (bin == 4'hE) ? 7'b0000110 :      // E
                (bin == 4'hF) ? 7'b0001110 :      // F
                7'b1111111;                       // empty

endmodule