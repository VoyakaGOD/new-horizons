module generator
(
    input   wire clk,
    input   wire reset,
    output  reg  signal
);

reg[2:0] counter;

initial counter = 3'b000;
initial signal = 0;

always @(negedge clk)
begin
    signal = 0;
    if (reset)
    begin
        counter = 3'b000;
    end
    else if(counter < 4)
    begin
        counter = counter + 1;
    end
    else
    begin
        counter = 3'b000;
        signal = 1'b1;
    end
end

endmodule
