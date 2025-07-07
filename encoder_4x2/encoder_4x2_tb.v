`timescale 1ps/1ps

module encoder_4x2_tb;

reg [3:0]i;
wire [1:0] y;
    
 encoder_4x2  dut(.i(i),.y(y));

initial begin

 
     $dumpfile("encoder_4x2.vcd"); // file name  of dut
    $dumpvars(0,encoder_4x2_tb); // module name of test bench

             i=4'b0000;
    #5 i=4'b0001;
    #5 i=4'b0010;
    #5 i=4'b0100;
    #5 i=4'b1000;
     #5 i=4'b1111;
   

   
        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, i=%b,y=%b ",$time,i,y);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves