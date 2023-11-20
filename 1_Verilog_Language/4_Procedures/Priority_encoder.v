// Always case2
// always_casePreviousNextalways_casez
// A priority encoder is a combinational circuit that, when given an input bit vector, outputs the position of the first 1 bit in the vector. For example, a 8-bit priority encoder given the input 8'b10010000 would output 3'd4, because bit[4] is first bit that is high.

// Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero), output zero. Note that a 4-bit number has 16 possible combinations.






//배운점
//1. 비트표현할때 인코더는 xx 꼴로 하면 편함
//2. case안에 ; 안넣음 실수 잦음
//3. case문 안에 default 자주 안함
//4. case는 한비트한비트 일치해야함
// 근데 casex는 좀 광범위하게 가능
//5. always 문 할때는 전체 tab 
module top_module(
    input [3:0]in,
    output reg [1:0]pos
);
always @(*) begin
    pos=(in[0]&1) ? 2'b00:(in[1]&1) ? 2'b01:(in[2]&1) ? 2'b10:(in[3]&1)? 2'b11:2'b00;
    // pos = (in[0] & 1) ? 2'd0 : (in[1] & 1) ? 2'd1 : (in[2] & 1) ? 2'd2 : (in[3] & 1) ? 2'd3 : 2'd0;
end
// always @(*) begin
//     casex(in)
//         4'bxxx1: pos=2'b00;
//         4'bxx1x: pos=2'b01;
//         4'bx1xx: pos=2'b10;
//         4'b1xxx: pos=2'b11;  

//         default: pos=2'b00;
//     endcase
// end


endmodule