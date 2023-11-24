module top_module(
    input d,
    input clk,
    input ar,
    output q
);
    reg q;
    always @(posedge clk or posedge ar) begin
        if (ar)
            q<=0;
        else
            q<=d;
    end

endmodule