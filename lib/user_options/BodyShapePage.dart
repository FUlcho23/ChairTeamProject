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
  bool isEditable = false; // '직접 입력' 버튼을 눌렀을 때 수정 가능 상태 여부
  List<String> values = ['NN.N', 'NN.N', 'NN.N', 'NN.N']; // 기본 값

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
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
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              '체형 설정',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(color: Colors.orangeAccent),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '카메라 촬영을 이용한 등록 혹은 직접 수정하여 체형을 설정해주세요.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
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
                              SizedBox(height: 8),
                              Text(
                                '촬영하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Color(0xFF7F7F7F),
                        ),
                        SizedBox(height: 16),
                        Container(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(), // GridView의 스크롤을 비활성화
                            shrinkWrap: true, // GridView가 스크롤 가능한 부모 안에 있을 때 사용
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 1.3, // 비율을 수정하여 공간 확보
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              List<String> labels = [
                                '종아리 길이',
                                '허벅지 너비',
                                '허벅지 길이',
                                '등판 높이'
                              ];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        labels[index],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 8), // 텍스트와 필드 사이 간격
                                      TextField(
                                        enabled: isEditable, // '직접 입력'이 눌리면 활성화
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                                          hintText: values[index],
                                        ),
                                        onChanged: (text) {
                                          values[index] = text;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isEditable = true; // '직접 입력' 버튼을 눌렀을 때 텍스트 필드 활성화
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6B5640)),
                                elevation: MaterialStateProperty.all<double>(0),
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
                            ElevatedButton(
                              onPressed: () {
                                print('저장하기 버튼이 눌렸습니다.');
                                setState(() {
                                  isEditable = false; // 저장하기 버튼을 누르면 다시 비활성화
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE9A05C)),
                                elevation: MaterialStateProperty.all<double>(0),
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
