module top_module(
    input [2:0]a,b,
    input cin,
    output [2:0] cout,sum
);

Full_adder ins1( .a(a[0]), .b(b[0]), .cin(cin)    , .cout(cout[0]), .sum(sum[0]));
Full_adder ins2( .a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
Full_adder ins3( .a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
endmodule





module Full_adder(
    input a,b,cin,
    output cout,sum
);

assign {count,sum}=a+b+cin;
endmodule