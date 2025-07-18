module fsm_1 (rst,clk,out);
    input wire rst;  //   active high reset
    input wire clk;  //  clock
    output reg out;  // output

    reg current_state;
    reg next_state;

    parameter s0 = 1'b0 ;
    parameter s1 = 1'b1;


// state transistion 
always @ (posedge clk   or  negedge rst  ) begin
 if (rst) begin
   current_state <= s0;
 end else begin
   current_state <= next_state;    
 end
end


// next state logic

always @(* ) begin
    case (current_state)
        s0:  next_state = s1;
        s1 : next_state = s0;
        default:  next_state = s0;
    endcase
end



// output logic

always @(*) begin
    case (current_state)
        s0: out = 1'b0; 
        s1: out = 1'b1; 
        default: out = 1'b0; 
    endcase
end


endmodule