module decoder3to8 
(
    input   wire[2:0]   bin,
    output  wire[7:0]   data
);

assign data = 8'h1 << bin;
    
endmodule