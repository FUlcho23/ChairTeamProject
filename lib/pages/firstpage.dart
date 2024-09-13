import 'package:flutter/material.dart';
import 'package:chair/widgets/ProductCard.dart';
import 'package:chair/models/product.dart';
import 'package:chair/widgets/bottom_navi_bar.dart';
import 'searchpage.dart';
import 'ProductFilters.dart'; // Import 추가

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: customColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 31),

              // 검색창 위젯
              _buildSearchBar(customColor, context),

              // 검은 선
              _buildDivider(),

              // 상품 필터 위젯
              ProductFilters(),

              // 상품 목록
              _buildProductGrid(context),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildSearchBar(Color customColor, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 9,
      color: customColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () {
                print('메인 아이콘 클릭됨');
              },
              child: Image.asset(
                'assets/images/mainicon.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFFE9A05C), width: 3.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '검색어를 입력해주세요.',
                        style: TextStyle(color: Color(0xFF7F7F7F)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 3.0,
                      color: Color(0xFFE9A05C),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Color(0xFF7F7F7F),
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      height: 10,
      child: Container(
        color: Color(0xFF404040),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
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
    );
  }
}
