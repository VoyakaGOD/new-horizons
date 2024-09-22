`timescale 100ps / 100ps

module log2___test;
reg[7:0]            test_data;
wire[2:0]           result;

log2 target
(
    .value(test_data),
    .power(result)
);

initial 
begin
    test_data = 1;
end

always
begin
    #1 test_data = test_data << 1;
    if(test_data == 0)
        test_data = 1;
end
endmodule