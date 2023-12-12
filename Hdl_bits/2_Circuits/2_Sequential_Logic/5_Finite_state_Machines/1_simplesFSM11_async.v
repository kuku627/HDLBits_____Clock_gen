module top_module(
    input clk,
    input areset,
    input in,
    output out
);

reg curr_state, next_state;
parameter A=1'b1, B=1'b0;

    always @(posedge clk or posedge areset) begin
        if(areset) curr_state<= B;
        else       curr_state<=next_state;

    end

    always @(*) begin
        case(curr_state)
            B:next_state= in? B:A;
            A:next_state= in? A:B;
        endcase
    end

assign out=(curr_state==B);






endmodule