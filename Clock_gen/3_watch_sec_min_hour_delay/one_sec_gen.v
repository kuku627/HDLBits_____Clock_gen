
module one_sec_gen(
    clk,
    reset,
	i_run_en,
	i_freq,
    o_one_sec_tick
    );
parameter P_COUNT_BIT = 30; 
input 						clk;
input 						reset;
input 						i_run_en;
input [P_COUNT_BIT-1:0]		i_freq;
output reg					o_one_sec_tick;

	reg 	[P_COUNT_BIT-1:0] 	r_counter; 
	//r_counter 30비트 ifreq가 1MHz 되면 1초임.
	// 왜냐면 timescale 1ns로 했고,
	// always #5 clk=~clk; 했으니까
	//주기는 10 ns임.
	// 100MHz 역수 취하면 10ns니까.

	always @(posedge clk) begin
	    if(reset) begin
			r_counter <= {P_COUNT_BIT{1'b0}};
			o_one_sec_tick <= 1'b0;
	    end else if (i_run_en) begin
			if(r_counter == i_freq -1) begin
				r_counter <= 0; //r_counter 100메가 되면
				o_one_sec_tick <= 1'b1;
			end else begin
				r_counter <= r_counter + 1'b1;
				o_one_sec_tick <= 1'b0;
			end
		end else begin
			o_one_sec_tick <= 1'b0;
		end
	end
endmodule