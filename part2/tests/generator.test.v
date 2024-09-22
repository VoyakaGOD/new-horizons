`timescale 100ps / 100ps

module generator___test;
reg clk;
reg reset;
wire result;

generator target
(
    .clk(clk),
    .reset(reset),
    .signal(result)
);

initial clk = 0;
initial reset = 0;
always #1 clk = ~clk;

endmodule