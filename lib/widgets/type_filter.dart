// widgets/type_filter.dart

import 'package:flutter/material.dart';

class TypeFilter extends StatelessWidget {
  final List<String> types;
  final String? selectedType;
  final ValueChanged<String?> onTypeSelected;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  TypeFilter({
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
    required this.isExpanded,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('종류 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: isExpanded ? types.length : (types.length > 9 ? 9 : types.length),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final type = types[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Center(child: Text(type)),
                  selected: type == selectedType,
                  onTap: () => onTypeSelected(type),
                ),
              );
            },
          ),
          if (types.length > 9)
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: onToggleExpanded,
                child: Text(isExpanded ? '접기' : '펼쳐보기'),
              ),
            ),
        ],
      ),
    );
  }
}
