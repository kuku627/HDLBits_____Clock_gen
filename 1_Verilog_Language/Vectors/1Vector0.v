module top_module(
    input [2:0] vec,
// 이렇게 한줄에 넣으면안됨   output [2:0] outv,o2,o1,o0
    output [2:0] outv,
    output o2,o1,o0
 );

assign outv=vec;
assign o2=vec[2];
assign o1=vec[1];
assign o0=vec[0];

endmodule
