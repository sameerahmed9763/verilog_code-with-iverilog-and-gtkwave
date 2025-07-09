`timescale 1ns/1ps

module d_flipflop_tb;

    // Declare signals
    reg din, clk;
    wire q;

    // Instantiate the D Flip-Flop (DUT)
    d_flipflop dut (
        .din(din),
        .clk(clk),
        .q(q)
    );

    // Clock generation: toggle every 5 ns => 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor output on every change
    initial begin
        $monitor("simulation_time = %0t | din = %b | clk = %b | q = %b", 
                  $time, din, clk, q);
    end

    // Test stimulus
    initial begin
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0, d_flipflop_tb);

        // Apply stimulus
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;

        $finish();
    end

endmodule
