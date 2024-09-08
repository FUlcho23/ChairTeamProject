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
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(widget.cartItems.length, false);
  }

  // Method to calculate the total price of selected items
  double getTotalPrice() {
    double total = 0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      if (selectedItems[i]) {
        total += widget.cartItems[i].price;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            Navigator.pop(context);
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
              '장바구니',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF2EBDF), // 화면 배경색
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '구매하실 상품을 클릭해주세요',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                Product product = widget.cartItems[index];
                bool isSelected = selectedItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: isSelected ? Colors.blue[100] : Colors.white,
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
                    subtitle: Text("${product.price.toInt()}"), // 소수점 없애기
                    onTap: () {
                      setState(() {
                        selectedItems[index] = !selectedItems[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '총 합계 : ${getTotalPrice().toInt()}', // 소수점 없애기
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // 양쪽 여백 추가
            child: SizedBox(
              width: double.infinity, // 버튼 너비를 화면 너비에 맞추기
              height: 50, // 버튼 높이를 50으로 조정
              child: ElevatedButton(
                onPressed: () {
                  // 결제 로직을 여기에 추가하세요
                },
                child: Text('결제하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent, // 버튼 배경색
                  foregroundColor: Colors.white, // 버튼 텍스트 색상
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 버튼의 모서리를 둥글게
                  ),
                  padding: EdgeInsets.zero, // 버튼의 여백 없애기
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
