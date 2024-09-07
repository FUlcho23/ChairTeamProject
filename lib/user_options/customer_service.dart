import 'package:flutter/material.dart';
import '../pages/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Customer(),
    );
  }
}

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  bool _showHelpDetails = false;
  bool _showInquiryDetails = false;
  bool _showBusinessDetails = false;

  final Map<String, String> _details = {
    '자주 찾는 질문': '1. 체형 촬영 방법 및 등록 방법이 뭔가요?\n2. 파판이 하고 싶어요\n3. 졸리다..\n4. 오늘 저녁 추천 받아요',
    '문의하기': '010-0000-0000',
    '사업자 정보': '카페인',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar의 색상을 검은색으로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFFDDDDDD)),
          onPressed: () {
            // mypage.dart로 이동
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          },
        ),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.support_agent,
              color: Colors.white, // 아이콘 색상
            ),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조정
            Text(
              '고객센터', // 타이틀 설정
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // 타이틀 글자 색상
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.orangeAccent, // Column의 색상을 주황색으로 설정
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '궁금하신 점이 무엇인가요?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '검색어를 입력하세요',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // 검색 버튼 클릭 시 동작
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        _buildExpandableItem('자주 찾는 질문', _showHelpDetails, (value) {
                          setState(() {
                            _showHelpDetails = value;
                            _showInquiryDetails = false; // 다른 항목 닫기
                            _showBusinessDetails = false; // 다른 항목 닫기
                          });
                        }),
                        SizedBox(height: 20),
                        _buildExpandableItem('문의하기', _showInquiryDetails, (value) {
                          setState(() {
                            _showInquiryDetails = value;
                            _showHelpDetails = false; // 다른 항목 닫기
                            _showBusinessDetails = false; // 다른 항목 닫기
                          });
                        }),
                        SizedBox(height: 20),
                        _buildExpandableItem('사업자 정보', _showBusinessDetails, (value) {
                          setState(() {
                            _showBusinessDetails = value;
                            _showHelpDetails = false; // 다른 항목 닫기
                            _showInquiryDetails = false; // 다른 항목 닫기
                          });
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableItem(String title, bool isExpanded, ValueChanged<bool> onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.black,
          ),
          onTap: () {
            onTap(!isExpanded);
          },
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              _details[title] ?? '상세 설명이 여기에 나옵니다.', // 제목에 따른 상세 설명 표시
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        SizedBox(height: 20),
        Container(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
