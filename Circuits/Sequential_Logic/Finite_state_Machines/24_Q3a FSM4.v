module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=1'b0,B=1'b1;
    reg curr_state,next_state;
    