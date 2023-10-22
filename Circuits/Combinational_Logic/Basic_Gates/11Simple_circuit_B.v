module eq4b(
    input x,
    input y,
    output z
);

assign z=~(x^y);

// x y z
// 0 0 1
// 1 0 0
// 0 1 0
// 1 1 1

// 둘다 같을 때 1이면 nxor
// 둘다 달라야 1일때 xor
endmodule