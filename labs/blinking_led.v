module blinking_led
(
    input wire KEY0,    //reset     @{KEY0} 
    input wire KEY1,    //update    @{KEY1}
    input wire clk,     //          @{CLK}
    input wire[13:0] switches,  //  @{SW13_0}
    output wire LED     //          @{LEDG8}
);

localparam ticks_per_ms = 50000; //20ns per tick

reg rst;
reg update_r, update_rp;
reg[13:0] counter;
reg[15:0] low_counter;
reg[13:0] delay;

always @(posedge clk)
begin
    rst <= ~KEY0;
    update_r <= KEY1;
    update_rp <= update_r;
end

assign update = (~update_r) & update_rp;
assign LED = ~(({2'b0, counter} << 2) > delay); //1/4 of period

always @(posedge clk)
begin
    if (rst)
    begin
        {counter, low_counter} <= 0;
        delay <= 1;
    end
    else if(update)
    begin
        {counter, low_counter} <= 0;
        delay <= switches;
    end
    else if(low_counter < ticks_per_ms)
        low_counter <= low_counter + 1;
    else 
    begin
        low_counter <= 0;
        if(counter < delay)
            counter <= counter + 1;
        else
            counter <= 0;
    end
end

endmodule
