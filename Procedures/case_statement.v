//1.여기 회로에서 case 뒤에 :할때 라인 줄띄우기
//2. 비트 우선 b000을 표현하는데 1'b000이라함
// 3'b000이라해야맞음
////3. default도 해야함


//1
//이 회로 입력 data 0~5 6개 인데
//먹스 6:1에 들어가서 선택하는거 상상하자

module top_module(
    input [2:0]sel,
    input [3:0]data0,data1,data2,data3,data4,data5,
    output reg [3:0]out

);

always @(*) begin
    case(sel) 
        3'b000:out=data0;
        3'b001:out=data1;
        3'b010:out=data2;
        3'b011:out=data3;
        3'b100:out=data4;
        3'b101:out=data5;
        default:out=4'b0000;
    //왜 4'b0000은 data 4비트짜리를 아웃 4비트에 넣어주니까
    //이에 해당하는 0은 4'b0000임
    // ; 잊지말자
    endcase

end

//1. 우선 b000을 표현하는데 1'b000이라함
// 3'b000이라해야맞음

//2.
//밑에꺼는 case에 라인 안맞춘거. 처음에 내가한거


//3. default도 해야함


// always @(*) begin
//     case(sel) 
//     1'b000:out=data0;
//     1'b001:out=data1;
//     1'b010:out=data2;
//     1'b011:out=data3;
//     1'b100:out=data4;
//     1'b101:out=data5;
//     default:out=4'b0000;
//     endcase

// end






//이건 어차피 6:1 먹스니까 
// 101 뒤에 110 111 까지 필요가 없음


endmodule
