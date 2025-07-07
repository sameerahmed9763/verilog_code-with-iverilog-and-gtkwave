`timescale 1ps/1ps


module buffer_gate_tb (

);
    reg A;
    wire B;


     buffer_gate dut(.a(A),.b(B));


   initial begin

 
     $dumpfile("buffer_gate.vcd"); // file name  of dut
    $dumpvars(0,buffer_gate_tb); // module name of test bench

             A=0;
    #5 A=1;
        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, A=%b,B=%b",$time,A,B);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves