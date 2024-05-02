import 'package:flutter/material.dart';
import 'bottom_navi_bar.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 인덱스를 업데이트합니다.
    });
  }

  @override
  Widget build(BuildContext context){
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
                        // 회원가입 버튼 눌렀을 때의 동작
                      },
                      child: Text('회원가입'),
                    ),
                    TextButton(
                      onPressed: () {
                        // 비밀번호 찾기 버튼 눌렀을 때의 동작
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
                    // 로그인 버튼 눌렀을 때의 동작
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  child: Text('로그인',style: TextStyle(fontSize: 20,color: Colors.white,),),

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
                  icon: Icon(Icons.account_circle),
                  label: Text('Google 로그인'),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}