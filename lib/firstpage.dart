import 'dart:ui';
import 'package:chair/ItemsWidget%20&%20Products/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_navi_bar.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatefulWidget{
  @override
  _FirstPage createState() => _FirstPage();

}

class _FirstPage extends State<FirstPage> {
  final List<String> detailed_filter = ['금액', '브랜드', '옵션', '종류', '체형', '재질'];

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
            Container(
              height: MediaQuery.of(context).size.height * 1 / 15,
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
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('+ 버튼이 눌러졌습니다');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size.square(
                            MediaQuery.of(context).size.height * 1 / 15 * 4 / 5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),

            //상품 페이지 스크롤 가능한 부분
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Column이 확장될 수 있도록 가로로 확장
                      children: [
                        // 상품 색 컨테이너
                        Container(
                          padding: EdgeInsets.only(top: 10.0, right: 10.0), // 위와 오른쪽에 각각 8.0의 패딩을 추가합니다.
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              products[index].colors.length,
                                  (cindex) => Container(
                                height: 15,
                                width: 15,
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: products[index].colors[cindex],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // 상품 이미지 컨테이너
                        Expanded(
                          child: Container(
                            child: AspectRatio(
                              aspectRatio: 3 / 5, // 이미지의 가로:세로 비율을 3:5로 설정
                              child: Image.asset(
                                products[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),



                        // 상품 이름 컨테이너
                        Container(
                          margin: EdgeInsets.only(top: 10), // 중간에 여백 추가
                          width: double.infinity, // 최대 너비 설정
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0), // 왼쪽에 패딩 적용
                            child: Text(
                              products[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start, // 텍스트를 왼쪽으로 정렬
                            ),
                          ),
                        ),

                        // 세부사항
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: TextButton(
                            onPressed: () {
                              print('세부사항 버튼이 눌러졌습니다');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // 버튼 내부의 패딩을 제거합니다.
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // 세부사항과 옵션을 왼쪽으로 정렬합니다.
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '세부사항',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF5E5E5E),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: Icon(
                                          Icons.expand_more,
                                          color: Color(0xFF5E5E5E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    products[index].option,
                                    style: TextStyle(
                                      color: Color(0xFF5E5E5E),
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.start, // 텍스트를 왼쪽으로 정렬
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 상품 가격 컨테이너 및 하트 버튼
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "${products[index].price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              width: 32, // 버튼의 너비
                              height: 28, // 버튼의 높이
                              child: InkWell(
                                onTap: () {
                                  // 버튼이 눌렸을 때 수행할 작업을 여기에 추가합니다.
                                  print('하트 버튼이 눌렸습니다.');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 5), // 오른쪽과 아래쪽 여백을 줍니다.
                                  child: Image.asset(
                                    'assets/images/empty_heart.png',
                                    height: 24, // 이미지의 높이
                                    width: 24, // 이미지의 너비
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                );
              },
            ),
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
}