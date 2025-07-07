`timescale 1ps/1ps

module demux_1x2_tb;

     reg i,s;
     wire [1:0]y;

    
 demux_1x2  dut(.i(i),.s(s),.y(y));

initial begin

 
     $dumpfile("demux_1x2.vcd"); // file name  of dut
    $dumpvars(0,demux_1x2_tb); // module name of test bench

             i=1'b0;s=1;
    #5 i=1'b1;s=1;
    #5 i=1'b0;s=0;
    #5 i=1'b1;s=0;

   
        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, i=%0b,s=%0b,y=%b",$time,i,s,y);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves