import 'package:flutter/material.dart';
import '../pages/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BodySetting(),
    );
  }
}

class BodySetting extends StatefulWidget {
  @override
  _BodySettingState createState() => _BodySettingState();
}

class _BodySettingState extends State<BodySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            // mypage.dart로 이동
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
              '체형설정', // 타이틀 설정
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
              color: Colors.orangeAccent, // Column의 색상을 주황색으로 설정
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
