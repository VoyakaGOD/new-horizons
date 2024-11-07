module number_memory
(
    input wire KEY0,         //reset@{KEY0}
    input wire KEY1,         //write@{KEY1}
    input wire clk,               //@{CLK}
    input wire[7:0] value_sw,     //@{SW7_0}
    input wire[2:0] addr_sw,      //@{SW17_15}
    output wire[7:0] INDIC,       //@{LEDR7_0}
    output reg[2:0] addr          //@{LEDG2_0}
);

integer i;
reg rst;
reg[7:0] value;
reg[7:0] data[7:0];
wire write;

button write_button(.clk(clk), .signal(signal), .state(write));
assign INDIC = data[addr];

always @(posedge clk)
begin
    rst <= ~KEY0;
    value <= value_sw;
    addr <= addr_sw;
    value <= value_sw;
end

always @(posedge clk)
begin
    if(rst)
    begin
        for (i = 0; i < 8; i = i + 1)
            data[i] <= 0;
    end
    else if(write)
    begin
        data[addr] <= value;
    end
end

endmodule
