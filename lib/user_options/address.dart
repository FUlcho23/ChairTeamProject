import 'package:flutter/material.dart';
import '../pages/mypage.dart';

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
  TextEditingController cityController = TextEditingController(text: '부산광역시 남구');
  TextEditingController roadController = TextEditingController(text: '신선로 428');
  TextEditingController detailController = TextEditingController(text: '동명대학교');

  bool isEditingCity = false;
  bool isEditingRoad = false;
  bool isEditingDetail = false;

  bool isEditingEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                Icons.location_on,
                color: Colors.white, // 아이콘 색상
              ),
              SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조정
              Text(
                '주소 관리', // 타이틀 설정
                style: TextStyle(
                  fontSize: 25,
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
              color: Colors.orangeAccent, // Column의 색상을 주황색으로 설정
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
                      setState(() {
                        isEditingCity = !isEditingEnabled;
                        isEditingRoad = !isEditingEnabled;
                        isEditingDetail = !isEditingEnabled;

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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
