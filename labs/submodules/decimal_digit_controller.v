module decimal_digit_controller
(
    input wire rst,
    input wire clk,
    input wire inc,
    output reg carry,
    output reg[3:0] digit; 
);

always @(posedge clk)
begin
    if(rst)
    begin
        digit <= 0;
        carry <= 0;
    end
    else if(inc)
    begin
        if(digit < 9)
        begin
            digit <= digit + 1;
            carry <= 0;
        end
        else
        begin
            digit <= 0;
            carry <= 1;
        end
    end
    else
        carry <= 0;
end

endmodule