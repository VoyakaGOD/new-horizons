module bin_dec_hex
(
    input wire KEY0,//reset     @{KEY0}
    input wire KEY1,//translate @{KEY1}
    input wire clk,           //@{CLK}
    input wire[6:0] switches, //@{SW7_0}
    output reg[6:0] bin,      //@{LEDR7_0}
    output wire[6:0] hex_h,   //@{HEX5}
    output wire[6:0] hex_l,   //@{HEX4}
    output wire[6:0] dec_h,   //@{HEX7}
    output wire[6:0] dec_l,   //@{HEX6}
    output wire overflow      //@{LEDG8}
);

reg rst;
reg tr_r, tr_rp;
wire tr;
reg[7:0] displayed_hex_value;

always @(posedge clk)
begin
    rst <= ~KEY0;
    tr_r <= KEY1;
    tr_rp <= tr_r;
    bin <= switches;
end

assign tr = (~tr_r) & tr_rp;
bin_to_7seg_converter hex_l_converter(.bin(displayed_hex_value[3:0]), .HEX(hex_l));
bin_to_7seg_converter hex_h_converter(.bin(displayed_hex_value[7:4]), .HEX(hex_h));
bin_to_dec_converter(   .rst(rst), 
                        .set(tr), 
                        .clk(clk), 
                        .bin(bin), 
                        .overflow(overflow), 
                        .hight(dec_h),
                        .low(dec_l));

always @(posedge clk)
begin
    if(rst)
        displayed_hex_value <= 0;
    else if(tr)
        displayed_hex_value <= bin;
end

endmodule
