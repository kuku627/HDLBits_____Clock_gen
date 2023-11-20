module top_module(
    input [255:0]in,
    input [7:0] sel,
    output wire out
);

assign out=in[sel];

        // 8'd0:out=in[0];
        // 8'd1:out=in[1];
        // 8'd2:out=in[2];
        // 8'd3:out=in[3];
        // 8'd4:out=in[4];
        // 8'd5:out=in[5];
        
        
        




endmodule