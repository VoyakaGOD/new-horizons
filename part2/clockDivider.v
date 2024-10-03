module clockDivider
(
    input   wire clk,
    input   wire reset,
    output  reg  clk_div6
);

reg[1:0] counter;

always @(posedge clk)
begin
    if (reset)
    begin
        counter <= 2'b00;
        clk_div6 <= 0;
    end
    else if(~counter[1]) //counter less than 2
    begin
        counter <= counter + 1;
    end
    else
    begin
        counter <= 2'b00;
        clk_div6 <= ~clk_div6;
    end
end

endmodule