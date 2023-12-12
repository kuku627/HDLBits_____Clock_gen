module top_module(
    input [7:0]in,
    output reg [2:0]pos

);

//배운점
//자꾸 8'b111111을 8b'1111로 씀

    // always @(*) begin
    //     casez(in) 
    //         8b'zzzzzzz1:pos=3'b000;
    //         8b'zzzzzz1z:pos=3'b001;
    //         8b'zzzzz1zz:pos=3'b010;
    //         8b'zzzz1zzz:pos=3'b011;
    //         8b'zzz1zzzz:pos=3'b100;
    //         8b'zz1zzzzz:pos=3'b101;
    //         8b'z1zzzzzz:pos=3'b110;
    //         8b'1zzzzzzz:pos=3'b111;
    //         default:    pos=3'b000;
    //     endcase

    // end

    always @(*) begin
        casez(in) 
           8'bzzzzzzz1:pos=3'b000;
           8'bzzzzzz1z:pos=3'b001;
           8'bzzzzz1zz:pos=3'b010;
           8'bzzzz1zzz:pos=3'b011;
           8'bzzz1zzzz:pos=3'b100;
           8'bzz1zzzzz:pos=3'b101;
           8'bz1zzzzzz:pos=3'b110;
           8'b1zzzzzzz:pos=3'b111;
            default:    pos=3'b000;
        endcase

    end

endmodule