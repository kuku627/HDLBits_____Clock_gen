module top_module (
    input clock,
    input a,
    output p,
    output q );


    always@(*) begin  //래치
        if(clock) p=a;
    end
    always@(negedge clock) begin // 플립
        q<=a;

    end






endmodule

