module priorityEncoder8to3
(
    input  wire[7:0]        data,
    output   wire[2:0]      bin,
    output   wire           empty
);

wire[3:0] raw;

assign raw =    data[7] ? 4'd7 : 
                data[6] ? 4'd6 : 
                data[5] ? 4'd5 : 
                data[4] ? 4'd4 : 
                data[3] ? 4'd3 : 
                data[2] ? 4'd2 : 
                data[1] ? 4'd1 : 
                data[0] ? 4'd0 : 4'b1000;

assign bin = raw[2:0];
assign empty = raw[3];

endmodule