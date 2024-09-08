import 'package:flutter/material.dart';
import 'package:chair/models/product.dart';
import 'package:chair/user_options/buylist.dart'; // Buylist import

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> selectedItems = [];
  List<Product> _selectedProducts = [];

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
      backgroundColor: Color(0xFFF2EBDF),
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
                    subtitle: Text("${product.price.toInt()}"),
                    onTap: () {
                      setState(() {
                        selectedItems[index] = !selectedItems[index];
                        print("선택 상태: $selectedItems"); // 선택 상태 출력
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
              '총 합계 : ${getTotalPrice().toInt()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  // 결제 완료 확인 다이얼로그 표시
                  bool? confirmed = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          '결제 확인',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        content: Text(
                          '결제하시겠습니까?',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              '예',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(true); // 예 버튼 클릭 시 다이얼로그 닫기
                            },
                          ),
                          TextButton(
                            child: Text(
                              '아니오',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(false); // 아니오 버튼 클릭 시 다이얼로그 닫기
                            },
                          ),
                        ],
                      );
                    },
                  );

                  // 확인 후, 선택된 상품들로 주문내역 화면으로 이동
                  if (confirmed == true) {
                    List<Product> selectedProducts = [];
                    for (int i = 0; i < widget.cartItems.length; i++) {
                      if (selectedItems[i]) {
                        selectedProducts.add(widget.cartItems[i]);
                      }
                    }

                    // 주문 내역 화면으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Buylist(products: selectedProducts),
                      ),
                    );
                  }
                },
                child: Text('결제하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.zero,
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
