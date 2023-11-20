module top_module(
    input clk,
    input aresetn,
    input x,
    output z
);

    parameter IDLE=2'b00, RUN=2'b01, DONE=2'b10;
    reg [1:0]curr_state,next_state;

    always @(posedge clk or negedge aresetn) begin
        if(!aresetn) curr_state<=      IDLE;
        else         curr_state<=next_state;
    end 


    always @(*) begin
        case(curr_state)
        IDLE:   if(x) next_state= RUN;
                else  next_state=IDLE;

        RUN :   if(x) next_state= RUN;
                else  next_state=DONE;

        DONE:   if(x) next_state= RUN;
                else  next_state=IDLE;
        endcase
    end
    assign z=((curr_state==DONE)&(x));


endmodule