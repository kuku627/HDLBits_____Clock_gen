module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    reg [1:0]curr_state,next_state;
    reg [2:0] temp;

    always @(posedge clk) begin
        if(reset) curr_state<=A;
        else      curr_state<=next_state;
    end


    always @(*) begin
        case(curr_state)
            A      :  next_state= s? B:A;
            B      :  next_state= C;
            C      :  next_state= D;
            D      :  next_state= B;             
            default:  next_state= A;
        endcase
    end



    always @(posedge clk) begin
        if(reset)     temp<=3'b0;
        else if(!(curr_state==A))  temp<={temp[1:0],w}; 
        else          temp<=3'b0;
    end

    assign z=(curr_state==B)&((temp==3'b101)|
                              (temp==3'b011)|
                              (temp==3'b110));



endmodule