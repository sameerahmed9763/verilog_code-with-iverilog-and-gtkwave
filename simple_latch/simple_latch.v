module simple_latch (
    input din,enable,
    output reg q
);
    always @(*) begin
        if (din == enable) begin
            q <= din;
        end
    end
endmodule