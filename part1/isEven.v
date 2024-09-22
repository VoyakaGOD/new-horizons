module isEven 
(
    input   reg         test,
    input   wire[7:0]   number,
    output  wire        result
);

assign result = ~number[0];
    
endmodule