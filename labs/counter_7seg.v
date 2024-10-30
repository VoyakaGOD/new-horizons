module counter_7seg
(
    input wire KEY0,        //@{KEY0}
    input wire KEY1,        //@{KEY1}
    input wire KEY2,        //@{KEY2}
    input wire clk,         //@{CLK}
    output wire[6:0] HEX0   //@{HEX0}
);

reg[3:0] data;
reg rst;
reg inc_r, inc_rp;
reg dec_r, dec_rp;
wire inc, dec;

always @(posedge clk)
begin
    rst <= ~KEY0;
    inc_r <= KEY1;
    inc_rp <= inc_r;
    dec_r <= KEY2;
    dec_rp <= dec_r;
end

assign inc = (~inc_r) & inc_rp;
assign dec = (~dec_r) & dec_rp;

bin_to_7seg_converter hex_converter(.bin(data), .HEX(HEX0));

always @(posedge clk)
begin
    if (rst)
        data <= 0;
    else if(inc)
        data <= data + 1;
    else if(dec)
        data <= data - 1;
end

endmodule
