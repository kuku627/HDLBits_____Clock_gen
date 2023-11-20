//이 문제에서 왜 reg로 선언했는지, 길이가 3이라는데 왜?
//두가지 질문
module top_module(
    input clk,
    input [7:0]d,
    input [1:0]sel,
    output reg[7:0]q
);
//wire [7:0] w1,w2,w3;

//위 아래 둘중 하나
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;

my_dff8 instance1(clk,d,w1);
my_dff8 instance2(clk,w1,w2);
my_dff8 instance3(clk,w2,w3);

always @(*) begin
    case(sel)
        3:q=w3;
        2:q=w2;
        1:q=w1;
        0:q=d;
    endcase

end


endmodule