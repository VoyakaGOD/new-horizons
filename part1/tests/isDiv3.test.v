`timescale 100ps / 100ps

module isDiv3_16b___test;
reg[15:0]           test_data;
wire                result;

isDiv3_16b target
(
    .number(test_data),
    .divisible(result)
);

initial 
begin
    test_data = 0;
end

always
begin
    #1 test_data = $random;
end
endmodule