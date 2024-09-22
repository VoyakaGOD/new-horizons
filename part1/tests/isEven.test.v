`timescale 100ps / 100ps

module isEven___test;
reg[7:0]    test_data;
wire        result;

isEven target
(
    .number(test_data), 
    .result(result)
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