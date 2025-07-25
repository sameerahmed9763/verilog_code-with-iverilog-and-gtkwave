`timescale 1ps/1ps

module exor_gate_tb;

     reg A,B;
     wire C;

    
 exor_gate  dut(.a(A),.b(B),.c(C));

initial begin

 
     $dumpfile("exor_gate.vcd"); // file name  of dut
    $dumpvars(0,exor_gate_tb); // module name of test bench

             A=0;B=0;
    #5 A=0;B=1;
    #5 A=1;B=0;
    #5 A=1;B=1;    
        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, A=%b,B=%b,C=%b ",$time,A,B,C);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves