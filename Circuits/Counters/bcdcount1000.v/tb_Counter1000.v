`timescale 1ns/1ps


module tb_Counter1000;
    reg clk       ;
    reg reset     ;
    wire OneHertz ;
    wire [2:0]c_enable;


    always begin
        #5clk=~clk;
    end


    initial begin
        clk<=0;
        reset<=1;

        #10 reset <=0;

        
        #11000 $finish;


    end

Counter1000 DUT(clk,reset,OneHertz,c_enable);

initial begin
    $dumpfile("tb_Counter1000.vcd");
    $dumpvars(0,tb_Counter1000);
end


endmodule