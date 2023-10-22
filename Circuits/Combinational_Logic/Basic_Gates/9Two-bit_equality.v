module top_module(
    input [1:0]A,
    input [1:0]B,
    output z
);

assign z=(A==B)? 1'b1:1'b0;
// assign z=(A[0]==B[0])&(A[1]==B[1]);
// assign z=(A[1:0]==B[1:0]);

endmodule


//두개의 비트가 각각 동일할 경우만 1 출력 그 외 0
//