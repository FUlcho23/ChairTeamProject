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
  @override
  final List<String> list = ['금액', '브랜드', '옵션', '종류', '체형', '재질'];

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
        body: Column(

          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1 / 9,
              color: customColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      'assets/images/mainicon.png',
                      height: 50,
                      width: 50,
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
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFF404040),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1 / 15,
                  color: Color(0xFF7F7F7F),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end, // 텍스트를 오른쪽으로 정렬합니다.
                      children: [
                        for (int i = 0; i < 6; i++)
                          Text(
                            '${list[i]}',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),


                Positioned(
                  bottom: 7,
                  right: 10,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('+ 버튼이 눌러졌습니다');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size.square(MediaQuery.of(context).size.height * 1 / 15 * 4 / 5),
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
                ),
              ],
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
}
