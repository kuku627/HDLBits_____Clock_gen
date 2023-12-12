
`timescale 1ns / 1ps

module watch_top(
    clk,
    reset,
	i_run_en,
	i_freq,
    o_sec,
    o_min,
    o_hour
    );
parameter P_COUNT_BIT = 30; // (default) 30b, under 1GHz. 2^30 = 1073741824
parameter P_SEC_BIT	 = 6; // 2^6 = 64
parameter P_MIN_BIT	 = 6; // 2^6 = 64 
parameter P_HOUR_BIT = 5; // 2^5 = 32 

input 							clk;
input 							reset;
input 							i_run_en;
input	[P_COUNT_BIT-1:0]		i_freq;
output 	[P_SEC_BIT-1:0]			o_sec;
output 	[P_MIN_BIT-1:0]			o_min;
output 	[P_HOUR_BIT-1:0]		o_hour;

wire w_one_sec_tick;
wire w_one_min_tick;
wire w_one_hour_tick;

one_sec_gen 
# (
	.P_COUNT_BIT	(P_COUNT_BIT) 
) one_sec_gen_inst(
	.clk 				(clk			),
	.reset 				(reset			),
	.i_run_en			(i_run_en		),
	.i_freq				(i_freq			),
	.o_one_sec_tick 	(w_one_sec_tick	)
);

// count sec
tick_gen
# (
	.P_DELAY_OUT	(0),
	.P_COUNT_BIT	(P_SEC_BIT),
	.P_INPUT_CNT	(60) 
) tick_gen_sec(
    .clk				(clk			),
    .reset				(reset			),
	.i_run_en			(i_run_en		),
	.i_tick				(w_one_sec_tick	),
    .o_tick_gen			(w_one_min_tick	),
    .o_cnt_val			(o_sec			)
);

// count min
tick_gen
# (
	.P_DELAY_OUT	(0),
	.P_COUNT_BIT	(P_MIN_BIT),
	.P_INPUT_CNT	(60)
) tick_gen_min(
    .clk				(clk			),
    .reset				(reset			),
	.i_run_en			(i_run_en		),
	.i_tick				(w_one_min_tick	),
    .o_tick_gen			(w_one_hour_tick),
    .o_cnt_val			(o_min			)
);


// count hour
tick_gen
# (
	.P_DELAY_OUT	(0),
	.P_COUNT_BIT	(P_HOUR_BIT),
	.P_INPUT_CNT	(24)
) tick_gen_hour(
    .clk				(clk			),
    .reset				(reset			),
	.i_run_en			(i_run_en		),
	.i_tick				(w_one_hour_tick),
    .o_tick_gen			(				), 
    .o_cnt_val			(o_hour			)
);

endmodule


