import 'dart:ui';
import 'package:chair/ProductCard & Products/ProductCard.dart';
import 'package:chair/ProductCard & Products/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_navi_bar.dart';
import 'searchpage.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}


class FirstPage extends StatefulWidget{
  @override
  _FirstPage createState() => _FirstPage();

}

class _FirstPage extends State<FirstPage> {
  final List<String> detailed_filter = ['금액', '브랜드', '옵션', '종류', '체형', '재질'];
  bool _isFilterVisible = false; // 상세 필터 컨테이너의 가시성 상태를 저장하는 변수

  int _selectedIndex = 0;//해당되는 페이지 번호

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
              SizedBox(height: 31,),
            // 아이콘 + 검색창 위젯
            Container(
              height: MediaQuery.of(context).size.height * 1 / 9,
              color: customColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        // 버튼을 눌렀을 때 수행할 작업을 여기에 추가합니다.
                        print('이미지 버튼이 눌렸습니다.');
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
                          print('검색창이 눌러졌습니다');
                          // 새로운 화면으로 이동합니다.
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
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                ),
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
            ),

            //검은 선
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFF404040),
              ),
            ),

            //상세 필터 위젯
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isFilterVisible = !_isFilterVisible; // 상태를 반전시킵니다.
                  });
                },
                child: Container(
                  height: 20,
                  color: Color(0xFF7F7F7F),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < 6; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print('${detailed_filter[i]} 버튼이 눌렸습니다.');
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.all(20),
                                      ),
                                      shape: MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      elevation: MaterialStateProperty.all<double>(0),
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        Color(0xFF7F7F7F),
                                      ),
                                    ),
                                    child: Text(
                                      '${detailed_filter[i]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      InkWell(
                        onTap: () {
                          print('+버튼이 눌러졌습니다.'); // 버튼 클릭 시 실행할 동작
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset(
                            'assets/images/addbutton.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 상세 필터 컨테이너를 보여줄지 여부에 따라 컨테이너를 표시하거나 숨깁니다.
              AnimatedContainer(
                duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 설정
                height: _isFilterVisible ? MediaQuery.of(context).size.height * 1 / 2 : 0, // 컨테이너의 높이 조정
                color: Colors.grey[300], // 배경색 설정
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 세부 필터 버튼을 생성합니다.
                      for (int i = 0; i < detailed_filter.length; i++)
                        ElevatedButton(
                          onPressed: () {
                            print('${detailed_filter[i]} 버튼이 눌렸습니다.');
                          },
                          child: Text('${detailed_filter[i]}'),
                        ),
                    ],
                  ),
                ),
              ),

              //상품 페이지 스크롤 가능한 부분
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
          // 하단바
          bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}