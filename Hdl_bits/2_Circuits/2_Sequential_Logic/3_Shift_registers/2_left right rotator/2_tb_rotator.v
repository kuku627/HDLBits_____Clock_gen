`timescale 1ns/1ps

module tb_top_module;
  reg clk;
  reg load;
  reg [1:0] ena;
  reg [99:0] data;
  wire [99:0] q;

  // 모듈 인스턴스화
  top_module DUT(
    .clk(clk),
    .load(load),
    .ena(ena),
    .data(data),
    .q(q)
  );

  // Clock Generation
  always begin
    #5 clk = ~clk;
  end

  // 초기화
  initial begin
    clk = 0;
    load = 0;
    ena = 2'b00;
    data = 100'b0;

    // 테스트 케이스 1: 로드
    #10 load = 1;
    #10 data = 100'b1010101010;
    #10 load = 0;

    // 테스트 케이스 2: 우로 1비트 회전
    #10 ena = 2'b01;

    // 테스트 케이스 3: 로드
    #10 load = 1;
    #10 data = 100'b1100110011;
    #10 load = 0;

    // 테스트 케이스 4: 좌로 1비트 회전
    #10 ena = 2'b10;

    // 종료
    #100 $finish;
  end

  // VCD 파일 생성
  initial begin
    $dumpfile("tb_top_module.vcd");
    $dumpvars(0, tb_top_module);
  end

endmodule