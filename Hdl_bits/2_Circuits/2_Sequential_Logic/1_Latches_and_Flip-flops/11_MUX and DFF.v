module top_module (
	input clk,
	input L,//먹스 인풋
	input r_in,
	input q_in,
	output reg Q);

    wire mux_out; // 플립플롭에 들어갈 데이터 D
    assign mux_out= L? r_in:q_in;

    always @(posedge clk) begin
        Q<=mux_out;
        

    end

// assign Q=q; //플립플롭의 내부 q를 출력포트 아웃 Q에 연결
endmodule





