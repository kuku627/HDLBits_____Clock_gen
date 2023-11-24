module top_module(
    input [31:0]a,b,
    input sub,
    output [31:0]sum
);

wire [31:0]bsub;
wire outin;
//이거 위에 용도 잘 이해하기


// assign bsub=(32{sub})^b;
// 내가 했던것. 위에
assign bsub={32{sub}}^b;

add16 inst1( .a(a[15: 0]), .b(bsub[15: 0]), .cin(sub)  , .sum(sum[15:0]) , .cout(outin));
add16 inst2( .a(a[31:16]), .b(bsub[31:16]), .cin(outin), .sum(sum[31:16]));
//inst2는 cout 연결 안돼서 안적음.




endmodule