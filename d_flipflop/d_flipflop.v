module d_flipflop (
    input din,clk,
    output reg q
);
    always @(posedge clk) begin
        q <= din;
    end
endmodule