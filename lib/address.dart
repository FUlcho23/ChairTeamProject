import 'package:flutter/material.dart';

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
        title: Text('주소관리'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
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

