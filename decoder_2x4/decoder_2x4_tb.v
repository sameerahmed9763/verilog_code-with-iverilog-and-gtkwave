`timescale 1ps/1ps

module decoder_2x4_tb;

    reg [1:0]i;
    wire  [3:0] y;
    
 decoder_2x4  dut(.i(i),.y(y));

initial begin

 
     $dumpfile("decoder_2x4.vcd"); // file name  of dut
    $dumpvars(0,decoder_2x4_tb); // module name of test bench

             i=2'b00;
    #5 i=2'b01;
    #5 i=2'b10;
    #5 i=2'b11;

        #10 
    $finish();
end

initial begin
    $monitor("simulation_time =%g, i=%b,y=%b ",$time,i,y);
end


endmodule

// iverilog -o and_gate.vvp and_gate.v and_gate_tb.v   generate .vvp file then run vvp generated file   gtkwave and_gate.vcd   for waves