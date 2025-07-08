`timescale 1ns/1ps

module    bit_comparator_tb;

    parameter N=4; // 4-bit comparator

    reg [N-1 : 0]a,b;
    wire less,equal,greater;

    bit_comparator dut(.a(a),.b(b),.less(less),.greater(greater),.equal(equal));

initial begin
    $dumpfile("bit_comparator.vcd");
    $dumpvars(0,bit_comparator_tb);


        $monitor("Time=%0t | a=%b, b=%b -> Less=%b, Equal=%b, Greater=%b",
                  $time, a, b, less, equal, greater);

      
        a = 4'b0000; b = 4'b0000; #10;  // Equal
        a = 4'b0001; b = 4'b0010; #10;  // Less
        a = 4'b1010; b = 4'b0101; #10;  // Greater
        a = 4'b1111; b = 4'b1111; #10;  // Equal
        a = 4'b1000; b = 4'b1001; #10;  // Less
        a = 4'b0111; b = 4'b0011; #10;  // Greater

        // Finish simulation
        $finish;
end


endmodule