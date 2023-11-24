module top_module(
    input a,b,
    output out
);

wire wa,wb,wc;

mod_a instance3(
    .in1(wa),
    .in2(wb),
    .out(wc)
);
assign wa=a;
assign wb=b;
assign out=wc;
// assign wc=out;  
//내실수
endmodule

