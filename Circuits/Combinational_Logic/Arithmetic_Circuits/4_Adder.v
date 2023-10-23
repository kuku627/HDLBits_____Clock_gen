module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);


Full_adder ins1( .x([0]), .y([0]), .cout(cout[0]), .sum(sum[0]));
Full_adder ins2( .x([1]), .y([1]), .cout(cout[1]), .sum(sum[1]));
Full_adder ins3( .x([2]), .y([2]), .cout(cout[2]), .sum(sum[2]));
Full_adder ins4( .x([3]), .y([3]), .cout(cout[3]), .sum(sum[3]));

endmodule





module Full_adder(
    input x,y,
    output cout,sum
);

assign cout=x&y|y&cin|x&cin;
assign sum=x^y^cin;

endmodule