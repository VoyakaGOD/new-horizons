module two_digit_number
#(
    parameter HIGH_DIGIT_MAX_VALUE = 5,
    parameter LOW_DIGIT_MAX_VALUE = 9,
    parameter LAST_LOW_DIGIT_MAX_VALUE = 9
)
(
    input wire clk,
    input wire rst,
    input wire incr,
    output wire[7:0] high_display,
    output wire[7:0] low_display,
    output reg next
);

reg[3:0] high;
reg[3:0] low;

bin_to_7seg_converter high_converter(   .bin(high), .HEX(high_display)  );
bin_to_7seg_converter low_converter(    .bin(low),  .HEX(low_display)   );

always @(posedge clk)
begin
    if(rst)
        {high, low, next} <= 0;
    else if(incr)
    begin
        if((low == LAST_LOW_DIGIT_MAX_VALUE) & (high == HIGH_DIGIT_MAX_VALUE))
        begin
            next <= 1;
            {high, low} <= 0;
        end
        else
        begin
            high <= (low == LOW_DIGIT_MAX_VALUE) ? ((high < HIGH_DIGIT_MAX_VALUE) ? (high + 1) : 0) : high;
            low <= (low < LOW_DIGIT_MAX_VALUE) ? (low + 1) : 0;
        end
    end
    else
        next <= 0;
end

endmodule