import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navi_bar.dart';
import 'package:chair/widgets/ProductCard.dart';
import 'package:chair/models/product.dart';

int crossAxisCount = 2;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoritePage(),
    );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePage createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {

  int _selectedIndex = 3;//해당되는 페이지 번호
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);
    // 화면 크기 가져오기
    final Size size = MediaQuery.of(context).size;
    // 화면 높이의 10%에 해당하는 값
    final double topPadding = size.height * 0.1;


    return Scaffold(
      backgroundColor: customColor, // 배경색을 customColor로 설정
      body: SingleChildScrollView(
        child: Column (
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
                          Icon(
                            Icons.shopping_cart,
                            size: 50, // 아이콘 크기 설정
                            color: Colors.black, // 아이콘 색상 설정 (원하는 색상으로 변경 가능)
                          ),
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