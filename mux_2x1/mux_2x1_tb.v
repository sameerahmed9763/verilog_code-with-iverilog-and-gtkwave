`timescale 1ps/1ps

module mux_2x1_tb;

     reg [1:0]i,s;
     wire y;

    
 mux_2x1  dut(.i(i),.s(s),.y(y));

initial begin

 
     $dumpfile("mux_2x1.vcd"); // file name  of dut
    $dumpvars(0,mux_2x1_tb); // module name of test bench

             i=2'b00;s=1;
    #5 i=2'b01;s=1;
    #5 i=2'b10;s=1;
    #5 i=2'b11;s=1;
    #5 i=2'b00;s=0;
    #5 i=2'b01;s=0;
    #5 i=2'b10;s=0;
    #5 i=2'b11;s=0;

   
        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, i=%b,s=%0b,y=%b ",$time,i,s,y);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves