import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/bottom_navi_bar.dart';
import 'package:chair/user_options/buylist.dart';
import '../user_options/person.dart';
import '../user_options/address.dart';
import 'package:chair/user_options/BodyShapePage.dart';
import 'package:chair/user_options/EventPage.dart';
import 'package:chair/user_options/customer_service.dart';
import 'package:chair/user_options/NoticePage.dart';
import 'package:chair/user_options/setting.dart';
import 'package:chair/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 2; // 초기 선택된 인덱스를 2로 설정 (내 정보)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);
    List<String> list = ['종아리 길이', '허벅지 너비', '허벅지 길이', '등받이 높이'];
    List<double> information = [12.3, 23.4, 34.5, 45.6];
    List<String> list2 = ['주문내역', '개인정보 관리', '주소관리', '체형설정', '이벤트', '고객센터', '공지사항', '설정'];

    double getFontSize(double screenWidth, double baseSize) {
      return screenWidth * baseSize / 100 < 20 ? screenWidth * baseSize / 100 : 20;
    }

    final List<Product> BuyProducts = [];

    void handleButtonPressed(int index) {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Buylist(products: BuyProducts)),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Person()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Address()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BodyShapePage()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventPage()),
          );
          break;
        case 5:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Customer()),
          );
          break;
        case 6:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoticePage()),
          );
          break;
        default:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Setting()),
          );
          break;
      }
    }

    return Scaffold(
      backgroundColor: customColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
                    top: 24,
                    child: Text(
                      '내 정보',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 2 / 9 / 2 - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/bubleman.png',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          '홍길동',
                          style: TextStyle(fontSize: getFontSize(MediaQuery.of(context).size.width, 3.5), color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TitlePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          '로그아웃',
                          style: TextStyle(fontSize: getFontSize(MediaQuery.of(context).size.width, 3.5), color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
              child: Container(
                color: Color(0xFF404040),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '등록 정보',
                      style: TextStyle(fontSize: getFontSize(MediaQuery.of(context).size.width, 4), color: Colors.black),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 8 / 9,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Text(
                                    '${list[i]}  :  ${information[i].toStringAsFixed(1)}',
                                    style: TextStyle(
                                      fontSize: getFontSize(MediaQuery.of(context).size.width, 4),
                                      color: Colors.black,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print('사진 촬영 버튼이 눌렸습니다.');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  elevation: MaterialStateProperty.all<double>(0),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                          color: Color(0xFFE9A05C),
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                        size: 60,
                                      ),
                                    ),
                                    Text(
                                      '촬영하기',
                                      style: TextStyle(
                                        fontSize: getFontSize(MediaQuery.of(context).size.width, 4),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 8 / 9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < list2.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: ElevatedButton(
                              onPressed: () {
                                handleButtonPressed(i);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${list2[i]}',
                                      style: TextStyle(
                                        fontSize: getFontSize(MediaQuery.of(context).size.width, 4),
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // 스크롤 하단에 여백 추가
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
