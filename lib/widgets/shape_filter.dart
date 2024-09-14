import 'package:flutter/material.dart';

class ShapeFilter extends StatefulWidget {
  final List<String> calfLengths;
  final List<String> thighWidths;
  final List<String> thighLengths;
  final List<String> backHeights;

  final String? selectedCalfLength;  // 선택된 종아리 길이
  final String? selectedThighWidth;  // 선택된 허벅지 너비
  final String? selectedThighLength; // 선택된 허벅지 길이
  final String? selectedBackHeight;  // 선택된 등판 높이

  final Function(String?) onCalfLengthSelected;
  final Function(String?) onThighWidthSelected;
  final Function(String?) onThighLengthSelected;
  final Function(String?) onBackHeightSelected;

  ShapeFilter({
    required this.calfLengths,
    required this.thighWidths,
    required this.thighLengths,
    required this.backHeights,
    this.selectedCalfLength,
    this.selectedThighWidth,
    this.selectedThighLength,
    this.selectedBackHeight,
    required this.onCalfLengthSelected,
    required this.onThighWidthSelected,
    required this.onThighLengthSelected,
    required this.onBackHeightSelected,
  });

  @override
  _ShapeFilterState createState() => _ShapeFilterState();
}

class _ShapeFilterState extends State<ShapeFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 종아리 길이 필터
        _buildShapeFilterItem(
          title: '종아리 길이',
          selectedValue: widget.selectedCalfLength,
          onDropdownChanged: widget.onCalfLengthSelected,
          dropdownOptions: widget.calfLengths,
        ),
        // 허벅지 너비 필터
        _buildShapeFilterItem(
          title: '허벅지 너비',
          selectedValue: widget.selectedThighWidth,
          onDropdownChanged: widget.onThighWidthSelected,
          dropdownOptions: widget.thighWidths,
        ),
        // 허벅지 길이 필터
        _buildShapeFilterItem(
          title: '허벅지 길이',
          selectedValue: widget.selectedThighLength,
          onDropdownChanged: widget.onThighLengthSelected,
          dropdownOptions: widget.thighLengths,
        ),
        // 등판 높이 필터
        _buildShapeFilterItem(
          title: '등판 높이',
          selectedValue: widget.selectedBackHeight,
          onDropdownChanged: widget.onBackHeightSelected,
          dropdownOptions: widget.backHeights,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _resetFilters,
          child: Text('초기화'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,  // primary -> backgroundColor로 변경
            foregroundColor: Colors.white,  // onPrimary -> foregroundColor로 변경
          ),
        )
      ],
    );
  }

  void _resetFilters() {
    widget.onCalfLengthSelected(null);
    widget.onThighWidthSelected(null);
    widget.onThighLengthSelected(null);
    widget.onBackHeightSelected(null);
  }

  // 필터 항목 UI를 구성하는 메서드
  Widget _buildShapeFilterItem({
    required String title,
    required String? selectedValue,
    required Function(String?) onDropdownChanged,
    required List<String> dropdownOptions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: selectedValue,
          hint: Text('선택하세요'),
          isExpanded: true,
          onChanged: onDropdownChanged,
          items: dropdownOptions
              .map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
              .toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
