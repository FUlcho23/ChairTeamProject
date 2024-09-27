// models/filters.dart

class FilterOptions {
  final List<String> detailedFilter = ['금액', '브랜드', '옵션', '종류', '체형', '재질', '색상'];
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

  // 재질 필터 데이터 추가
  final List<String> materials = [
    '메쉬',
    '인조가죽',
    '합성가죽',
    '천연가죽',
    '패브릭',
    '목재',
    '플라스틱',
    '기타'
  ];

  // 색상 리스트 추가
  final List<String> colors = [
    '#000000', '#7F7F7F', '#BFBFBF', '#E4D7CC',
    '#6B5640', '#FCAAA7', '#698E73', '#AAF1CF',
    '#FFFFFF', '#E60600', '#EE6D10', '#FFD600',
    '#6FD44C', '#2686F7', '#253F9C', '#A030D4'
  ];
}
