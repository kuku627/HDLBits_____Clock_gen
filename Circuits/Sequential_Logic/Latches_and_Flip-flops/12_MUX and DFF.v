module top_module(

    input clk,
    input w,R,E,L,
    output Q
);
    
    always @(posedge clk) begin
        Q<=L?R:E?w:Q;                

            

    end


endmodule


module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire [1:0] con = {E,L};
    always @(posedge clk) begin
        case(con) 
            2'b00: Q <= Q;
            2'b01: Q <= R;
            2'b11: Q <= R;
            2'b10: Q <= w;
        endcase
        
    end
    

endmodule