module mux_2x1 (
    input [1:0]i,s,output reg y
);

always @(*) begin

case (s)
    1'b0: y=i[0];
    1'b1: y=i[1];
    default: y=1'bx;
endcase

end

    
endmodule