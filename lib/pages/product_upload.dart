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
  // 상품명과 가격을 저장할 컨트롤러 생성
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFF404040)),
          onPressed: () {},
        ),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.upload_file,
              color: Color(0xFF404040),
            ),
            SizedBox(width: 8),
            Text(
              '상품 등록',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF404040),
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
              color: Color(0xFF404040),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2,
                    height: (MediaQuery.of(context).size.width - 60) / 2,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "상품명*",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: productNameController,
                          decoration: InputDecoration(
                            hintText: '상품명',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "가격*",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: productPriceController,
                          keyboardType: TextInputType.number, // 숫자 입력 키패드 표시
                          decoration: InputDecoration(
                            hintText: '가격',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }
}
