module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out
    );  // 아웃부분 비트 입력이랑 맞춰줘야함

    assign out = sel? a:b;

endmodule
