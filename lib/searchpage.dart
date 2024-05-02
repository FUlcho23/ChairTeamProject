import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int _selectedIndex = 1;//해당되는 페이지 번호
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    final Size size = MediaQuery.of(context).size;
    // 화면 높이의 10%에 해당하는 값
    final double topPadding = size.height * 0.1;

    return Scaffold(
      backgroundColor: Color(0xFFF2EBDF),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, //수평 방향으로 스크롤하기 위한 것
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {}, //터치했을때 일어날 일(상품 페이지로 이동)
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                      child: Text(
                        '139,900',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],

                //가로 스크롤이 사용될 자리(추천)
              ),
            ),
            Container(),
            SingleChildScrollView(
              child: Column(),
            )
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
