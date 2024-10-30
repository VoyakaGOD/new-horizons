module shift_register
(
    input wire KEY0,        //@{KEY0}
    input wire KEY1,        //@{KEY1}
    input wire KEY2,        //@{KEY2}
    input wire clk,         //@{CLK}
    input wire l_switch,    //@{SW0}
    input wire r_switch,    //@{SW1}
    output reg[7:0] LEDR    //@{LEDR7_0}
);

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
        LEDR <= 0;
    else if(inc)
        LEDR <= {LEDR[6:0], l_switch};
    else if(dec)
        LEDR <= {r_switch, LEDR[7:1]};
end

endmodule
