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

initial clk = 0;
initial reset = 0;
always #1 clk = ~clk;

endmodule