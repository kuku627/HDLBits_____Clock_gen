module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [3:0]cnt;
    wire  cnt_en;
    assign cnt_en=(cnt==4'd8);
    parameter   IDLE =2'b00,
                READ =2'b01,
                ERR  =2'b10,
                DONE =2'b11;

    reg    [1:0]curr_state,next_state;

    always @(posedge clk) begin
        if(reset) curr_state<=      IDLE;
        else      curr_state<=next_state;
    end
    always @(posedge clk) begin
        if(reset)                          cnt<=    4'b0;
        else if(curr_state==READ)             cnt<=cnt+1'b1;
        else                               cnt<=    4'b0;
    end

    always @(*) begin
        case(curr_state)
            IDLE :  if(in) next_state<=IDLE;
                    else   next_state<= READ;

            READ :  if(cnt_en) begin
                        if(in) next_state<=DONE;         
                        else   next_state<= ERR;
                    end 
                    else   next_state<=READ;

            ERR  : next_state<=      in? IDLE:  ERR;
            DONE : next_state<=      in? IDLE: READ;


        endcase
    
    end
    assign done=(curr_state==DONE);



endmodule