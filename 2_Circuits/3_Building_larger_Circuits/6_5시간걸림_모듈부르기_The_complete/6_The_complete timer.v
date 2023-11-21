
module top_module (
    input              clk,
    input            reset,      // Synchronous reset
    input             data,
    input              ack,

    output      [3:0]count,
    output        counting,
    output            done
     );
    
    wire         shift_ena;
    wire         count_ena;
    wire [9:0]  count_1000;
    wire        COUNT_done;

    assign shift_ena=        (curr_state==SHIFT_0)|
                             (curr_state==SHIFT_1)|
                             (curr_state==SHIFT_2)|
                             (curr_state==SHIFT_3);
    assign count_ena=        (count_1000==10'd999);
    //우선 counting 웨이브폼은 1로 되어있어야함
    //counting은 curr_state가 COUNT면 계속 1인데.
    //count_ena까지 curr_state가 COUNT일때면 
    // SHIFT 인스턴스땜에 [3:0]count가 계속 깎일거임.
    //그럼 2천사이클이라 치면 전부 다깎음.
    // 1천의 마지막, 2천의 마지막에만 깎아야함.
    //==> count_ena=(count_1000==10'd999);



    //curr_state==COUNT상태면 계속해서 coutn_ena가
    //활성화 되어있어서 


    // assign COUNT_done=((count_ena)&&(count==4'd0));
    assign COUNT_done=((count_1000==10'd999)&&(count==4'd0));
    // [3:0]count가 0이되면서 999 되면 활성화시키고 끝냄.
    // 둘다 만족해야지 count가 4일경우 5천사이클돌수있음.
    


//카운터로 넘어온 직후..
// counting이 1이되면 count_1000도 초기화.
// [3:0]count이 1이면 
// 일단 count_1000을 0으로 초기화.

// count_1000을 999까지 채우면 
// count-1되고

// count==0이 되는거 +count_1000이 999가 되면
// state가 WAIT으로 감. 




/////////////////////////////////////////////////
//////모듈 부르기/////////////////////////////////
/////////////////////////////////////////////////
    // input clk,
    // input reset,
    // output reg[9:0]q
    counter1000 count1000(
        .clk                   (clk),
        .reset               (reset),
        .counting         (counting),
        .q              (count_1000) 
    );
    
    shfit_regi      shift(
    // input clk,
    // input shift_ena,
    // input count_ena,
    // input data,
    // output reg[3:0] q
        .clk            (clk),
        .shift_ena(shift_ena),
        .count_ena(count_ena),
        .data          (data),
        .q            (count)

    );
/////////////////////////////////////////////////
////////////////////////////////////////////////////
/////////////////////////////////////////////////



    parameter   S       =    4'd0,
                S1      =    4'd1,
                S11     =    4'd2,
                S110    =    4'd3,
                SHIFT_0 =    4'd4,
                SHIFT_1 =    4'd5,
                SHIFT_2 =    4'd6,
                SHIFT_3 =    4'd7,
                COUNT   =    4'd8,
                WAIT    =    4'd9;         

    reg    [3:0] curr_state,next_state;


    always @(posedge clk) begin
        if(reset) curr_state<=         S;
        else      curr_state<=next_state;
    end


    always @(*) begin
        case(curr_state)
            S      :    next_state= data?       S1    :     S;
            S1     :    next_state= data?      S11    :     S;
            S11    :    next_state= data?      S11    :  S110;
            S110   :    next_state= data?  SHIFT_0    :     S;
          
            SHIFT_0:    next_state=                   SHIFT_1;
            SHIFT_1:    next_state=                   SHIFT_2;
            SHIFT_2:    next_state=                   SHIFT_3;
            SHIFT_3:    next_state=                     COUNT;
          
            COUNT  :    next_state=(COUNT_done)?   WAIT:COUNT;


            WAIT   :    next_state=ack?              S:  WAIT;
            default:    next_state=                         S;
        endcase
    end


    assign counting  =(curr_state==COUNT);

    assign done      =(curr_state== WAIT);


endmodule





module shfit_regi (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output reg[3:0] q
    );

    

    always @(posedge clk) begin
        case({shift_ena,count_ena})
            2'b00: q<=            q;
            2'b01: q<=       q-1'b1;
            2'b10: q<={q[2:0],data};
            2'b11: q<=            q;

        endcase
    end

endmodule





module counter1000(
    input clk,
    input reset,
    input counting,
    output reg[9:0]q

);
    // reg [9:0] q;

    always@(posedge clk) begin
        if     (reset)                q<= 10'b0;
        else if((q>=10'd999))         q<= 10'b0;
        else if(counting)             q<=q+1'b1;
//curr_state==COUNT가 될때 초기화가아니라
//그때만 세어주면됨
    end


endmodule
