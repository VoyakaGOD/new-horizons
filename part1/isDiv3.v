module isDiv3_16b
(
    input   wire[15:0]   number,
    output  wire         divisible
);

wire [4:0] equivalent;
assign equivalent = 9   + number[0] - number[1] 
                        + number[2] - number[3] 
                        + number[4] - number[5] 
                        + number[6] - number[7] 
                        + number[8] - number[9] 
                        + number[10] - number[11] 
                        + number[12] - number[13] 
                        + number[14] - number[15];

isDiv3_5b internal
(
    .number(equivalent),
    .divisible(divisible)
);
    
endmodule

module isDiv3_5b
(
    input   wire[4:0]   number,
    output  wire        divisible
);

wire [2:0] equivalent;
assign equivalent = 3 + number[0] - number[1] + number[2] - number[3] + number[4];

isDiv3_3b internal
(
    .number(equivalent),
    .divisible(divisible)
);
    
endmodule

module isDiv3_3b
(
    input   wire[2:0]   number,
    output  wire        divisible
);

assign divisible = ((number == 3'd3) | (number == 3'd6)) ? 1'b1 : 1'b0;
    
endmodule