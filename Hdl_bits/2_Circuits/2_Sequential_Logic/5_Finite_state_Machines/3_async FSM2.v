module top_module(
    input clk,
    input areset,    // Synchronous reset to state B
    input j,
    input k,
    output out


);
    parameter OFF=1'b0, ON=1'b1;
    reg curr_state, next_state;


    always @(posedge clk or posedge areset) begin
        if (areset) curr_state<=OFF;
        else        curr_state<=next_state;  
    end


    always @(*) begin
        case(curr_state)
            OFF: next_state=j?   ON:OFF;
            ON:  next_state=k?  OFF: ON;


        endcase
    end

    assign out=(curr_state==ON);








endmodule