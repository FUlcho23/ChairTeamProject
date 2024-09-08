import 'package:flutter/material.dart';
import 'package:chair/models/product.dart'; // Product 모델 import
import '../pages/mypage.dart';

class Buylist extends StatelessWidget {
  final List<Product> products;

  Buylist({required this.products});

  @override
  Widget build(BuildContext context) {
    print("주문 내역에 전달된 상품들: $products");  // 상품 리스트 출력
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
              Icons.shopping_cart,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              '주문내역',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: products.map((product) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        product.title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${product.price.toInt()}"),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

