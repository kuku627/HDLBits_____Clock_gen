module top_module(
    input d,
    input clk,
    input r,
    output q
);
    reg q;
    always @(posedge clk) begin
        if (r)
            q<=0;
        else
            q<=d;
    end

endmodule