module adder
(
    input wire KEY0,    //reset @{KEY0}
    input wire KEY1,    //add   @{KEY1}
    input wire clk,           //@{CLK}
    input wire[7:0] sw7_0,    //@{SW7_0}
    input wire[7:0] sw16_9,   //@{SW16_9}
    output wire[6:0] HEX2,    //@{HEX2}
    output wire[6:0] HEX3,    //@{HEX3}
    output wire[6:0] HEX4,    //@{HEX4}
    output wire[6:0] HEX5,    //@{HEX5}
    output wire[6:0] HEX6,    //@{HEX6}
    output wire[6:0] HEX7,    //@{HEX7}
    output reg overflow       //@{LEDG8}
);

reg rst;
reg add_r, add_rp;
wire add;
reg[7:0] sum;
reg[7:0] switches1;
reg[7:0] switches2;

always @(posedge clk)
begin
    rst <= ~KEY0;
    add_r <= KEY1;
    add_rp <= add_r;
    switches1 <= sw7_0;
    switches2 <= sw16_9;
end

assign add = (~add_r) & add_rp;
bin_to_7seg_converter hex2c(.bin(sum[3:0]),         .HEX(HEX2));
bin_to_7seg_converter hex3c(.bin(sum[7:4]),         .HEX(HEX3));
bin_to_7seg_converter hex4c(.bin(switches1[3:0]),   .HEX(HEX4));
bin_to_7seg_converter hex5c(.bin(switches1[7:4]),   .HEX(HEX5));
bin_to_7seg_converter hex6c(.bin(switches2[3:0]),   .HEX(HEX6));
bin_to_7seg_converter hex7c(.bin(switches2[7:4]),   .HEX(HEX7));

always @(posedge clk)
begin
    if (rst)
        {overflow, sum} <= 0;
    else if(add)
        {overflow, sum} <= switches1 + switches2;
end

endmodule
