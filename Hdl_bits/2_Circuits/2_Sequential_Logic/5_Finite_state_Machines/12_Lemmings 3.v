module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging 
    );




    reg                                [2:0]curr_state,next_state;
    parameter   LEFT    = 0,
                DIG_L   = 1,
                FALL_L  = 2,
                RIGHT   = 3,
                DIG_R   = 4,
                FALL_R  = 5;
               
    always@(posedge clk or posedge areset) begin
        if(areset)  curr_state<=      LEFT;
        else        curr_state<=next_state;

    end

    always @(*) begin

        case(curr_state)
            LEFT  : if        (!ground)  next_state =  FALL_L;
                    else if       (dig)  next_state =   DIG_L;
                    else if (bump_left)  next_state =   RIGHT;
                    else                 next_state =    LEFT;

            DIG_L:  if        (!ground)  next_state =  FALL_L;
                    else if       (dig)  next_state =   DIG_L;
                    else                 next_state =   DIG_L;

            FALL_L: if        (!ground)  next_state =  FALL_L;
                    else                 next_state =    LEFT;
                                        
            RIGHT : if        (!ground)  next_state =  FALL_R;
                    else if       (dig)  next_state =   DIG_R;
                    else if(bump_right)  next_state =    LEFT;
                    else                 next_state =   RIGHT;



            FALL_R: if        (!ground)  next_state =  FALL_R;
                    else                 next_state =   RIGHT;
            

            DIG_R:  if        (!ground)  next_state =  FALL_R;
                    else if       (dig)  next_state =   DIG_R;
                    else                 next_state =   DIG_R;
       
        endcase


    end

    assign  walk_left  = (curr_state== LEFT);
    assign walk_right  = (curr_state==RIGHT);
    assign       aaah  = (curr_state==FALL_L)|(curr_state==FALL_R);
    assign    digging  =(curr_state == DIG_L)|(curr_state== DIG_R);

    endmodule