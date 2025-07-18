module fsm_1_tb;
    reg rst,clk;
    wire out;


// module  instance 
   fsm_1 dut(.rst(rst),.clk(clk),.out(out));


    initial begin
        clk=0;
        forever begin
            #5 clk = ~clk;
        end
    end

   initial begin
        $display("Time\tclk\trst\tout");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, rst, out);

        rst = 1;       // Apply reset
        #12;
        rst = 0;       // Release reset

        #100;          // Run simulation for a while
        $finish;
    end


    initial begin
        $dumpfile("fsm_1.vcd");
        $dumpvars(0, fsm_1_tb);
    end


endmodule