module storage_register
(
    input wire KEY0,    //reset                     @{KEY0}
    input wire KEY1,    //write                     @{KEY1}
    input wire KEY2,    //transmit red to green     @{KEY2}
    input wire KEY3,    //copy                      @{KEY3}
    input wire clk,     //                          @{CLK} 
    input wire[7:0] switches,                     //@{SW7_0}
    input wire hight_switch,                      //@{SW8}
    output reg[7:0] LEDR,                         //@{LEDR7_0}
    output reg[7:0] LEDG,                         //@{LEDG7_0}
    output wire[6:0] HEX0,                        //@{HEX0}
    output wire[6:0] HEX1                         //@{HEX1}
);

reg rst;
reg write_r, write_rp;
reg transmit_r, transmit_rp;
reg copy_r, copy_rp;
wire write, transmit, copy;

always @(posedge clk)
begin
    rst <= ~KEY0;
    write_r <= KEY1;
    write_rp <= write_r;
    transmit_r <= KEY2;
    transmit_rp <= transmit_r;
    copy_r <= KEY3;
    copy_rp <= copy_r;
end

assign write = (~write_r) & write_rp;
assign transmit = (~transmit_r) & transmit_rp;
assign copy = (~copy_r) & copy_rp;
bin_to_7seg_converter hex0c(.bin(LEDR[3:0]), .HEX(HEX0));
bin_to_7seg_converter hex1c(.bin(LEDR[7:4]), .HEX(HEX1));

always @(posedge clk)
begin
    if (rst)
        {LEDR, LEDG} <= 0;
    else if(write)
        LEDR <= switches;
    else if(transmit) 
    begin
        LEDR <= {hight_switch, LEDR[7:1]};
        LEDG <= {LEDR[0], LEDG[7:1]};
    end
    else if(copy)
        LEDG <= LEDR;
end

endmodule
