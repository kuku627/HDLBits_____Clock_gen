module top_module(
    input clk,
    input reset,
    input [7:0]in,
    output done


);

    parameter BYTE1=2'b00,
              BYTE2=2'b01,
              BYTE3=2'b10,
              DONE =2'b11;
    
    reg [1:0]curr_state, next_state;

    always@(posedge clk) begin
        if(reset) curr_state<=       BYTE1;
        else      curr_state<=  next_state;
    end 

    always @(*) begin
        case(curr_state)
        BYTE1: next_state= in[3]? BYTE2:BYTE1;
        BYTE2: next_state=              BYTE3;
        BYTE3: next_state=               DONE;
        DONE : next_state= in[3]? BYTE2:BYTE1;
        endcase
    end

    assign done=(curr_state==DONE);






endmodule