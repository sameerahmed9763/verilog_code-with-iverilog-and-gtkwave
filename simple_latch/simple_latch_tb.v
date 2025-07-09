module simple_latch_tb;
    reg din,enable;
    wire q;

    simple_latch dut(.din(din),.enable(enable),.q(q));

initial begin
    $monitor("Simaulation is  %g, din=%b,enable=%b,q=%b",$time,din,enable,q);
end


initial begin

    $dumpfile("simple_latch.vcd");
    $dumpvars(0,simple_latch_tb);
    
    din=0;enable=0; #5;
    din=1;enable=0; #5;
    din=0;enable=1; #5;
    din=1;enable=1; #5;

    $finish();
end



endmodule