import 'package:flutter/material.dart';

class TypeFilter extends StatelessWidget {
  final List<String> types;
  final String? selectedType;
  final ValueChanged<String?> onTypeSelected;

  TypeFilter({
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double buttonAspectRatio = 3 / 2;
    final int crossAxisCount = (screenWidth / 120).floor();

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('종류 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: buttonAspectRatio,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: types.length, // 펼쳐보기 기능 제거
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final type = types[index];
              final isSelected = type == selectedType;

              return Card(
                elevation: 3,
                margin: EdgeInsets.all(5),
                color: isSelected ? Colors.blue : Colors.white, // 선택된 타입의 색상을 파란색으로 설정
                child: ListTile(
                  title: Center(
                    child: Text(
                      type,
                      style: TextStyle(color: isSelected ? Colors.white : Colors.black), // 텍스트 색상 변경
                    ),
                  ),
                  selected: isSelected,
                  onTap: () {
                    // 타입을 클릭했을 때 선택 취소 기능 구현
                    onTypeSelected(isSelected ? null : type);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
