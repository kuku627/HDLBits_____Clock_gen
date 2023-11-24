module top_module (
    input [3:1] y,
    input w,
    output Y2
    
);

    parameter A=3'b000,
              B=3'b001,
              C=3'b010,
              D=3'b011,
              E=3'b100;
              F=3'b101;
    reg  [2:0]next_state;


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