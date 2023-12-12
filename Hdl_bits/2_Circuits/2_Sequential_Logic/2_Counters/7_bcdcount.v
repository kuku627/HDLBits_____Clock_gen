
module bcdcount(
    input       clk     ,
    input       reset   ,
    input       enable  ,
    output reg[3:0] Q
);

    always @(posedge clk) begin
        if(reset) begin
            Q<=0;
        end else if (enable)begin
            
            if(Q==4'd9)begin
                Q<=0;
            end else begin 
                Q<=Q+1;
            end
        end    

    end  
            


endmodule
