`timescale 100ps / 100ps

module decoder3to8___test;
reg[2:0]            test_data;
wire[7:0]           result;

decoder3to8 target
(
    .bin(test_data),
    .data(result)
);

initial 
begin
    test_data = 0;
end

always
begin
    #1 test_data = test_data + 1;
end
endmodule