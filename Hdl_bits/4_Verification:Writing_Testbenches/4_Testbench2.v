module tb_q7();
    reg     clk;
    reg      in;
    reg [2:0] s;
    wire    out;

    q7 inst1 (clk, in, s, out);

    always begin
        #5clk=~clk;
    end


    initial begin 
        clk=0;
        in=0;
        s=3'd2;

    end

    initial begin
        #20 in=1;
        #10 in=0;
        #10 in=1;
        #30 in=0;
        
    end

    initial begin
        #10 s=3'd6;
        #10 s=3'd2;
        #10 s=3'd7;
        #10 s=3'd0;

    end


endmodule


