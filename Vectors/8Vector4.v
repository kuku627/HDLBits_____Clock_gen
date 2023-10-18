module top_module(

    input [7:0] in,
    output [31:0] out
);


//assign out={24{in[7]},in};
//내가 처음에 쓴거 in[7]밖에도 한번 더 씌워야함
assign out={{24{in[7]}},in};

endmodule