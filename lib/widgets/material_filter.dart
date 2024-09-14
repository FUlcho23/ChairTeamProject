import 'package:flutter/material.dart';

class MaterialFilter extends StatelessWidget {
  final List<String> materials;
  final String? selectedMaterial;
  final ValueChanged<String?> onMaterialSelected;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  MaterialFilter({
    required this.materials,
    required this.selectedMaterial,
    required this.onMaterialSelected,
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
          Text(
            '재질 필터',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: isExpanded ? materials.length : (materials.length > 9 ? 9 : materials.length),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final material = materials[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Center(child: Text(material)),
                  selected: material == selectedMaterial,
                  onTap: () => onMaterialSelected(material),
                ),
              );
            },
          ),
          if (materials.length > 9)
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
