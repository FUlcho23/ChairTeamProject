import 'package:flutter/material.dart';
import '../pages/product_upload.dart'; // CheckmarkPainter 임포트 (파일 이름에 따라 변경)

class ColorFilter extends StatelessWidget {
  final List<String> colors;
  final List<bool> selectedColors;
  final Function(int) onColorSelected;

  const ColorFilter({
    Key? key,
    required this.colors,
    required this.selectedColors,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "색상 필터", // 텍스트 내용은 "색상 필터"로 유지
          style: TextStyle(
            fontSize: 18, // 브랜드 필터와 동일한 글자 크기
            fontWeight: FontWeight.bold, // 글자 두께는 볼드로 유지
          ),
        ),
        SizedBox(height: 10), // 여백을 동일하게 유지
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: List.generate(colors.length, (index) {
            return GestureDetector(
              onTap: () => onColorSelected(index),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color(int.parse(colors[index].replaceAll('#', '0xFF'))),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: selectedColors[index]
                    ? CustomPaint(
                  painter: CheckmarkPainter(),
                )
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }
}
