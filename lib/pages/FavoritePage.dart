import 'package:flutter/material.dart';
import '../widgets/bottom_navi_bar.dart';
import 'package:chair/models/product.dart';
import 'package:chair/pages/CartPage.dart';
import 'package:chair/widgets/ProductCard.dart';

int crossAxisCount = 2;

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePage createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  int _selectedIndex = 3; // 해당되는 페이지 번호

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 선택된 제품을 장바구니로 추가하는 함수
  List<Product> getSelectedProducts() {
    return products.where((product) => product.isHeartSelected).toList();
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);

    return Scaffold(
      backgroundColor: customColor, // 배경색을 customColor로 설정
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 90,
              child: Stack(
                alignment: Alignment.center, // 모든 위젯을 중앙에 정렬
                children: [
                  Positioned(
                    left: 5, // 왼쪽 여백 설정
                    top: 27, // 상단 여백 설정
                    child: Image.asset(
                      'assets/images/mainicon.png', // 이미지 파일 경로
                      width: 50, // 이미지 가로 크기
                      height: 50, // 이미지 세로 크기
                    ),
                  ),
                  Positioned(
                    left: 60, // 왼쪽 여백 설정
                    top: 33, // 상단 여백 설정
                    child: Text(
                      '찜목록',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 28), // 아래로 10만큼의 여백 추가
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // 아이콘을 오른쪽으로 정렬
                        children: [
                          Spacer(), // 오른쪽 여백을 위한 Spacer
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // 장바구니로 선택된 상품을 전달
                              List<Product> selectedProducts = getSelectedProducts();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      '찜한 상품을 구매하시겠습니까?',
                                      style: TextStyle(
                                        fontSize: 18, // 화면 너비의 3.5%를 폰트 크기로 설정
                                        color: Colors.black,
                                      ),
                                    ),
                                    backgroundColor: Colors.white, // 다이얼로그 배경색을 하얀색으로 설정
                                    content: Text(
                                      '장바구니 화면으로 넘어갑니다.',
                                      style: TextStyle(
                                        fontSize: 15, // 화면 너비의 2.5%를 폰트 크기로 설정
                                        color: Colors.black, // 텍스트 색상 설정
                                      ),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0), // 버튼과 다이얼로그 상하 여백 설정
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 버튼 사이의 간격을 조정
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0), // '예' 버튼 왼쪽 여백
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // 다이얼로그 닫기
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => CartPage(
                                                        cartItems: selectedProducts,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  '예',
                                                  style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width * 0.03, // 화면 너비의 3%를 폰트 크기로 설정
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10.0), // '아니오' 버튼 오른쪽 여백
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // 다이얼로그 닫기
                                                },
                                                child: Text(
                                                  '아니오',
                                                  style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width * 0.03, // 화면 너비의 3%를 폰트 크기로 설정
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10, // 검은 선의 높이 10
              child: Container(
                color: Color(0xFF404040), // 검은 선의 색상을 404040으로 설정
              ),
            ),
            //------------------찜목록 리스트------------------
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width ~/ 168).toInt(), // 화면 폭을 기반으로 열 수 계산
                mainAxisSpacing: 10, // 열 간 간격
                crossAxisSpacing: 10, // 행 간 간격
                childAspectRatio: 168 / 272, // 각 항목의 가로 세로 비율
              ),
              itemCount: products.where((product) => product.isHeartSelected).length,
              itemBuilder: (context, index) {
                Product product = products.where((product) => product.isHeartSelected).toList()[index];
                return ProductCard(product: product);
              },
            ),
          ],
        ),
      ),
      //--------------하단바------------------------------
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
