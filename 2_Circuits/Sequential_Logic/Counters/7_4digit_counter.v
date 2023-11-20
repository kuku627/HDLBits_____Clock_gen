module top_module(
    input clk,
    input reset,
    output [3:1]ena,
    output [15:0] q 
);
reg [3:0] temp1,temp2,temp3,temp4;
wire      ena_10,ena_100,ena_1000;

bcdcount count0(clk,reset,  1'b1, temp1);
bcdcount count1(clk,reset,ena[1], temp2);
bcdcount count2(clk,reset,ena[2], temp3);
bcdcount count3(clk,reset,ena[3], temp4);

assign   ena_10=(temp1==4'd9);
assign  ena_100=(temp2==4'd9)&&(temp1==4'd9);
assign ena_1000=(temp3==4'd9)&&(temp2==4'd9)&&(temp1==4'd9);


assign ena={ena_1000,ena_100,ena_10};
assign q=  {temp4,temp3,temp2,temp1};





endmodule

module bcdcount(
    input       clk     ,
    input       reset   ,
    input       enable  ,
    output reg[3:0] Q
);

    always @(posedge clk) begin
        if(reset) begin
            Q<=0;
        end else if (enable)begin
            
            if(Q==4'd9)begin
                Q<=0;
            end else begin 
                Q<=Q+1;
            end
        end    

    end  
            


endmodule





// module top_module(
//     input clk,
//     input reset,
//     output [3:1]ena,
//     output [15:0] q 
// );
// reg [3:0] temp1,temp2,temp3,temp4;
// wire ;

// bcdcount count0(clk,reset,  1'b1, q[ 3: 0]);
// bcdcount count1(clk,reset,ena[1], q[ 7: 4]);
// bcdcount count2(clk,reset,ena[2], q[11: 8]);
// bcdcount count3(clk,reset,ena[3], q[15:12]);


// assign ena={(q[11:8]==4'd9)&&(q[7:4]==4'd9)&&(q[3:0]==4'd9),(q[7:4]==4'd9)&&(q[3:0]==4'd9),(q[3:0]==4'd9)};


// endmodule