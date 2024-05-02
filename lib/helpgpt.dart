import 'package:chair/main.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          final Size size = MediaQuery.of(context).size;
          final double screenHeight = size.height;
          final double screenWidth = size.width;

          // 화면 높이의 10%에 해당하는 값
          final double topPadding = screenHeight * 0.1;
          final double buttonWidth = screenWidth * 0.8;

          return Stack(
            children: [
              Positioned(
                top: topPadding,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Image.asset('assets/mainicon.png'),
                ),
              ),
              Positioned(
                top: topPadding + 150.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '아이디',
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 200.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 250.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // 회원가입 버튼 눌렀을 때의 동작
                      },
                      child: Text('회원가입'),
                    ),
                    TextButton(
                      onPressed: () {
                        // 비밀번호 찾기 버튼 눌렀을 때의 동작
                      },
                      child: Text('비밀번호 찾기'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: topPadding + 300.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    // 로그인 버튼 눌렀을 때의 동작
                  },
                  child: Text('로그인'),
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.1,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Text(
                  '추가 정보 혹은 안내 메시지 등',
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.05,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // 구글 로그인 버튼 눌렀을 때의 동작
                  },
                  icon: Icon(Icons.account_circle),
                  label: Text('구글 로그인'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
