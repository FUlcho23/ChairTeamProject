import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomContainer(
          imagePath: 'assets/images/chair1.png',
          productDescription: '설명을 어디까지 적을수있는지 궁금해진 사람은 적어보기로 했어',
          productPrice: 'Product Price',
          color: Colors.blue,
          isExpanded: isExpanded,
          onTap: toggleExpanded, // 버튼을 눌렀을 때 확장 또는 축소를 토글하기 위해 onTap 함수를 전달합니다.
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String productDescription;
  final String productPrice;
  final Color color;
  final bool isExpanded; // 확장 여부를 추적하기 위한 변수
  final VoidCallback onTap; // 버튼을 눌렀을 때 실행할 함수

  CustomContainer({
    required this.imagePath,
    required this.productDescription,
    required this.productPrice,
    this.color = Colors.white,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 전달받은 onTap 함수를 실행합니다.
      child: Container(
        width: 168,
        height: isExpanded ? 400 : 272, // 확장된 경우 높이를 조절합니다.
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              productDescription,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: isExpanded ? null : 3, // 확장된 경우 최대 라인 수를 null로 지정하여 전체 텍스트를 보여줍니다.
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              productPrice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
