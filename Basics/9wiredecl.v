module top_module(
    input a,b,c,d,
    output out,out_n
);
wire intermediate1;
wire intermediate2;

assign intermediate1=a&b;
assign intermediate2=c&d;
assign out=intermediate1|intermediate2;
assign out_n=~(intermediate1|intermediate2);





endmodule
