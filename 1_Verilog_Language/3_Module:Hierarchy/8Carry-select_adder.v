module top_module(
    input [31:0]a,b,
    output [31:0]sum
);

wire [15:0]sum_1,sum_2;
wire cout_1,cout2,cout1;
add16 inst1(
    .a(a[31:16])     ,
    .b(b[31:16])     ,
    .cin(0)          ,
    .sum(sum_1)      ,
    .cout(cout1)
);
add16 inst2(
    .a(a[31:16])     ,
    .b(b[31:16])     ,
    .cin(1)          ,
    .sum(sum_2)      ,
    .cout(cout2)
);

add16 inst3(
    .a(a[15:0])     ,
    .b(b[15:0])     ,
    .cin(0)         ,
    .sum(sum[15:0]) ,
    .cout(cout_1)
);

always @(*) begin
    case(cout_1)
        0: sum[31:16]=sum_1;
        1: sum[31:16]=sum_2;
    endcase
end

endmodule