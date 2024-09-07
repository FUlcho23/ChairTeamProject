import 'package:flutter/material.dart';
import '../pages/loginpage.dart';
import '../pages/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Person(),
    );
  }
}

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  TextEditingController idController = TextEditingController(text: 'admin');
  TextEditingController pwController = TextEditingController(text: 'admin');
  TextEditingController nameController =
  TextEditingController(text: '홍길동');
  TextEditingController emailController =
  TextEditingController(text: 'hong@tu.kr');
  TextEditingController phoneController =
  TextEditingController(text: '01012341234');
  TextEditingController introController =
  TextEditingController(text: '안녕하세요~^0^');

  bool isEditingID = false;
  bool isEditingPW = false;
  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPhone = false;
  bool isEditingIntro = false;

  bool isEditingEnabled = false; // Track whether editing is enabled or not

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
            onPressed: () {
              // mypage.dart로 이동
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              );
            },
          ),
          title: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.white, // 아이콘 색상
              ),
              SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조정
              Text(
                '개인정보 관리', // 타이틀 설정
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // 타이틀 글자 색상
                ),
              ),
            ],
          ),
        ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // SizedBox의 색상을 주황색으로 설정
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildEditableTextField('ID', idController),
                  buildEditableTextField('PW', pwController),
                  buildEditableTextField('이름', nameController),
                  buildEditableTextField('이메일', emailController),
                  buildEditableTextField('전화번호', phoneController),
                  buildEditableTextField('소개말', introController),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Toggle the editing state for all text fields
                        isEditingID = !isEditingEnabled;
                        isEditingPW = !isEditingEnabled;
                        isEditingName = !isEditingEnabled;
                        isEditingEmail = !isEditingEnabled;
                        isEditingPhone = !isEditingEnabled;
                        isEditingIntro = !isEditingEnabled;

                        // Toggle the global editing flag
                        isEditingEnabled = !isEditingEnabled;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE9A05C),
                      padding: EdgeInsets.symmetric(horizontal: 16.0), // 버튼의 내부 여백 설정 (가로 방향)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 반경 설정
                      ),
                      minimumSize: Size(double.infinity, 40), // 버튼의 최소 크기 설정
                    ),
                    child: Text(
                      isEditingEnabled ? '수정완료' : '수정하기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              print('회원 탈퇴');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // 버튼의 내부 여백 설정
              child: Text(
                '회원탈퇴',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildEditableTextField(
      String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 3,
            child: isEditingEnabled
                ? TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
                : Text(controller.text),
          ),
        ],
      ),
    );
  }
}
