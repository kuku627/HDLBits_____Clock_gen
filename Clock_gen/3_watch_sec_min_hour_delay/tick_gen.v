module tick_gen(
    clk,
    reset,
	i_run_en,
	i_tick,
    o_tick_gen,
    o_cnt_val
    );
parameter P_DELAY_OUT = 0; // (default) 60
parameter P_COUNT_BIT = 6; // (default) 6b = 2^6 
parameter P_INPUT_CNT = 60; // (default) 60

input 								clk;
input 								reset;
input 								i_run_en;
input 								i_tick;
output reg							o_tick_gen;
output [P_COUNT_BIT-1:0]			o_cnt_val;
reg [P_COUNT_BIT-1:0]		r_cnt_val;


//o_tick_gen과 o_cnt_val은 초 분 시 마다 바뀜.
//o_tick_gen은 59초 되면 1분 넘김. 59분 되면 1시간 넘김
// o_cnt_val은 최종 출력 sec,min,hour

//r_cnt_val을 만든 이유는 딜레이때문에 한번 쉬고 연결하려고
//P_COUNT_BIT도 초 분 시 마다 6비트 6비트 5비트 달라짐
//1초는 30비트인게 1MHz여서
	always @(posedge clk) begin
	    if(reset) begin
			r_cnt_val <= {P_COUNT_BIT{1'b0}};
			o_tick_gen <= 1'b0;
//r_cnt_val에 초에 6비트 0 초기화하고
// o_tick_gen도 one_sec_gen과 똑같이 1메가 때 1초 뽑아냄
// 마찬가지로 59초 되면 1분 뽑아냄.

	    end else if (i_run_en & i_tick) begin
			if(r_cnt_val == P_INPUT_CNT -1) begin
                //P_INPUT_CNT는 60 60 24
				r_cnt_val <= 0;
				o_tick_gen <= 1'b1;
			end else begin
				r_cnt_val <= r_cnt_val + 1'b1;
			end
	    end else begin
			o_tick_gen <= 1'b0;
		end
	end

// 즉 위에는 탑에서 초 분 시 세번 불러내는데
//분, 초 , 시 각각 어떻게 연결하느냐에따라
// 다음 모듈로 연결해줄때 1 되고 0 되고 하는용







// General cycle delay logic
genvar gi;
generate
	if(P_DELAY_OUT == 0) begin // bypass
		assign o_cnt_val = r_cnt_val;


	end else if (P_DELAY_OUT == 1) begin // 1 cycle delay
		
		
		reg [P_COUNT_BIT-1:0]		r_cnt_val_d;
		//P_COUNT_BIT 6임.
        always @(posedge clk) begin
			r_cnt_val_d <= r_cnt_val;
            //r_cnt_val은 초, 분 , 시 60 60 24카운팅하는거
		end

		assign o_cnt_val = r_cnt_val_d;
 //r_cnt_val은 초, 분 , 시 60 60 24카운팅하는거
 //즉 이거를 o_cnt_Val에 연결해줌



	end else begin  // cycle > 1
		reg [P_COUNT_BIT-1:0]		r_cnt_val_d [P_DELAY_OUT-1:0];
		always @(posedge clk) begin
			r_cnt_val_d[0] <= r_cnt_val;
		end


		
		for(gi = 1; gi < P_DELAY_OUT; gi = gi + 1) begin : gen_delay
			always @(posedge clk) begin
				r_cnt_val_d[gi] <= r_cnt_val_d[gi-1];
			end
		end
		assign o_cnt_val = r_cnt_val_d[P_DELAY_OUT-1];
	end
endgenerate

endmodule
