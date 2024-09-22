`timescale 100ps / 100ps

module priorityEncoder8to3___test;
reg[7:0]            test_data;
wire[2:0]           result;
wire                empty;

priorityEncoder8to3 target
(
    .data(test_data),
    .bin(result),
    .empty(empty)
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