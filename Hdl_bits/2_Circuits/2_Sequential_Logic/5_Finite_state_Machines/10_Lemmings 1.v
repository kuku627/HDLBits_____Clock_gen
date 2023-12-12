module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);


    reg curr_state,next_state;
    parameter LEFT=1'b0,RIGHT=1'b1;
    always@(posedge clk or posedge areset) begin
        if(areset)  curr_state<=      LEFT;
        else        curr_state<=next_state;

    end

    // always @(*) begin

    //     case(curr_state)
    //         LEFT :next_state=bump_left ? RIGHT: LEFT;
    //         RIGHT:next_state=bump_right?  LEFT:RIGHT;
    //     endcase
    // end

   always @ (*) begin
        case (curr_state)
            LEFT    :   if (bump_left)  next_state = RIGHT;
                        else            next_state = LEFT;
            RIGHT   :   if (bump_right) next_state = LEFT;
                        else            next_state = RIGHT;
        endcase
    end

    assign  walk_left  = (curr_state== LEFT);
    assign walk_right  = (curr_state==RIGHT);


    endmodule