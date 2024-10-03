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

initial
begin
    clk = 0;
    reset = 1;
    #5 reset = 0;
end

always #1 clk = ~clk;

endmodule