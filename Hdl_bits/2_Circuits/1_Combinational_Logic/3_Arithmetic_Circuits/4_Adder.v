module top_module(
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);
wire [3:0]cout;
FA fa0(x[0],y[0],1'b0    ,cout[0] ,sum[0]);
FA fa1(x[1],y[1],cout[0] ,cout[1] ,sum[1]);
FA fa2(x[2],y[2],cout[1] ,cout[2] ,sum[2]);
FA fa3(x[3],y[3],cout[2] ,cout[3] ,sum[3]);
assign sum[4]=cout[3];



endmodule










module FA(
    input x,
    input y,
    input cin,
    output cout,
    output sum
);

assign {cout,sum}=x+y+cin;


endmodule
