module top_module (
    input a, 
    input b, 
    input c, 
    output out
);//
    wire a_out;
    andgate inst1 ( 
        .out(a_out),
        .  a(a)  ,
        .  b(b)  ,
        .  c(c)  , 
        .  d(1)  ,
        .  e(1)  
        );
    assign out=~a_out;

endmodule
