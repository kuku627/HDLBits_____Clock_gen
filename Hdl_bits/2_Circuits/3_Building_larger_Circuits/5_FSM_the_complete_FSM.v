
module top_module (
    input             clk,
    input           reset,      // Synchronous reset
    input            data,
    input             ack,
    input   done_counting,

    output      shift_ena,
    output       counting,
    output           done
     );


    parameter  S     =    4'd0,
               S1    =    4'd1,
               S11   =    4'd2,
               S110  =    4'd3,
               B0    =    4'd4,
               B1    =    4'd5,
               B2    =    4'd6,
               B3    =    4'd7,
               COUNT =    4'd8,
               WAIT  =    4'd9;         

    reg    [3:0] curr_state,next_state;


    always @(posedge clk) begin
        if(reset) curr_state<=         S;
        else      curr_state<=next_state;
    end

    always @(*) begin
        case(curr_state)
            S    :    next_state= data?       S1    :     S;
            S1   :    next_state= data?      S11    :     S;
            S11  :    next_state= data?      S11    :  S110;
            S110 :    next_state= data?       B0    :     S;
          
            B0   :    next_state=                        B1;
            B1   :    next_state=                        B2;
            B2   :    next_state=                        B3;
            B3   :    next_state=                     COUNT;
          
            COUNT:    next_state=done_counting? WAIT: COUNT;
            WAIT :    next_state=ack?              S:  WAIT;
            default:  next_state=                         S;
        endcase
    end


    assign shift_ena     =(curr_state==B0)|
                          (curr_state==B1)|
                          (curr_state==B2)|
                          (curr_state==B3);
    assign counting      =(curr_state==COUNT);
    assign done          =(curr_state== WAIT);


endmodule