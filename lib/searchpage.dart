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
            SizedBox(height: 31),
            Container(
              width: double.infinity,
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색어를 입력해주세요.',
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
            Text('  추천 상품',
              style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 16,
            ),),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(//검은 선
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text('  전체 상품',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
            SizedBox(height: 10),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 168, // 화면 폭을 기반으로 열 수 계산
                mainAxisSpacing: 10, // 열 간 간격
                crossAxisSpacing: 10, // 행 간 간격
                childAspectRatio: 168 / 272, // 각 항목의 가로 세로 비율
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
