`timescale 100ps / 100ps

module clockDivider___test;
reg clk;
reg reset;
wire result;

clockDivider target
(
    .clk(clk),
    .reset(reset),
    .clk_div6(result)
);

initial
begin
    clk = 0;
    reset = 1;
    #5 reset = 0;
end

always #1 clk = ~clk;

endmodule