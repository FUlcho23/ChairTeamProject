import 'package:flutter/material.dart';
import 'loginpage.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(242, 235, 223, 1.0),
      body: SingleChildScrollView(
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
