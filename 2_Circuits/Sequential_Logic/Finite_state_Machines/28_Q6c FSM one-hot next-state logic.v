module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4
    
);

    parameter A=6'b000001,
              B=6'b000010,
              C=6'b000100,
              D=6'b001000,
              E=6'b010000;
              F=6'b100000;
    reg  [5:0]next_state;


    // always @(posedge clk) begin
    //     if(reset) y<=         A;
    //     else      y<=next_state;        
    // end


    always @(*) begin;
        case(y)
            A      :next_state= w? A:B;
            B      :next_state= w? D:C;
            C      :next_state= w? D:E;
            D      :next_state= w? A:F;
            E      :next_state= w? D:E;
            F      :next_state= w? D:C;
            default:next_state= A;
        endcase
    end

    assign Y2=(y=E)|(y=F);

endmodule