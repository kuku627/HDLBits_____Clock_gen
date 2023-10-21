module top_module(
    input  [31:0]a,b,
    output [31:0]sum
);

wire wcou1,wcou2;
add16 instance1(a[15:0],b[15:0],0,sum[15:0],wcou1);
add16 instance2(a[31:16],b[31:16],wcou1,sum[31:16],wcou2);




endmodule
