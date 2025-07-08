module half_adder (
    input  a,b,output  reg sum,carry
);
    
    always @(*) begin
        if(a==1 && b==1)
        begin
            sum =0; carry=1;
        end
        else
        begin
            sum = 1; carry =0;
        end
    end


endmodule