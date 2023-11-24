`timescale 1ns / 1ps
module tb_bcdcount;
    reg clk;
    reg enable;
    reg reset;
    wire [3:0] Q;



bcdcount count0(

    .       clk(clk)      ,
    .       enable(enable),
    .       reset(reset)  ,
    .       Q   (Q)
);


    always begin
        #5 clk=~clk;
    end
    

    initial begin
        
        reset<=0;
        
        clk<=0;

        enable<=0;
    
        #20   reset<=1;
        #20  enable<=1;
        #20   reset<=0;

        #200
        $finish;


    end
    initial begin
        $dumpfile("tb_bcdcount_wave.vcd");
        $dumpvars(0,tb_bcdcount);
    end


endmodule