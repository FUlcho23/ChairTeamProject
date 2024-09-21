import 'package:flutter/material.dart';
import '../pages/loginpage.dart';
import '../widgets/db.dart'; // DB 관련 파일 임포트

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
  final Db db = Db(); // DB 클래스 인스턴스 생성

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
  void initState() {
    super.initState();
    db.connect(); // 초기화 시 DB 연결
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    db.close(); // 종료 시 DB 연결 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        title: Text('회원가입하기',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            Navigator.pop(context);
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
                color: Colors.orangeAccent,
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
                  _buildTextField('아이디', _idController, false),
                  _buildTextField('비밀번호', _passwordController, true),
                  _buildTextField('이메일 주소', _emailController, false),
                  _buildTextField('이름', _nameController, false),
                  _buildTextField('생년월일', _birthDateController, false, isPhone: true),
                  _buildTextField('휴대전화', _phoneController, false, isPhone: true),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 50),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 20),
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

  Widget _buildTextField(String hintText, TextEditingController controller, bool obscureText, {bool isPhone = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ? _isObscure : false,
      keyboardType: isPhone ? TextInputType.number : TextInputType.text, // 휴대전화 필드에 숫자 키보드 사용
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: obscureText
            ? IconButton(
          icon: _isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          onPressed: _toggleVisibility,
        )
            : null,
      ),
    );
  }

  void _signUp() async {
    // 사용자가 입력한 데이터를 DB에 저장
    await db.addUser(
      _idController.text,           // 사용자가 입력한 아이디
      _passwordController.text,      // 비밀번호
      _emailController.text,         // 이메일
      _nameController.text,          // 이름
      _birthDateController.text,     // 생년월일
      _phoneController.text,         // 휴대전화
    );

    // 회원가입 성공 후 로그인 페이지로 이동
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
