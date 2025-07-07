module exnor_gate (
    input a,b,output reg c
);
    always @(*) begin
        if (a!=b) begin
            c=1'b0;
        end else begin
            c=1'b1;
        end
    end
endmodule


// output 0, when both input is not equal or same