module top_module(
    input [99:0] a,b,
    input sel,
    output reg [99:0] out
);
//always 문 안에 들어갈때 reg 타입
    always @(*) begin
        case(sel)
        0:out=a;
        1:out=b;
        endcase

    end


endmodule