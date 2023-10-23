module top_module( 
    input [2:0] in,
    output reg [1:0] out );

integer i;
    always @(*) begin
        out=0;
        for(i=0;i<3;i=i+1) begin
            if(in[i])
                out=out+1;
            else
                out=out;
        end
    end

endmodule

module top_module (
	input [2:0] in,
	output [1:0] out
);

	// This is a function of 3 inputs. One method is to use a 8-entry truth table:
	// in[2:0] out[1:0]
	// 000      00
	// 001      01
	// 010      01
	// 011      10
	// 100      01
	// 101      10
	// 110      10
	// 111      11
	assign out[0] = (~in[2] & ~in[1] & in[0]) | (~in[2] & in[1] & ~in[0]) | (in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]);
	assign out[1] = (in[1] & in[0]) | (in[2] & in[0]) | (in[2] & in[1]);
	
endmodule