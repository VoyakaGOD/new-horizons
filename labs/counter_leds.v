module counter_leds
(
    input wire KEY0,        //@{KEY0}
    input wire KEY1,        //@{KEY1}
    input wire KEY2,        //@{KEY2}
    input wire clk,         //@{CLK}
    output wire[6:0] LEDR   //@{LEDR6_0}
);

reg[2:0] data;
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

always @(posedge clk)
begin
    if (rst)
        data <= 0;
    else if(inc)
        data <= data + 1;
    else if(dec)
        data <= data - 1;
end

assign LEDR = ~(7'b1111111 << data);

endmodule
