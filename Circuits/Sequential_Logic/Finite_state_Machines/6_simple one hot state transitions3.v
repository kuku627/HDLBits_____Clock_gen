module top_module(
    input                in,
    input  [3:0]      state,
    output [3:0] next_state,
    output              out
);

    parameter A=4'b0001, B=4'b0010, C=4'b0100, D=4'b1000;
    // reg state,next_state;

    always@(*) begin
        case(state)
            A: next_state= in? B:A;
            B: next_state= in? B:C;
            C: next_state= in? D:A;
            D: next_state= in? B:C;
            
        endcase
    end

    assign out=(state==D);



endmodule