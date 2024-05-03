import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool agreeToAll = false;
  bool agreeToTerms = false;
  bool agreeToPrivacyPolicy = false;
  bool agreeToOptional = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/mainicon.png',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(height: 20),
            CheckBoxWidget(
              value: agreeToAll,
              onChanged: (value) {
                setState(() {
                  agreeToAll = value!;
                  if (agreeToAll) {
                    agreeToTerms = true;
                    agreeToPrivacyPolicy = true;
                    agreeToOptional = true;
                  }
                  else {
                    agreeToTerms = false;
                    agreeToPrivacyPolicy = false;
                    agreeToOptional = false;
                  }
                });
              },
              text: '전체 동의하기',
            ),
            CheckBoxWidget(
              value: agreeToTerms,
              onChanged: (value) {
                setState(() {
                  agreeToTerms = value!;
                });
              },
              text: '[필수]이용약관',
            ),
            CheckBoxWidget(
              value: agreeToPrivacyPolicy,
              onChanged: (value) {
                setState(() {
                  agreeToPrivacyPolicy = value!;
                });
              },
              text: '[필수]개인정보 수집 이용 동의',
            ),
            CheckBoxWidget(
              value: agreeToOptional,
              onChanged: (value) {
                setState(() {
                  agreeToOptional = value!;
                });
              },
              text: '[선택]실명 인증된 아이디로 가입',
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String text;

  const CheckBoxWidget({
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}
