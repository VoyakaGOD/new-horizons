module log2 
(
    input   wire[7:0]   value,
    output  wire[2:0]   power
);

assign power =  (value == 8'd1) ? 3'd0 : 
                (value == 8'd2) ? 3'd1 : 
                (value == 8'd4) ? 3'd2 : 
                (value == 8'd8) ? 3'd3 : 
                (value == 8'd16) ? 3'd4 : 
                (value == 8'd32) ? 3'd5 : 
                (value == 8'd64) ? 3'd6 : 
                (value == 8'd128) ? 3'd7 : 3'd0;
    
endmodule