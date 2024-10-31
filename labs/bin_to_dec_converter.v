//relaxation time: 10 ticks = 200ns
module bin_to_dec_converter
(
    input wire rst,
    input wire set,
    input wire clk,
    input wire[7:0] bin,
    output wire overflow,
    output wire[6:0] hight,
    output wire[6:0] low
);

reg[12:0] data; //{overflow[12], decimal digit[11:8], decimal digit[3:0]}
assign overflow = data[12];
bin_to_7seg_converter hex_l_converter(.bin(data[3:0]),  .HEX(low));
bin_to_7seg_converter hex_h_converter(.bin(data[11:8]), .HEX(hight));

always @(posedge clk)
begin
    if(rst)
        data <= 0;
    else if(set)
        data <= bin;
    else if(data[7:0] > 99)
    begin
        data[12] <= 1;
        data[7:0] <= data[7:0] - 100;
    end
    else if(data[7:0] > 9)
    begin
        data[11:8] <= data[11:8] + 1;
        data[7:0] <= data[7:0] - 10;
    end
end

endmodule