module clockDivider
(
    input   wire clk,
    input   wire reset,
    output  reg  clk_div6
);

reg[2:0] counter;

initial counter = 3'b000;
initial clk_div6 = 0;

always @(negedge clk)
begin
    clk_div6 = 0;
end

always @(posedge clk)
begin
    if (reset)
    begin
        counter = 3'b000;
    end
    else if(counter < 5)
    begin
        counter = counter + 1;
    end
    else
    begin
        counter = 3'b000;
        clk_div6 = 1;
    end
end

endmodule