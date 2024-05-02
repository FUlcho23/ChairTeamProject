import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'searchpage.dart';
import 'mypage.dart';
//페이지들 import해두기

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  BottomNavigationBarWidget({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  void _onItemTapped(int index) {
    // 선택된 항목에 따라 페이지를 전환합니다.
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );//홈페이지
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );//검색페이지
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage()),
        );//내정보
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );//찜목록
        break;
      default:
    }
    // 부모 위젯에 선택된 인덱스를 전달합니다.
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '찜 목록',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF404040),
        elevation: 20,
        onTap: _onItemTapped,
      ),
    );
  }
}
