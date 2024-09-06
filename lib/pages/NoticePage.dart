import 'package:flutter/material.dart';
import 'mypage.dart'; // mypage.dart를 import

class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 1 / 9), // AppBar의 높이 설정
        child: AppBar(
          backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // mypage.dart로 이동
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              );
            },
          ),
          title: Text(
            '공지사항', // 타이틀 설정
            style: TextStyle(
              color: Colors.white, // 타이틀 글자 색상
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 검은 선을 주황색으로 변경
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // Column의 색상을 주황색으로 설정
            ),
          ),
          // 공지사항 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('공지사항 ${index + 1}'),
                  subtitle: Text('공지사항 내용이 여기에 들어갑니다.'),
                  onTap: () {
                    print('공지사항 ${index + 1}이 눌렸습니다.');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
