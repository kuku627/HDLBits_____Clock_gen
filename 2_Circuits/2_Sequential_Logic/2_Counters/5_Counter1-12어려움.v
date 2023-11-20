
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output wire c_enable,
    output wire c_load,
    output wire [3:0] c_d
);



    assign c_enable=enable;
    assign c_load  =reset|(Q==4'd12&enable==1'b1);
    assign c_d=4'b0001;


count4 the_counter(clk,c_enable,c_load,c_d,Q);
endmodule


// module count4(
// 	input clk,
// 	input enable,
// 	input load,
// 	input [3:0] d,
// 	output reg [3:0] Q
// );
// endmodule