module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
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

    always@(posedge clk) begin
        if(reset) out_bytes<='h0;
        else      out_bytes<={out_bytes[15:0],in};// 좋은 알고리즘
    end

    assign done=(curr_state==DONE);
    
    


endmodule