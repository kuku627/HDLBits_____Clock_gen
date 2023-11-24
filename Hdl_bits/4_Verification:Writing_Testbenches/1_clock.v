module top_module ();


reg clk;

dut inst1(clk);


always begin
   #5clk=~clk; 
end


initial begin
    clk=0;
end


endmodule
