module register #(parameter N = 4 ) (
    input [N-1:0] d, load,clear,clk,
    output reg [N-1:0] q
);
    
    always @(posedge clk or negedge clear) begin
        if(!clear)
        q <= {N{1'b0}};
        else if(load)
        q<=d;
    end


endmodule