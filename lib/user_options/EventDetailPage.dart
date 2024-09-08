class EventDetailPage extends StatelessWidget {
  final int index;

  EventDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF404040), // AppBar 배경색을 0xFF404040로 설정
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white), // 뒤로가기 버튼을 흰색으로 설정
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '이벤트 ${index + 1} 상세 페이지',
          style: TextStyle(color: Colors.white), // 타이틀 글자를 흰색으로 설정
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE), // 전체 화면 배경색을 Figma의 색상으로 설정
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이벤트 이미지
            Container(
              width: double.infinity,
              height: 200, // 이미지 높이
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sample.png'), // 이미지 경로 설정
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // 이벤트 제목
            Text(
              '이벤트 ${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E5E5E),
                fontSize: 28,
              ),
            ),
            SizedBox(height: 8),
            // 이벤트 날짜
            Text(
              '2024-09-10',
              style: TextStyle(
                color: Color(0xFF7F7F7F),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            // 이벤트 설명
            Text(
              '이벤트 ${index + 1}에 대한 자세한 설명이 여기에 들어갑니다. '
                  '여기에서는 이벤트의 세부 사항을 상세히 설명할 수 있습니다. '
                  '예를 들어, 일정, 장소, 참석 방법 등 이벤트에 대한 모든 정보가 포함될 수 있습니다.',
              style: TextStyle(
                color: Color(0xFF5E5E5E),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
