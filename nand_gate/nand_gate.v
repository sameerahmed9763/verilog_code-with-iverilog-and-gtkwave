module nand_gate (
    input a,b, output reg c
);
    always @(*) begin
        if (a==1'b1 && b==1'b1) begin
            c=1'b0;
        end else begin
            c=1'b1;
        end
    end
endmodule

//  output is zero when both input is 1;