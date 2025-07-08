module alu #(parameter  N= 2) (
    input [N-1:0]a,b,sel,
    output reg [N-1:0]res
);
    always @(*) begin
        
        case (sel)
        2'b00    :  res = a+b;
        2'b01    :  res = a+(~b+2'b01);
        2'b10    :  res = a&b;
        2'b11    :  res = a|b;
            default: res = 2'bxx;
        endcase


    end
endmodule