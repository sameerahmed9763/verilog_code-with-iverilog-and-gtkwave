`timescale 1ps/1ps

module full_adder_tb;

    reg a, b, cin;
    wire sum, carry;

    full_adder dut (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    initial begin
        $dumpfile("full_adder.vcd");      // Name of the VCD file
        $dumpvars(0, full_adder_tb);      // Dump all variables

        // Test cases
        a=0; b=0; cin=0; #5;
        a=0; b=1; cin=0; #5;
        a=1; b=0; cin=0; #5;
        a=1; b=1; cin=0; #5;
        a=0; b=1; cin=1; #5;
        a=1; b=0; cin=1; #5;
        a=1; b=1; cin=1; #5;
        $finish;
    end

    always @(*) begin
        $monitor("Time=%0t : a=%b b=%b cin=%b => sum=%b carry=%b", 
                  $time, a, b, cin, sum, carry);
    end

endmodule
