`timescale 1ps/1ps

module half_adder_tb (
    
);
    reg a,b;
    wire sum,carry;

half_adder  dut(.a(a),.b(b),.sum(sum),.carry(carry));

initial begin

    $dumpfile("half_adder.vcd"); // file name  of dut
    $dumpvars(0,half_adder_tb); // module name of test bench

                a=0;b=0;
    #5      a=0;b=1;
    #5      a=1;b=0;
    #5      a=1;b=1;
    #5      $finish();

        $monitor("simulation time is %g, a=5b,b=%b,sum=%b,carry=%b",$time,a,b,sum,carry);

end


endmodule