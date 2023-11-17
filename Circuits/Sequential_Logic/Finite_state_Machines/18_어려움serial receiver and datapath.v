module top_module(
    input clk,
    input in,
    input reset,
    output reg [7:0] out_byte,
    output done
);

    parameter IDLE=2'b00,
              READ=2'b01,
              ERR =2'b10,
              DONE=2'b11;

    reg  [1:0] curr_state, next_state;
    // reg  [7:0] out_byte;
    reg  [3:0] cnt;

    wire cnt_en;

    assign cnt_en=(cnt==4'd8);
    reg [3:0]temp;


    always@ (posedge clk) begin
        if(reset) curr_state<=      IDLE;
        else      curr_state<=next_state;
    end


    always@ (posedge clk) begin
        if(reset) cnt<=4'b0;
        else if ((curr_state==READ)) cnt<=cnt+1'b1;
        else      cnt<=4'b0;

    end


    always@(*) begin
        case(curr_state)
            IDLE:   if(in) next_state=IDLE;
                    else   next_state=READ;
            
            READ:   if(cnt_en) 
                        if(in) next_state=DONE;
                        else   next_state= ERR;
                    
                    else       next_state=READ;

            ERR :  if(in) next_state=IDLE;
                   else   next_state= ERR;
            
            DONE:  if(in) next_state=IDLE;
                   else   next_state=READ;

            // default:      next_state=IDLE;
        endcase
    end

    always @(posedge clk) begin
        if(reset)                  temp<= 8'b0;
        else if (curr_state==READ) temp[cnt]<=in;

    end

    assign out_byte=temp;

    assign done=(curr_state==DONE);


endmodule