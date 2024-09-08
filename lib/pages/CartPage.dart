import 'package:flutter/material.dart';
import 'package:chair/models/product.dart';
import 'package:chair/widgets/ProductCard.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List to keep track of selected items
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize the selection state for each item to false
    selectedItems = List<bool>.filled(widget.cartItems.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.white, // 아이콘 색상
            ),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조정
            Text(
              '장바구니', // 타이틀 설정
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // 타이틀 글자 색상
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF2EBDF),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // 상단 구분선 주황색
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 장바구니에 있는 상품들을 ListView.builder로 표시
                  ListView.builder(
                    shrinkWrap: true, // ListView가 Column 안에 들어가므로 shrinkWrap 사용
                    physics: NeverScrollableScrollPhysics(), // 내부 스크롤 방지
                    itemCount: widget.cartItems.length, // 장바구니에 있는 상품 개수
                    itemBuilder: (context, index) {
                      // cart 리스트에서 각 상품 가져오기
                      Product product = widget.cartItems[index];
                      bool isSelected = selectedItems[index]; // Get selection state
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        color: isSelected ? Colors.blue[100] : Colors.white, // Change color if selected
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
                          subtitle: Text("₩${product.price}"), // 가격 표시
                          onTap: () {
                            setState(() {
                              selectedItems[index] = !selectedItems[index]; // Toggle selection state
                            });
                          },
                        ),
                      );
                    },
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
