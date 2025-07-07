module demux_1x2 (
    input i,s,output reg [1:0]y
);
  always @(*) begin
    case (s)
       1'b0 : 
       begin
               y[0]=i;y[1]= 1'b0; 
       end

       1'b1 : 
       begin
               y[0]=1'b0;y[1]= i; 
       end

        default: 

        begin
y[0]=1'b0;y[1]= 1'b0; 
        end
    endcase
  end  
endmodule