import 'package:flutter/material.dart';
import '../pages/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BodyShapePage(),
    );
  }
}

class BodyShapePage extends StatefulWidget {
  @override
  _BodyShapePageState createState() => _BodyShapePageState();
}

class _BodyShapePageState extends State<BodyShapePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            // MyPage로 이동
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          },
        ),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.straighten,
              color: Colors.white, // 아이콘 색상
            ),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조정
            Text(
              '체형 설정', // 타이틀 설정
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // 타이틀 글자 색상
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // 구분선 색상
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 체형 설정 항목을 추가할 수 있는 위젯
                  Text(
                    '체형을 설정하세요',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // 촬영하기 버튼
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('사진 촬영 버튼이 눌렸습니다.');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  border: Border.all(
                                    color: Color(0xFFE9A05C),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 60,
                                ),
                              ),
                              SizedBox(height: 8), // 버튼과 텍스트 사이의 간격
                              Text(
                                '촬영하기',
                                style: TextStyle(
                                  fontSize: 16, // 적당한 폰트 크기로 설정
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16), // 버튼과 검은 선 사이의 간격
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Color(0xFF7F7F7F), // Figma의 색상 코드 적용
                        ),
                        SizedBox(height: 16), // 선과 네모 사이의 간격
                        // 2x2 형태의 텍스트 네모
                        Container(
                          height: 400, // 높이를 고정하여 `GridView`가 잘리지 않게 설정
                          child: GridView.builder(
                            shrinkWrap: true, // 내용이 길어지면 스크롤 가능
                            physics: NeverScrollableScrollPhysics(), // GridView가 스크롤되지 않도록 설정
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2x2 그리드
                              crossAxisSpacing: 16.0, // 가로 간격
                              mainAxisSpacing: 16.0, // 세로 간격
                              childAspectRatio: 2, // 가로:세로 비율을 2로 설정하여 직사각형
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              List<String> labels = [
                                '종아리 길이 \n NN.N',
                                '허벅지 너비 \n NN.N',
                                '허벅지 길이 \n NN.N',
                                '등판 높이 \n NN.N'
                              ];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32.0), // 둥근 테두리
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // 그림자 위치
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    labels[index],
                                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 32), // 네모와 버튼 사이의 간격
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('직접 입력 버튼이 눌렸습니다.');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6B5640)), // Figma의 색상 코드 적용
                                  elevation: MaterialStateProperty.all<double>(0),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 54)), // 버튼 높이 조정 (기본 높이 36에서 1.5배 증가)
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '직접 입력',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16), // 버튼 사이의 간격
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('저장하기 버튼이 눌렸습니다.');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE9A05C)), // Figma의 색상 코드 적용
                                  elevation: MaterialStateProperty.all<double>(0),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 54)), // 버튼 높이 조정 (기본 높이 36에서 1.5배 증가)
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '저장하기',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
