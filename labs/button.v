module button
(
    input wire clk,
    input wire signal,
    output wire state
);

reg current_value;
reg previous_value;
assign state = (~current_value) & previous_value;

always @(posedge clk)
begin
    current_value <= signal;
    previous_value <= current_value;
end

endmodule