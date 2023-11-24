module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q
    );

    
// 0000
// 0001
// 0010
// 0100
// 1001


// case1:
    always @(posedge clk) begin
        if(shift_ena)      q<={q[2:0],data};
        else if(count_ena) q<=       q-1'b1;
        else               q<=            q;
    end
// case 2:
    always @(posedge clk) begin
        case({shift_ena,count_ena})
            2'b00: q<=            q;
            2'b01: q<=       q-1'b1;
            2'b10: q<={q[2:0],data};
            2'b11: q<=            q;



        endcase
    end

endmodule