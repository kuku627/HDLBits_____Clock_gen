module top_module(
    input        clk,
    input      reset,
    output shift_ena
);

    reg [1:0]cnt;
    wire  cnt_en;
    always @(posedge clk) begin
        if(reset)          cnt<=    2'b0;
        else if(cnt>=2'd3) cnt<=    2'b0;
        else               cnt<=cnt+1'b1;
    end

    assign cnt_en=(cnt==2'd3);


    always @(posedge clk) begin
        if(reset)        shift_ena<=1'b1;
        else if (cnt_en) shift_ena<=1'b0;
        // else             shift_ena<=1'b1;
    end


endmodule