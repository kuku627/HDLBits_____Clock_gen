module top_module(
    input clk,d,
    output q
);

wire wq1,wq2;



my_dff instance1(clk,d,wq1);
my_dff instance2(clk,wq1,wq2);
my_dff instance3(clk,wq2,q);




endmodule