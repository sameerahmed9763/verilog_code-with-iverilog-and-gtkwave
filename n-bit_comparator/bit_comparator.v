module   bit_comparator #(parameter N =4 )
(
    input [N-1 : 0]a,b,
    output reg less,equal,greater
);


always @(*) begin

if (a<b) begin
    less = 1;   equal=0;greater=0;
end else if(a == b) begin
        less = 0;   equal=1;greater=0;
end else begin
            less = 0;   equal=0;greater=1;
end

end
    
endmodule