import 'package:chair/sign/agreements_person.dart';
import 'package:flutter/material.dart';
import 'firstpage.dart';
import '../sign/signup_role_selection.dart';
import '../sign/find.dart';
import '../widgets/db.dart'; // Db 클래스가 있는 파일
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserInfo(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', name);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextField의 값을 가져오기 위한 컨트롤러
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9A05C),
      body: Builder(
        builder: (BuildContext context) {
          final Size size = MediaQuery.of(context).size;
          final double screenHeight = size.height;
          final double screenWidth = size.width;

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
                  controller: _idController,
                  decoration: const InputDecoration(
                    hintText: '아이디',
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 200.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: TextField(
                  controller: _pwController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '비밀번호',
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 300.0,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: ElevatedButton(
                  onPressed: () async {
                    String userId = _idController.text;
                    String userPw = _pwController.text;

                    bool loginSuccess = await Db().login(userId, userPw);

                    if (loginSuccess) {
                      // 로그인 성공 시 사용자 이름 저장
                      await saveUserInfo(userId);  // userId를 사용자 이름으로 저장
                      // 저장된 사용자 이름 출력
                      String? savedName = await SharedPreferences.getInstance().then((prefs) => prefs.getString('username'));
                      print("현재 저장된 사용자 이름: $savedName");

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                      );
                    } else {
                      // 로그인 실패 시 에러 메시지 표시
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('로그인 실패. 아이디 또는 비밀번호가 잘못되었습니다.'),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(buttonWidth, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(fontSize: 24, color: Colors.white),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupRoleSelection(onChanged: (value) {}),
                          ),
                        );
                      },
                      child: const Text('회원가입'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Find()),
                        );
                      },
                      child: const Text('ID/PW 찾기'),
                    ),
                  ],
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
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  icon: const Icon(Icons.account_circle),
                  label: const Text('Google 로그인'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}