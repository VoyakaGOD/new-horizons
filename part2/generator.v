module generator
(
    input   wire clk,
    input   wire reset,
    output  reg  signal
);

reg[2:0] counter;

always @(posedge clk)
begin
    if (reset)
    begin
        counter <= 3'b000;
        signal <= 0;
    end
    else if(~counter[2]) //counter less than 4
    begin
        if (~counter) //counter equals 0
            signal <= 0;
        counter <= counter + 1;
    end
    else
    begin
        counter <= 3'b000;
        signal <= 1;
    end
end

endmodule
