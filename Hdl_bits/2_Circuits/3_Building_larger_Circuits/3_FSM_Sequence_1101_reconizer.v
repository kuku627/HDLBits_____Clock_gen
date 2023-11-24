

module top_module(
    input clk,
    input reset,
    input data,
    output start_shifting
);



    parameter  A=    3'b000,
               B=    3'b001,
               C=    3'b010,
               D=    3'b011,
               DONE= 3'b100;
    reg    [2:0]curr_state,next_state;

    always @(posedge clk) begin
        if(reset) curr_state<=         A;
        else      curr_state<=next_state;
    end

    always @(*) begin
        case(curr_state)
            A   :    next_state= data?     B:A;
            B   :    next_state= data?     C:A;
            C   :    next_state= data?     C:D;
            D   :    next_state= data?  DONE:A;
            DONE:    next_state=          DONE;
            default: next_state=             A;
        endcase
    end


    assign start_shifting=(curr_state==DONE);


endmodule