module not_gate (
    input a,output reg b
);

always @(*) begin
    if (a == 1'b0) begin
        b=1'b1;
    end else begin
        b=1'b0;
    end
end


    
endmodule


// output is opposite of input