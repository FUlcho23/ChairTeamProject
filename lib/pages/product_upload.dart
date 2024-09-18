import 'package:flutter/material.dart';
import '../widgets/db.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductUpload(),
    );
  }
}

class ProductUpload extends StatefulWidget {
  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent, // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {

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
              color: Color(0xFF404040), // Column의 색상을 주황색으로 설정
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
