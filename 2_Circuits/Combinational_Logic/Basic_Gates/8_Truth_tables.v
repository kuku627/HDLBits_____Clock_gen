module top_module(
    input x3,x2,x1,
    output f
);

assign f=(~x1&x2&~x3)|(x1&x2&~x3)|(x1&~x2&x3)|(x1&x2&x3);

endmodule


// module truthtable (
//     input x3,
//     input x2,
//     input x1,
//     output f
// );
//     reg f;
//     wire [2 : 0] wire1;

//     assign wire1 = { x3, x2, x1 };

//     always @(*) begin
//         case (wire1)
//             3'b000 : f = 0;
//             3'b001 : f = 0;
//             3'b010 : f = 1;
//             3'b011 : f = 1;
//             3'b100 : f = 0;
//             3'b101 : f = 1;
//             3'b110 : f = 0;
//             3'b111 : f = 1;
//         endcase
//     end

// endmodule