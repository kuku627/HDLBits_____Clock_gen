module top_module(
    input p1a,p2a,p2b,p2c,
          p2d,p1c,p1b,p1f,
          p1e,p1d,
    output p2y,p1y);

wire ab,cd,acb,fed;

assign ab=p2a&p2b;
assign cd=p2c&p2d;
assign acb=p1a&p1c&p1b;
assign fed=p1f&p1e&p1d;

assign p2y=cd|ab;
assign p1y=acb|fed;

endmodule
