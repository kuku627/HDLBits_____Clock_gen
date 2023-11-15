module top_module(
    input clk,
    input in,
    input areset,
    output out
);

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    reg     [1:0]curr_state;
    reg     [1:0]next_state;


    always@(posedge clk or posedge areset) begin
        if(areset)  curr_state<=         A;
        else        curr_state<=next_state;

    end
    always@(*) begin
        case(curr_state)
            A:next_state=in? B:A;
            B:next_state=in? B:C;
            C:next_state=in? D:A;
            D:next_state=in? B:C;
        endcase

    end

    assign out=(curr_state==D);



endmodule