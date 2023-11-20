module top_module(

    input [31:0]a,b,
    output [31:0]sum

);
wire con1,con2;


add16_inst1( .cin(0), .a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(con1));

add16_inst2( .cin(con1), .a(a[31:16]), .b(b[31:16]), .sum(sum[31:16]), .cout(con2));

endmodule

module add1(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a^b^cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
