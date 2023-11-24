module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 


//배운점 {}이거로 전부 한번에 할당가능
    always @(*) begin
        {up,down,right,left}=1'b0;
        
        case(scancode)
        16'he06b: left=1'b1;
        16'he072: down=1'b1;
        16'he074: right=1'b1;
        16'he075: up=1'b1;
        default: {up,down,right,left}=1'b0;
        default: {up,down,right,left}=1'b0;
//위에 default 줄 주석해도됨.
        

        endcase

    end




endmodule