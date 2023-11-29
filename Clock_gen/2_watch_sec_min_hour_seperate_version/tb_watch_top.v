`timescale 1ns / 1ps
module tb_watch_top;
localparam P_COUNT_BIT = 30; // for under 1GHz. 2^30 = 1073741824
localparam P_SEC_BIT	 = 6; // 2^6 = 64 for 60sec
localparam P_MIN_BIT	 = 6; // 2^6 = 64 for 60min
localparam P_HOUR_BIT = 5; // 2^5 = 32    for 24hour

reg clk;
reg reset;
reg i_run_en;
reg [P_COUNT_BIT-1:0]	i_freq;
wire [P_SEC_BIT-1:0]	o_sec;
wire [P_MIN_BIT-1:0]	o_min;
wire [P_HOUR_BIT-1:0]	o_hour;



always #5 clk= ~clk;

initial begin

    i_freq      <=10;
    reset 		<= 0;
    clk     	<= 0;
	i_run_en 	<= 0;    


#100
    reset       <=1;
#10
    reset       <=0;
    i_run_en    <=1;

# 1000000


    i_run_en    <=0;
end



initial begin
    $dumpfile("watch_top.vcd");
    $dumpvars(0,tb_watch_top);

end


watch_top
# (
	.P_COUNT_BIT	(P_COUNT_BIT),
	.P_SEC_BIT	 	(P_SEC_BIT	),
	.P_MIN_BIT	 	(P_MIN_BIT	),
	.P_HOUR_BIT		(P_HOUR_BIT	)
) watch_top_inst(
	.clk 				(clk),
	.reset 				(reset),
	.i_run_en			(i_run_en),
	.i_freq				(i_freq),
    .o_sec				(o_sec ),
    .o_min				(o_min ),
    .o_hour				(o_hour)
);




endmodule