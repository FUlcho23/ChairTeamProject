import 'package:flutter/material.dart';
import '../pages/mypage.dart';
import '../widgets/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Address(),
    );
  }
}

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController cityController = TextEditingController();
  TextEditingController roadController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final db = Db(); // 데이터베이스 인스턴스 생성

  bool isEditingEnabled = false;

  @override
  void initState() {
    super.initState();
    db.connect(); // 데이터베이스에 연결
    loadAddresses(); // 주소 불러오기
  }

  Future<void> loadAddresses() async {
    String? userId = await db.getUserId(); // 사용자 ID 불러오기
    if (userId != null) {
      Map<String, String?> addresses = await db.getAddresses(userId);
      setState(() {
        cityController.text = addresses['m_address'] ?? '';
        roadController.text = addresses['m_D_address'] ?? '';
        detailController.text = addresses['m_D_address'] ?? '';
      });
    } else {
      print("사용자 ID가 없습니다.");
    }
  }


  Future<String?> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id'); // 사용자 ID 가져오기
    print("Current saved user ID: $userId"); // 확인용 로그
    return userId;
  }

  Future<void> updateAddress() async {
    String? userId = await loadUserId(); // 사용자 ID 불러오기
    if (userId != null) {
      await db.addAddress(userId, cityController.text, detailController.text); // 주소 업데이트
      setState(() {
        isEditingEnabled = false; // 수정 완료 후 편집 비활성화
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    roadController.dispose();
    detailController.dispose();
    db.close(); // 페이지 종료 시 데이터베이스 연결 닫기
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
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
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              '주소 관리',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
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
              color: Colors.orangeAccent,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildEditableTextField('시군구', cityController),
                  buildEditableTextField('도로명 주소', roadController),
                  buildEditableTextField('상세주소', detailController),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (isEditingEnabled) {
                        updateAddress(); // 주소 업데이트
                      }
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditableTextField(String label, TextEditingController controller) {
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
