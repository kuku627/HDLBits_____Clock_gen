module top_module(
    input [99:0]in,
    output reg [99:0]out);

//reg는 always쓰면 써주기
    integer i;
   
   always @(*) begin
        for(i=0;i<100;i++) begin //이거도가능
             out[i]=in[99-i];
        end
   
        // for(i=0;i<100;i=i+1) begin
        //     out[i]=in[99-i];
        // end
   
   end



endmodule
          




