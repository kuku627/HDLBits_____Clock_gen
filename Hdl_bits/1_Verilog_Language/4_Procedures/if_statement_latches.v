module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
           shut_off_computer = 0;// 추가: 과열되지 않은 경우 컴퓨터를 끄지 않음
    end

    always @(*) begin
        if (arrived | gas_tank_empty)
           keep_driving = 0; // 추가: 도착했거나 연료가 떨어진 경우 운전을 멈춤
        else
           keep_driving = 1; 
    end
    

endmodule