import 'package:flutter/material.dart';
import 'agreements_person.dart';
import 'agreements_company.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupRoleSelection(onChanged: (value) {}),
    );
  }
}

class SignupRoleSelection extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  SignupRoleSelection({required this.onChanged});

  @override
  _SignupRoleSelectionState createState() => _SignupRoleSelectionState();
}

class _SignupRoleSelectionState extends State<SignupRoleSelection> {
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 2 / 3;
    final buttonHeight = MediaQuery.of(context).size.height * 1 / 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        title: Text(
          '회원가입하기',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
                child: Container(
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(height: 50),
              // 기업으로 회원가입하기 버튼
              Container(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgreementsCompany(onChanged: (value) {}),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6B5640), // 버튼 배경 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.business, size: buttonHeight/2, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        '기업으로 회원가입하기',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // 개인으로 회원가입하기 버튼
              Container(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgreementsPerson(onChanged: (value) {}),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE9A05C), // 버튼 배경 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: buttonHeight/2, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        '개인으로 회원가입하기',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
