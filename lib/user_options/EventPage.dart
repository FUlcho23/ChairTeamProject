import 'package:flutter/material.dart';
import '../pages/mypage.dart'; // mypage.dart를 import4
// EventDetailPage를 import

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // 공통된 AppBar 색상 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)), // 뒤로가기 버튼 색상
          onPressed: () {
            // MyPage로 이동
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
          children: [
            Icon(
              Icons.redeem,
              color: Colors.white, // 아이콘 색상
            ),
            SizedBox(width: 8), // 아이
            Text(
              '이벤트', // 페이지 타이틀을 '이벤트'로 설정
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // 주황색 구분선
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent,
            ),
          ),
          // 이벤트 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 5, // 임시 이벤트 항목 수
              itemBuilder: (context, index) {
                return EventItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final int index;

  EventItem({required this.index});

  void _navigateToEventDetails(BuildContext context) {
    // 여기에 이벤트 상세 페이지로의 네비게이션 로직을 추가합니다.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailPage(index: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToEventDetails(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // 세로 중앙 정렬
              children: [
                // 이미지 칸
                Container(
                  width: 100,  // 이미지 네모칸의 너비 설정 (공지사항 크기보다 크게)
                  height: 100, // 이미지 네모칸의 높이 설정
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // 배경 색상
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/sample.png'), // 이미지 경로 설정
                      fit: BoxFit.cover,  // 이미지가 네모칸에 맞게 커버됨
                    ),
                  ),
                ),
                SizedBox(width: 16), // 이미지와 텍스트 간격
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 날짜 텍스트
                      SizedBox(height: 8),
                      // 타이틀 텍스트
                      Text(
                        '이벤트 ${index + 1}', // 이벤트 타이틀
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E5E5E),
                          fontSize: 20,  // 더 큰 타이틀 폰트 크기
                        ),
                      ),
                      SizedBox(height: 4),
                      // 설명 텍스트
                      Text(
                        '2024-09-10 ~ 2024-12-31', // 임의 날짜
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  final int index;

  EventDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이벤트 ${index + 1} 상세 페이지'),
        backgroundColor: Color(0xFF404040),
      ),
      body: Center(
        child: Text('이벤트 ${index + 1}의 상세 내용'),
      ),
    );
  }
}
