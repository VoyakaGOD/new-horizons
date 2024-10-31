module clock
(
    input wire KEY0,            //reset @{KEY0}
    input wire KEY1,            //mode  @{KEY1}
    input wire KEY2,            //next  @{KEY2}
    input wire KEY3,            //incr  @{KEY3}
    input wire clk,                   //@{CLK}
    output wire[6:0] sec_l_display,   //@{HEX2}
    output wire[6:0] sec_h_display,   //@{HEX3}
    output wire[6:0] min_l_display,   //@{HEX4}
    output wire[6:0] min_h_display,   //@{HEX5}
    output wire[6:0] hour_l_display,  //@{HEX6}
    output wire[6:0] hour_h_display   //@{HEX7}
);

localparam ticks_per_second = 50000000; //20ns per tick

reg rst;
wire chmode;
wire next;
wire incr;
reg mode; //0 - display, 1 - setup
reg[25:0] counter;
wire carry_sec;
wire carry_min;
reg force_sec;
reg force_min;
reg force_hour;
reg[1:0] item;

always @(posedge clk) rst <= ~KEY0;
button chmode_button(.clk(clk), .signal(KEY1), .state(chmode));
button next_button(.clk(clk), .signal(KEY2), .state(next));
button incr_button(.clk(clk), .signal(KEY3), .state(incr));
 
two_digit_number#(2, 9, 3) hour_display(    .clk(clk),
                                            .rst(rst),
                                            .incr(force_hour | carry_min), 
                                            .high_display(hour_h_display), 
                                            .low_display(hour_l_display)); 
two_digit_number#(5, 9, 9) min_display(     .clk(clk),
                                            .rst(rst), 
                                            .incr(force_min | carry_sec), 
                                            .high_display(min_h_display), 
                                            .low_display(min_l_display),
                                            .next(carry_min)); 
two_digit_number#(5, 9, 9) sec_display(     .clk(clk),
                                            .rst(rst), 
                                            .incr(force_sec | (counter == ticks_per_second)),
                                            .high_display(sec_h_display), 
                                            .low_display(sec_l_display),
                                            .next(carry_sec));

always @(posedge clk)
begin
    if(rst)
        mode <= 0;
    else 
    begin
        mode <= chmode ^ mode;
        if(mode)
        begin
            force_sec <= incr & (item == 0);
            force_min <= incr & (item == 1);
            force_hour <= incr & (item == 2);
            item <= (item < 3) ? (item + next) : 0;
        end
        else if(counter > ticks_per_second)
            counter <= 0;
        else
            counter <= counter + 1;
    end
end

endmodule
