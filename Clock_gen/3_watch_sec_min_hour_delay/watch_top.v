
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
output 	[P_SEC_BIT-1:0]			o_sec;//6 60초
output 	[P_MIN_BIT-1:0]			o_min;//6 60분
output 	[P_HOUR_BIT-1:0]		o_hour;//5 24시간

wire w_one_sec_tick;
wire w_one_min_tick;
wire w_one_hour_tick;

// Gen one sec
one_sec_gen 
# (
	.P_COUNT_BIT	(P_COUNT_BIT) //30 1MHz 30비트
) one_sec_gen_inst(
	.clk 				(clk			),
	.reset 				(reset			),
	.i_run_en			(i_run_en		),
	.i_freq				(i_freq			),
	.o_one_sec_tick 	(w_one_sec_tick	)
);
//여기서 일단 w_one_Sec_tick는 1MHz 될때 1초 틱 하나 나옴
//이거를 tick gen 불러서 sec 용으로 만듦.

// count sec 60만들면 1분으로
tick_gen
# (
	.P_DELAY_OUT	(2),
	.P_COUNT_BIT	(P_SEC_BIT),//6 비트 64
	.P_INPUT_CNT	(60) // 60 sec
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
	.P_DELAY_OUT	(1),
	.P_COUNT_BIT	(P_MIN_BIT), //6 비트 64
	.P_INPUT_CNT	(60) // 60 min
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
	.P_COUNT_BIT	(P_HOUR_BIT),//5 비트 24
	.P_INPUT_CNT	(24) // 24 hour
) tick_gen_hour(
    .clk				(clk			),
    .reset				(reset			),
	.i_run_en			(i_run_en		),
	.i_tick				(w_one_hour_tick),
    .o_tick_gen			(				), // If you want to add day, you can use it.
    .o_cnt_val			(o_hour			)
);

endmodule


