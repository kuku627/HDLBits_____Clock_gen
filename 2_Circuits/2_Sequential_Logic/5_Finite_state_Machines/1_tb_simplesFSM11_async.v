`timescale 1ns/1ps  // 시뮬레이션 스케일 정의

module tb_top_module;

    // 입력 및 출력 포트 정의
    reg clk;
    reg areset;
    reg in;
    wire out;

    // DUT (Design Under Test) 모듈 인스턴스화
    top_module uut (
        .clk(clk),
        .areset(areset),
        .in(in),
        .out(out)
    );

    // clock 생성
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 테스트 케이스 생성
    initial begin
        // 초기화
        areset <= 1;
        in <= 0;
        
        // 테스트 시작
        
        #40 areset <= 0;
        in<=1;
        #40 areset<=1;

        #40 areset<=0;
        
        // 시뮬레이션 시간이 지남에 따라 입력 변경 및 결과 확인
        #10 in = 1;
        #30 in = 0;
        #30 in=1;
        // #10 in = 1;

        // 종료
        #30 $finish;
    end

    // 시뮬레이션 결과 덤프 설정
    initial begin
        $dumpfile("dump.vcd");    // 덤프 파일 이름 설정
        $dumpvars(0, tb_top_module);  // 덤프할 변수 설정
    end

endmodule
