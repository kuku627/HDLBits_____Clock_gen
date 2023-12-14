`include "./param_conv.v"

module loader(
	input CLK,
	input [`BIT_DATA-1:0] I_0,
	input [`BIT_DATA-1:0] I_1,
	input [`BIT_DATA-1:0] I_2,
	input [`BIT_DATA-1:0] I_3,
	input [`BIT_DATA-1:0] I_4,
	input [`BIT_DATA-1:0] I_5,
	input [`BIT_DATA-1:0] I_6,
	input [`BIT_DATA-1:0] I_7,
	input [`BIT_DATA-1:0] I_8,
	output reg [`BIT_DATA-1:0] L_0,
	output reg [`BIT_DATA-1:0] L_1,
	output reg [`BIT_DATA-1:0] L_2,
	output reg [`BIT_DATA-1:0] L_3,
	output reg [`BIT_DATA-1:0] L_4,
	output reg [`BIT_DATA-1:0] L_5,
	output reg [`BIT_DATA-1:0] L_6,
	output reg [`BIT_DATA-1:0] L_7,
	output reg [`BIT_DATA-1:0] L_8
);

reg [`BIT_DATA-1:0] L_1_FIFO [0:0];
reg [`BIT_DATA-1:0] L_2_FIFO [0:1];
reg [`BIT_DATA-1:0] L_3_FIFO [0:2];
reg [`BIT_DATA-1:0] L_4_FIFO [0:3];
reg [`BIT_DATA-1:0] L_5_FIFO [0:4];
reg [`BIT_DATA-1:0] L_6_FIFO [0:5];
reg [`BIT_DATA-1:0] L_7_FIFO [0:6];
reg [`BIT_DATA-1:0] L_8_FIFO [0:7];

always @ (posedge CLK) begin
	// first input
	L_0 <= I_0;

	L_1_FIFO[0] <= I_1;
	L_1 <= L_1_FIFO[0];


	L_2_FIFO[0] <= I_2;
	L_2_FIFO[1] <= L_2_FIFO[0];
	L_2 <= L_2_FIFO[1];
	
	L_3_FIFO[0] <= I_3;
	L_3_FIFO[1] <= L_3_FIFO[0];
	L_3_FIFO[2] <= L_3_FIFO[1];
	L_3 <= L_3_FIFO[2];

	    L_4_FIFO[0] <= I_4;
    L_4_FIFO[1] <= L_4_FIFO[0];
    L_4_FIFO[2] <= L_4_FIFO[1];
    L_4_FIFO[3] <= L_4_FIFO[2];
    L_4 <= L_4_FIFO[3];

    L_5_FIFO[0] <= I_5;
    L_5_FIFO[1] <= L_5_FIFO[0];
    L_5_FIFO[2] <= L_5_FIFO[1];
    L_5_FIFO[3] <= L_5_FIFO[2];
    L_5_FIFO[4] <= L_5_FIFO[3];
    L_5 <= L_5_FIFO[4];

    L_6_FIFO[0] <= I_6;
    L_6_FIFO[1] <= L_6_FIFO[0];
    L_6_FIFO[2] <= L_6_FIFO[1];
    L_6_FIFO[3] <= L_6_FIFO[2];
    L_6_FIFO[4] <= L_6_FIFO[3];
    L_6_FIFO[5] <= L_6_FIFO[4];
    L_6 <= L_6_FIFO[5];

    L_7_FIFO[0] <= I_7;
    L_7_FIFO[1] <= L_7_FIFO[0];
    L_7_FIFO[2] <= L_7_FIFO[1];
    L_7_FIFO[3] <= L_7_FIFO[2];
    L_7_FIFO[4] <= L_7_FIFO[3];
    L_7_FIFO[5] <= L_7_FIFO[4];
    L_7_FIFO[6] <= L_7_FIFO[5];
    L_7 <= L_7_FIFO[6];

    L_8_FIFO[0] <= I_8;
    L_8_FIFO[1] <= L_8_FIFO[0];
    L_8_FIFO[2] <= L_8_FIFO[1];
    L_8_FIFO[3] <= L_8_FIFO[2];
    L_8_FIFO[4] <= L_8_FIFO[3];
    L_8_FIFO[5] <= L_8_FIFO[4];
    L_8_FIFO[6] <= L_8_FIFO[5];
    L_8_FIFO[7] <= L_8_FIFO[6];
    L_8 <= L_8_FIFO[7];
end
endmodule
