`timescale 1ns/1ps
module top_module_tb;

    // Inputs
    reg clk;
    reg reset;
    reg data;
    reg ack;

    // Outputs
    wire [3:0] count;
    wire counting;
    wire done;

    // Instantiate the top module
    top_module DUT (
        .clk(clk),
        .reset(reset),
        .data(data),
        .ack(ack),
        .count(count),
        .counting(counting),
        .done(done)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1; 
        data = 0;
        ack = 0;

        #10 reset = 0;

        // Test sequence
        #10 data = 1; // Start sequence: 1101
        #10 data = 1;
        #10 data = 0;
        #10 data = 1;

        // Wait for done signal
        #10 data = 0; // Start sequence: 1101
        #10 data = 0;
        #10 data = 0;
        #10 data = 1;
        // ack = 1; // Acknowledge the timer completion

        // Wait for a few more clock cycles
        #10;
        ack = 0;
        #10000
        #30000
        // Add more test sequences as needed
        // ...

        // End simulation
        #10 $finish;
    end


initial begin
    $dumpfile("6_tb.vcd");
    $dumpvars(0,top_module_tb);
end


endmodule
