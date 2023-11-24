module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    reg                                [1:0]curr_state,next_state;
    parameter    LEFT=2'b00,FALL_L=2'b01,RIGHT=2'b10,FALL_R=2'b11;
    always@(posedge clk or posedge areset) begin
        if(areset)  curr_state<=      LEFT;
        else        curr_state<=next_state;

    end

    always @(*) begin

        case(curr_state)
            LEFT  : if(ground) next_state = bump_left  ? RIGHT:  LEFT;
                    else          next_state = FALL_L;
            RIGHT : if(ground) next_state = bump_right ?  LEFT: RIGHT;
                    else          next_state = FALL_R;

            FALL_L: if(ground) next_state=  LEFT;
                    else       next_state=FALL_L;
                    
            FALL_R: if(ground) next_state= RIGHT;
                    else       next_state=FALL_R;

       
        endcase


    end

    assign  walk_left  = (curr_state== LEFT);
    assign walk_right  = (curr_state==RIGHT);
    assign       aaah  = (curr_state==FALL_L)|(curr_state==FALL_R);

    endmodule