import 'package:flutter/material.dart';
import 'firstpage.dart';
import '../sign/agreements.dart';
import '../sign/find.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9A05C),
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
                  child: Image.asset('assets/images/mainicon.png'),
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
                child: const TextField(
                  obscureText: true,
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
                        print('회원가입 동의 페이지로 이동');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Agreements(onChanged: (value){})),
                        );
                      },
                      child: Text('회원가입'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Find()),
                        );
                      },
                      child: Text('ID/PW 찾기'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage()),
                    );
                    // 로그인 버튼 눌렀을 때의 동작
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 50)),
                    // 버튼의 최소 너비와 높이 설정
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.1,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: const Text(
                  'or',
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    //투명해져라
                    elevation: MaterialStateProperty.all<double>(0),
                    // 그림자 효과를 제거
                  ),
                  icon: Icon(Icons.account_circle),
                  label: Text('Google 로그인'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
