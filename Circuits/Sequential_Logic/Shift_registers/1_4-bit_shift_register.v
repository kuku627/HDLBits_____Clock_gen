module top_module(
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0]data,
    output reg [3:0]q
);



    always @(posedge clk or posedge areset) begin
        if(areset) begin
            q<=data;
        
        else 
            q<=0;

        end


        if(ena) begin
            q<={q[2:0],q[3]};
        end


        
        if(load) begin
            q<=data;
        end
    
        
        

    end


    endmodule
