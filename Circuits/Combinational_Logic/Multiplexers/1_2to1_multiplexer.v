module top_module(
    input a,b,sel,
    output reg out
);

    always @(*) begin
        case(sel)
        0:out=a;
        1:out=b;
        endcase

    end


endmodule