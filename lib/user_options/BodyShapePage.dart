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
                  // 여기에 선택 가능한 체형 옵션 추가
                  // 예를 들어, RadioButton 또는 DropdownButton 등을 사용할 수 있습니다.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
