import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/bottom_navi_bar.dart';
//주문내역
import '../user_options/person.dart';
import '../user_options/address.dart';
//체형설정
//이벤트
//고객센터
import 'package:chair/user_options/NoticePage.dart';
//설정

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 2; // 초기 선택된 인덱스를 2로 설정 (내 정보)

  void _onItemTapped(int index) {
    // 선택된 항목에 따라 페이지를 전환
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);
    List<String> list = ['종아리 길이', '허벅지 너비', '허벅지 길이', '등받이 높이'];
    List<double> information = [12.3, 23.4, 34.5, 45.6];
    List<String> list2 = ['주문내역', '개인정보 관리', '주소관리', '체형설정','이벤트','고객센터','공지사항','설정'];


    void handleButtonPressed(int index) {
      // index에 따라 다른 동작을 수행
      switch(index) {
        case 0:
          print('주문내역');
          break;
        case 1:
          print('개인정보 관리');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Person()),
          );
          break;
        case 2:
          print('주소관리');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Address()),
          );
          break;
        case 3:
          print('체형설정');
          break;
        case 4:
          print('이벤트');
          break;
        case 5:
          print('고객센터');
          break;
        case 6:
          print('공지사항');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoticePage()),
          );
          break;
        default:
          print('설정');
          break;
      }
    }

    return Scaffold(
      backgroundColor: customColor, // 배경색을 customColor로 설정
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Stack(
                      alignment: Alignment.center, // 모든 위젯을 중앙에 정렬
                      children: [
                        Positioned(
                          left: 20, // 왼쪽 여백 설정
                          top: 20, // 상단 여백 설정
                          child: Text(
                            '내 정보',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 2 / 9 / 2 - 50, // 이미지를 컨테이너의 중앙에 위치
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/bubleman.png', // 이미지 파일 경로
                                  width: 80, // 이미지 가로 크기
                                  height: 80, // 이미지 세로 크기
                                ),
                              ),
                              Text(
                                '안녕하세요~^0^',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0, // 하단 여백 설정
                          right: 20, // 오른쪽 여백 설정
                          child: ElevatedButton(
                            onPressed: () {
                              print('로그인페이지로 이동');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TitlePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // 버튼 내부 패딩을 0으로 설정
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                              ),
                              backgroundColor: Colors.transparent, // 버튼의 배경색을 투명하게 설정
                              shadowColor: Colors.transparent, // 그림자 색상을 투명하게 설정
                              elevation: 0, // 그림자 높이를 0으로 설정하여 눈에 보이지 않도록
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // 버튼의 내부 여백 설정
                              child: Text(
                                '로그아웃',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 8, // 검은 선의 높이 10
                    child: Container(
                      color: Color(0xFF404040), // 검은 선의 색상을 404040으로 설정
                    ),
                  ),

                  Container(//등록정보 + 편의기능
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
                      children: [
                        SizedBox(height: 10), // 컨테이너 상단에 간격 추가
                        Positioned(
                          top: 10, // 텍스트의 상단 여백
                          left: 20, // 텍스트의 왼쪽 여백
                          child: Text(
                            '등록 정보',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 8 / 9, // 화면 너비의 8/9
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white, // 컨테이너의 배경색 설정
                            borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30), // 왼쪽 여백을 설정
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        Text(
                                          '${list[i]}  :  ${information[i].toStringAsFixed(1)}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 0), // 오른쪽 여백을 설정합니다.
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10), // 내부 패딩을 0으로 설정합니다.
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // 사진 촬영 기능 구현
                                          print('사진 촬영 버튼이 눌렸습니다.');
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                          elevation: MaterialStateProperty.all<double>(0), // 그림자 효과를 제거
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 80, // 컨테이너의 너비
                                              height: 80, // 컨테이너의 높이
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(90), // 모서리를 설정합니다.
                                                border: Border.all(
                                                  color: Color(0xFFE9A05C), // 테두리의 색상을 지정합니다.
                                                  width: 2, // 테두리의 굵기를 설정합니다.
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
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10), // 첫 번째 컨테이너와 두 번째 컨테이너 사이의 간격 추가
                        Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 8 / 9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for(int i = 0; i < 8; i++)
                                  ElevatedButton(
                                    onPressed: () {
                                      handleButtonPressed(i);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero, // 버튼 내부 패딩을 0으로 설정
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                                      ),
                                      backgroundColor: Colors.transparent, // 버튼의 배경색을 투명하게 설정
                                      shadowColor: Colors.transparent, // 그림자 색상을 투명하게 설정
                                      elevation: 0, // 그림자 높이를 0으로 설정하여 눈에 보이지 않도록
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30), // 텍스트와 아이콘 사이의 간격 조절
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${list2[i]}',
                                            style: TextStyle(
                                              fontSize: 20,
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
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: BottomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}
