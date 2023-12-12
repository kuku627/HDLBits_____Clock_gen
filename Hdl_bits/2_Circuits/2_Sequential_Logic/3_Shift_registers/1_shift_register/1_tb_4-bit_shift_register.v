`timescale 1ps/1ps
module tb_shift_resister;
    reg clk;
    reg areset;
    reg load;
    reg ena;
    reg [3:0]data;
    wire [3:0]q;

    top_module DUT(clk,areset,load,ena,data,q);



    always begin
        #5 clk=~clk;
    end

    initial begin
        areset<=1;
        clk<=0;
        ena<=0;
        data = 4'b1010;
        #10 areset<=0;
        #10    load<=1;
        #20    ena<=1;
        #40    load<=0;
        #100    
        $finish;


    end
    

    initial begin
        $dumpfile("tb_shift_resiter.vcd");
        $dumpvars(0,tb_shift_resister);
    end

endmodule
