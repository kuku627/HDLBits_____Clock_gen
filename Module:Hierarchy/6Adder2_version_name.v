module top_module(
    input  [31:0]a,b,
    output [31:0]sum
);

wire wcou1,wcou2;
// add16 instance1(a[15:0],b[15:0],0,sum[15:0],wcou1);
add16 instance1( .a(a[15:0]), .b(b[15:0]),  .cin(1'b0),   .sum(sum[15:0]), .cout(wcou1)  )  ;
//name 할때는 괄호 바깥이 인스턴스모듈 속안에 있는거

add16 instance2( .a(a[31:16]), .b(b[31:16]), .cin(wcou1), .sum(sum[31:16]), .cout(wcou2) );




endmodule
