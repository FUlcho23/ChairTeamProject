import 'package:flutter/material.dart';
import '../pages/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sign(),
    );
  }
}

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isObscure = true;

  bool _isButtonEnabled() {
    return _idController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // AppBar
        backgroundColor: Color(0xFF404040),
        title: Text('회원가입하기',
          style: TextStyle(
          fontSize: 25,
          color: Colors.white, // 타이틀 글자 색상
          ),
        ),
        leading: IconButton( // 뒤로가기 버튼 추가
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.orangeAccent, // SizedBox의 색상을 주황색으로 설정
              ),
            ),
          Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/mainicon.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _idController,
                  onChanged: (_) => setState(() {}), // 텍스트 필드 내용 변경 감지
                  decoration: InputDecoration(
                    labelText: '아이디',
                    hintText: '영숫자 조합으로 5자 이상',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    hintText: '영숫자특수문자 조합으로 8자 이상',
                    suffixIcon: IconButton(
                      icon: _isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: _toggleVisibility,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: '이메일 주소',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: '이름',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _birthDateController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: '생년월일',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _phoneController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: '휴대전화',
                    hintText: '01000000000',
                  ),
                ),
                SizedBox(height: 60.0),
                ElevatedButton(
                  onPressed: _isButtonEnabled() ? _signUp : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Color(0xFFE9A05C);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 각도 설정
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50), // 너비는 무제한으로, 높이는 50으로 설정
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                    ),
                  ),
                  child: Text(
                    '가입하기',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }

  void _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}