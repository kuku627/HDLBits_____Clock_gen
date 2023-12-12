module tb_andgate();
    reg [1:0] in;
    wire out;
    andgate inst1(in,out);

    initial begin
        in = 2'b00;
        #10
        in = 2'b01;
        #10
        in = 2'b10;
        #10
        in = 2'b11;
    end
    
endmodule