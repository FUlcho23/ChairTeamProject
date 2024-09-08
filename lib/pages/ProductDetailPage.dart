import 'package:flutter/material.dart';
import 'package:chair/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)), // 뒤로가기 버튼의 색상 설정
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 돌아가기
          },
        ),
        title: Text(
          product.title, // 'name' 대신 'title' 사용
          style: TextStyle(color: Color(0xFFDDDDDD)), // 타이틀 색상 설정
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 주황색 구분선
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // Column의 색상을 주황색으로 설정
            ),
          ),
          SizedBox(height: 10), // 주황색 구분선 간격
          // 이미지와 텍스트를 감싸는 Expanded 위젯
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 이미지 크기 조절
                  Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    height: 200, // 이미지 높이 조절
                    width: double.infinity, // 이미지 너비를 화면 전체로 설정
                  ),
                  SizedBox(height: 20), // 이미지와 텍스트 사이의 간격
                  Padding(
                    padding: const EdgeInsets.all(16.0), // 텍스트와 상단, 하단, 좌우 간격
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '상품 이름: ${product.title}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '상품 가격: ${product.price}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '상품 설명: ${product.description}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '상세 옵션: ${product.detailed_option}',
                          style: TextStyle(fontSize: 16),
                        ),
                        // 추가적인 위젯을 여기에 배치할 수 있습니다.
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
}
