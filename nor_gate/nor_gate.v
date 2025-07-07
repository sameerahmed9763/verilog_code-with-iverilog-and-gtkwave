module nor_gate (
    input a,b, output reg c
);

  always @(*) begin
    
    if (a==1'b0 && b==1'b0) begin
        c=1'b1;
    end else begin
        c=1'b0;
    end

  end

endmodule

// output is 0, when one of the input is 1