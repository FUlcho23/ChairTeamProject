import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProductCard & Products/ProductCard.dart';
import 'ProductCard & Products/product.dart';
import 'bottom_navi_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1; //해당되는 페이지 번호
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EBDF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색...',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9A05C), width: 5.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9A05C), width: 5.0),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    // 가로로 스크롤되는 위젯들
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ProductCard(product: product); // 새로운 파일의 위젯 사용
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );

  }
}
