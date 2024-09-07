import 'package:flutter/material.dart';
import '../pages/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Setting(),
    );
  }
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _pushNotification = false;
  bool _nightPushNotification = false;

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
              Icons.build,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              '설정',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
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
              color: Colors.orangeAccent,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildSettingItem('버전 정보', trailingText: 'Beta 0.01', trailingTextSize: 16, trailingTextColor: Colors.grey),
                  _buildSettingItem('푸시 동의', trailingWidget: Switch(
                    value: _pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        _pushNotification = value;
                      });
                    },
                  )),
                  _buildSettingItem('야간 푸시 동의', trailingWidget: Switch(
                    value: _nightPushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        _nightPushNotification = value;
                      });
                    },
                  )),
                  _buildSettingItem('언어', trailingText: '한국어', trailingTextSize: 16, trailingTextColor: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, {Widget? trailingWidget, String? trailingText, double trailingTextSize = 14, Color trailingTextColor = Colors.black}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // 좌우 여백 추가
      decoration: BoxDecoration(
        color: Colors.transparent, // 배경 색상을 투명하게 설정
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText,
              style: TextStyle(
                fontSize: trailingTextSize,
                color: trailingTextColor,
              ),
            ),
          if (trailingWidget != null)
            trailingWidget,
        ],
      ),
    );
  }
}
