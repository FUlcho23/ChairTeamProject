import 'package:flutter/material.dart';
import 'sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Agreements(onChanged: (value) {},),
    );
  }
}

class Agreements extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  Agreements({required this.onChanged});

  @override
  _AgreementsState createState() => _AgreementsState();
}

class _AgreementsState extends State<Agreements> {
  bool agreeToAll = false;
  bool agreeToTerms = false;
  bool agreeToPrivacyPolicy = false;
  bool agreeToOptional = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이용약관 동의하기'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/images/mainicon.png',
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(height: 25),
              CheckBoxWithTextField(
                value: agreeToAll,
                onChanged: (value) {
                  setState(() {
                    agreeToAll = value!;
                    if (agreeToAll) {
                      agreeToTerms = true;
                      agreeToPrivacyPolicy = true;
                      agreeToOptional = true;
                    } else {
                      agreeToTerms = false;
                      agreeToPrivacyPolicy = false;
                      agreeToOptional = false;
                    }
                  });
                },
                text: '전체 동의하기',
                textFieldText: '실명 인증된 아이디로 가입, 위치기반서비스 이용약관(선택), 이벤트・혜택 정보 수신(선택) 동의를 포함합니다.',
              ),
              SizedBox(height: 15),
              CheckBoxWithTextField(
                value: agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms = value!;
                  });
                },
                text: '[필수]이용약관',
                textFieldText: '이 앱의 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 서비스를 제공하는 주식회사(이하 ‘의자앱’)와 이를 이용하는 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.',
              ),
              SizedBox(height: 15),
              CheckBoxWithTextField(
                value: agreeToPrivacyPolicy,
                onChanged: (value) {
                  setState(() {
                    agreeToPrivacyPolicy = value!;
                  });
                },
                text: '[필수]개인정보 수집 이용 동의',
                textFieldText: '개인정보보호법에 따라 의자앱에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.',
              ),
              SizedBox(height: 15),
              CheckBoxWithTextField(
                value: agreeToOptional,
                onChanged: (value) {
                  setState(() {
                    agreeToOptional = value!;
                  });
                },
                text: '[선택]개인정보 수집 및 이용',
                textFieldText: '의자앱 및 제휴 서비스의 이벤트・혜택 등의 정보 발송을 위해 의자앱 아이디(아이디 식별값 포함), 휴대전화번호(의자 앱 알림 또는 문자), 이메일주소를 수집합니다.',
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (agreeToTerms && agreeToPrivacyPolicy){
                    print('회원가입 페이지로 이동');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  backgroundColor: (agreeToTerms && agreeToPrivacyPolicy) ? Color(0xFFE9A05C) : Colors.grey,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxWithTextField extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String text;
  final String textFieldText;

  const CheckBoxWithTextField({
    required this.value,
    required this.onChanged,
    required this.text,
    required this.textFieldText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            Text(text,
              style: TextStyle(
                fontSize: 20,
              ),),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width - 40,
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              textFieldText,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
