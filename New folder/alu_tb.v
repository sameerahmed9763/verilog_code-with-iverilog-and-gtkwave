`timescale 1ns/1ps

module alu_tb;

  parameter N = 2;

  reg  [N-1:0] a, b, sel;
  wire [N-1:0] res;

  // DUT instantiation
  alu dut (.a(a), .b(b), .sel(sel), .res(res));

  // Monitor signals
  initial begin
    $monitor("Time=%0t | a=%b, b=%b, sel=%b => res=%b", $time, a, b, sel, res);
  end

  // Test vectors
  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    // Test case 1: Addition
    sel = 2'b00; a = 2'b01; b = 2'b10; #10;

    // Test case 2: Subtraction
    sel = 2'b01; a = 2'b11; b = 2'b00; #10;

    // Test case 3: AND
    sel = 2'b10; a = 2'b11; b = 2'b10; #10;

    // Test case 4: OR
    sel = 2'b11; a = 2'b10; b = 2'b11; #10;

    $finish;
  end

endmodule
