module register_tb ;
    parameter N=4;
  reg  [N-1:0] d, load,clear,clk;
  wire [N-1:0] q;


  register dut(.d(d),.load(load),.clear(clear),.clk(clk),.q(q));


  initial begin
    $monitor("simulation time is %0t, d = %b |  load =%d | clear=%d |   clk = %d |  q =%b",$time,d,load,clear,clk,q);
  end

initial
begin
    clk=0;
forever #5 clk=~clk;
end 

  initial begin

    $dumpfile("register.vcd");
     $dumpvars;

    d=4'b0000;     clear=1;    load=0; #10;  // initial values
    d=4'b0001;     clear=0;    load=1; #10; // clear = 0  reset the value 
   clear=1;    load=0; #10; //  clear =1 but the value does not update due to load 0
   clear=1;    load=1; #10;//  clear =1 but the value does  update due to load 1
    clear=0;    load=1; #10;  // clear = 0  reset the value 
$finish();

  end

endmodule