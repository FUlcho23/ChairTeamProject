import 'package:flutter/material.dart';
import '../pages/loginpage.dart';
import '../pages/mypage.dart';
import '../widgets/db.dart';

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
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isEditingEnabled = false;
  String? userId;
  Map<String, dynamic>? userInfo; // 변경된 부분

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<String?> loadUserName() async {
    String? userName = await Db().getUserInfo(); // 저장된 이름 가져오기
    print("Loaded username in person.dart: $userName");
    return userName;
  }

  Future<void> _loadUserInfo() async {
    Db db = Db();
    userId = await db.getUserId(); // 사용자 ID 가져오기
    if (userId != null) {
      userInfo = await db.getUserInfoById(userId!);
      // 사용자 정보를 각 TextEditingController에 설정
      idController.text = userId!;
      nameController.text = userInfo?['name'] ?? '';
      emailController.text = userInfo?['email'] ?? '';
      birthController.text = userInfo?['birthday'] ?? '';
      phoneController.text = userInfo?['call'] ?? '';
      setState(() {}); // UI 업데이트
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          },
        ),
        title: Row(
          children: <Widget>[
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 8),
            Text(
              '개인정보 관리',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: true, // 키보드가 올라왔을 때 자동으로 레이아웃 조정
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildEditableTextField('ID', idController),
            buildEditableTextField('PW', pwController),
            buildEditableTextField('이름', nameController),
            buildEditableTextField('이메일', emailController),
            buildEditableTextField('생년월일', birthController, isPhone: true),
            buildEditableTextField('전화번호', phoneController, isPhone: true),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditingEnabled = !isEditingEnabled;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE9A05C),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text(
                isEditingEnabled ? '수정완료' : '수정하기',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 100), // 추가된 빈 공간
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '회원탈퇴',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditableTextField(String label, TextEditingController controller, {bool isPhone = false}) {
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
              keyboardType: isPhone ? TextInputType.phone : TextInputType.text, // 전화번호 필드에 숫자 키보드 사용
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
