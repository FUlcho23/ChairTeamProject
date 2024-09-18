// models/filters.dart

class FilterOptions {
  final List<String> detailedFilter = ['금액', '브랜드', '옵션', '종류', '체형', '재질'];
  final List<String> brands = [
    '시디즈', '허먼밀러', '린백', '듀오백', '코멧', '제닉스', '이케아',
    '문스타', '클라우드백', '휴먼스케일', '스틸케이스'
  ];
  final List<String> types = [
    '사무용/학생', '게이밍', '중역', '자세교정', '좌식', '접이식',
    '유아', '아동', '목욕의자', '반려동물', '인테리어'
  ];
  final List<String> options = ['목받침', '팔걸이', '등받이', '바퀴', '틸팅'];

  // 체형 필터 데이터
  final List<String> calfLengths = ['40-45', '45-50', '50-55', '55-60', '60-65', '65-70'];
  final List<String> thighWidths = ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50'];
  final List<String> thighLengths = ['40-45', '45-50', '50-55', '55-60', '60-65', '65-70'];
  final List<String> backHeights = ['40-45', '45-50', '50-55', '55-60', '60-65', '65-70'];
}