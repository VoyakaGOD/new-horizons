module generator
(
    input   wire clk,
    input   wire reset,
    output  wire signal
);

reg[2:0] counter;
assign signal = counter[2]; //counter equals 4

always @(posedge clk)
begin
    if (reset)
        counter <= 3'b000;
    else if(~counter[2]) //counter less than 4
        counter <= counter + 1;
    else
        counter <= 3'b000;
end

endmodule
