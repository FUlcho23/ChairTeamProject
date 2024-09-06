import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Find(),
    );
  }
}

class Find extends StatefulWidget {
  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find>{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController1 = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController2 = TextEditingController();

  bool _isObscure = true;

  bool _isButtonEnabled1() {
    return _nameController.text.isNotEmpty &&
            _emailController1.text.isNotEmpty;
  }

  bool _isButtonEnabled2() {
    return _idController.text.isNotEmpty &&
        _emailController2.text.isNotEmpty;
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
        title: Text('ID/PW 찾기'),
        leading: IconButton( // 뒤로가기 버튼 추가
          icon: Icon(Icons.arrow_back), // 뒤로가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/mainicon.png',
              width: 80,
              height: 80,
            ),
            SizedBox(height: 25),
            Text('ID를 잊으셨나요?', style: TextStyle(
              fontSize: 25,),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              onChanged: (_) => setState(() {}), // 텍스트 필드 내용 변경 감지
              decoration: InputDecoration(
                labelText: '이름',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController1,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: '이메일 주소',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isButtonEnabled1() ? _findID : null,
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
                  Size(double.infinity, 50), // 너비는 무제한으로, 높이는 30으로 설정
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                ),
              ),
              child: Text('ID 찾기',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),),
            ),

            SizedBox(height: 60),

            Text('PW를 잊으셨나요?', style: TextStyle(
              fontSize: 25,),
            ),
            TextFormField(
              controller: _idController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: '아이디',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController2,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: '이메일 주소',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isButtonEnabled2() ? _findPW : null,
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
                  Size(double.infinity, 50), // 너비는 무제한으로, 높이는 30으로 설정
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                ),
              ),
              child: Text('PW 찾기',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

void _findID() {
  print('아이디를 이메일로 전송');
}

void _findPW() {
  print('비밀번호를 이메일로 전송');
}