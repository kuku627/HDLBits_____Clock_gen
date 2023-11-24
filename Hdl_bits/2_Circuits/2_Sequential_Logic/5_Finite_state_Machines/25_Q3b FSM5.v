module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter A=3'b000,
              B=3'b001,
              C=3'b010,
              D=3'b011,
              E=3'b100;
    reg  [2:0]curr_state,next_state;


    always @(posedge clk) begin
        if(reset) curr_state<=         A;
        else      curr_state<=next_state;        
    end


    always @(*) begin;
        case(curr_state)
            A      :next_state= x? B:A;
            B      :next_state= x? E:B;
            C      :next_state= x? B:C;
            D      :next_state= x? C:B;
            E      :next_state= x? E:D;
            default:next_state= A;
        endcase
    end

    assign z=(curr_state==D)|(curr_state==E);

endmodule