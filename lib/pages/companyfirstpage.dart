import 'package:chair/pages/product_upload.dart';
import 'package:flutter/material.dart';
import 'package:chair/widgets/ProductCard.dart';
import 'package:chair/models/product.dart';
import 'package:chair/widgets/bottom_navi_bar.dart';
import 'searchpage.dart';
import 'product_filters.dart'; // Import 추가

void main() {
  runApp(MaterialApp(
    home: CompanyFirstPage(),
  ));
}

class CompanyFirstPage extends StatefulWidget {
  @override
  _CompanyFirstPage createState() => _CompanyFirstPage();
}

class _CompanyFirstPage extends State<CompanyFirstPage> {
  int _selectedIndex = 0;
  String productName = '';
  double price = 0.0;
  String companyName = '';
  String brand = '';
  List<String> selectedOptions = [];
  List<String> selectedChairTypes = [];
  List<String> selectedColorCodes = [];
  double totalWidth = 0.0;
  double totalHeight = 0.0;
  double seatWidth = 0.0;
  double seatDepth = 0.0;
  double height = 0.0;
  double backrestHeight = 0.0;
  String detailedDescription = '';

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
        body: Column(
          children: [
            SizedBox(height: 31),

            // 검색창 위젯
            _buildSearchBar(customColor, context),

            // 검은 선
            _buildDivider(),

            // 상품 필터 위젯
            ProductFilters(),

            // 상품 목록을 스크롤 가능한 영역으로 설정
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2개의 열로 설정
                  mainAxisSpacing: 10, // 행 간의 간격
                  crossAxisSpacing: 10, // 열 간의 간격
                  childAspectRatio: 0.6, // 카드의 비율을 조정하여 크기 확대
                ),
                itemCount: products.length + 1, // 첫번째 상품 추가 버튼 포함
                itemBuilder: (context, index) {
                  // 첫 번째 카드는 상품 등록 버튼
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductUpload(
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 168,
                        height: 272,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 150,
                              color: Colors.black,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '상품을 추가하려면\n여기를 누르세요',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('상품명: $productName'),
                                  Text('가격: $price'),
                                  Text('회사명: $companyName'),
                                  Text('브랜드: $brand'),
                                  // 추가적인 정보들...
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  // 나머지 카드는 등록한 상품 카드
                },
              ),
            ),
          ],
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
}
