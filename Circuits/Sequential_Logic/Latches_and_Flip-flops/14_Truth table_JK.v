module top_module(

    input clk,
    input j,k,
    output reg Q
);
    reg temp[1:0];

    assign temp={j,k};
    // reg Q;
    always @(posedge clk) begin
        case(temp)
            2'b00: Q<=Q;
            2'b01: Q<=1'b0;
            2'b10: Q<=1'b1;
            2'b11: Q<=~Q;


        endcase
    end

endmodule