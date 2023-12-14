`include "./param_conv.v"

module conv (
	input CLK,
	input signed [`BIT_DATA-1:0] Data_I_0,
	input signed [`BIT_DATA-1:0] Data_I_1,
	input signed [`BIT_DATA-1:0] Data_I_2,
	input signed [`BIT_DATA-1:0] Data_I_3,
	input signed [`BIT_DATA-1:0] Data_I_4,
	input signed [`BIT_DATA-1:0] Data_I_5,
	input signed [`BIT_DATA-1:0] Data_I_6,
	input signed [`BIT_DATA-1:0] Data_I_7,
	input signed [`BIT_DATA-1:0] Data_I_8,
	output signed [`BIT_PSUM-1:0] Psum_Out
);

// wire [`BIT_DATA-1:0] Data_L [`PE_ROW-1:0];
// wire [`BIT_PSUM-1:0] Psum [`PE_ROW-1:-0];
wire [`BIT_DATA-1:0] Data_L [0:`PE_ROW-1];
wire [`BIT_PSUM-1:0] Psum [0:`PE_ROW-1];

loader loader_i (
					// Loader inputs
					.CLK(CLK),
					.I_0(Data_I_0), .I_1(Data_I_1), .I_2(Data_I_2), .I_3(Data_I_3),
					.I_4(Data_I_4), .I_5(Data_I_5), .I_6(Data_I_6), .I_7(Data_I_7),
					.I_8(Data_I_8),
					// Loader outputs
					.L_0(Data_L[0]), .L_1(Data_L[1]), .L_2(Data_L[2]), .L_3(Data_L[3]),
					.L_4(Data_L[4]), .L_5(Data_L[5]), .L_6(Data_L[6]), .L_7(Data_L[7]),
					.L_8(Data_L[8])
				);

pe pe_0_0 ( 
			.CLK(CLK), 
			.Data_I_In(Data_L[0]), .Data_W_In(`BIT_DATA'd1),
			.Psum_In(`BIT_PSUM'd0), .Psum_Out(Psum[0])
		);

pe pe_1_0 ( 
			.CLK(CLK), 
			.Data_I_In(Data_L[1]), .Data_W_In(`BIT_DATA'd2),
			.Psum_In(Psum[0]), .Psum_Out(Psum[1])
		);

pe pe_2_0 ( 
			.CLK(CLK), 
			.Data_I_In(Data_L[2]), .Data_W_In(`BIT_DATA'd1),
			.Psum_In(Psum[1]), .Psum_Out(Psum[2])
		);

pe pe_3_0 ( 
			.CLK(CLK),
			.Data_I_In(Data_L[3]), .Data_W_In(`BIT_DATA'd0),
			.Psum_In(Psum[2]), .Psum_Out(Psum[3])
		);

pe pe_4_0 ( 
			.CLK(CLK), 
			.Data_I_In(Data_L[4]), .Data_W_In(`BIT_DATA'd0),
			.Psum_In(Psum[3]), .Psum_Out(Psum[4])
		);

pe pe_5_0 ( 
			.CLK(CLK),
			.Data_I_In(Data_L[5]), .Data_W_In(`BIT_DATA'd0),
			.Psum_In(Psum[4]), .Psum_Out(Psum[5])
		);

pe pe_6_0 ( 
			.CLK(CLK),
			.Data_I_In(Data_L[6]), .Data_W_In(-`BIT_DATA'd1),
			.Psum_In(Psum[5]), .Psum_Out(Psum[6])
		);

pe pe_7_0 (
			.CLK(CLK), 
			.Data_I_In(Data_L[7]), .Data_W_In(-`BIT_DATA'd2),
			.Psum_In(Psum[6]), .Psum_Out(Psum[7])
		);

pe pe_8_0 (
			.CLK(CLK),
			.Data_I_In(Data_L[8]), .Data_W_In(-`BIT_DATA'd1),
			.Psum_In(Psum[7]), .Psum_Out(Psum[8])
		);

assign Psum_Out = Psum[8];
endmodule
