import 'package:flutter/material.dart';
import '../pages/mypage.dart'; // mypage.dart를 import

void main() {
  runApp(MyApp());
}

class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)), // 뒤로가기 버튼의 색상 설정
          onPressed: () {
            // mypage.dart로 이동
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // 아이콘과 텍스트를 왼쪽 정렬
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0), // 아이콘과 텍스트 사이의 여백
              child: Image.asset(
                'assets/images/speakerphone.png', // 아이콘 이미지
                height: 24,
                width: 24,
              ),
            ),
            Text(
              '공지사항', // 타이틀 설정
              style: TextStyle(
                color: Colors.white, // 타이틀 글자 색상
                fontSize: 24,
              ),
            ),
          ],
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
                return NoticeItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NoticeItem extends StatefulWidget {
  final int index;

  NoticeItem({required this.index});

  @override
  _NoticeItemState createState() => _NoticeItemState();
}

class _NoticeItemState extends State<NoticeItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 날짜를 표시합니다.
                  Text(
                    '2024-09-06', // 임의의 날짜를 표시
                    style: TextStyle(
                      color: Color(0xFF7F7F7F), // 날짜 색상
                      fontSize: 12, // 날짜 폰트 크기
                    ),
                  ),
                  SizedBox(height: 4), // 날짜와 제목 사이의 여백
                  Text(
                    '공지사항 ${widget.index + 1}', // 타이틀
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5E5E5E),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            isExpanded
                ? Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '상세 내용이 여기에 들어갑니다. 상세 내용이 여기에 들어갑니다. 상세 내용이 여기에 들어갑니다. 상세 내용이 여기에 들어갑니다.',
                      maxLines: isExpanded ? null : 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? '접기' : '펼쳐보기', // 텍스트가 확장 상태에 따라 변경
                  style: TextStyle(
                    color: Color(0xFF7F7F7F), // 버튼 텍스트 색상 변경
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
