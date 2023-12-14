`include "./param_conv.v"
//
module pe (
	input CLK,
	input signed [`BIT_DATA-1:0] Data_I_In,
	input signed [`BIT_DATA-1:0] Data_W_In,
	input signed [`BIT_PSUM-1:0] Psum_In,
//	output reg signed [`BIT_DATA-1:0] Data_I_Out,
	output reg signed [`BIT_PSUM-1:0] Psum_Out
);

always @ (posedge CLK) begin
	// Data_I_Out <= Data_I_In;

	Psum_Out <= Data_I_In * Data_W_In + Psum_In;
end

endmodule
