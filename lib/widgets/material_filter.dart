import 'package:flutter/material.dart';

class MaterialFilter extends StatelessWidget {
  final List<String> materials;
  final String? selectedMaterial;
  final Function(String?) onMaterialSelected;

  MaterialFilter({
    required this.materials,
    required this.selectedMaterial,
    required this.onMaterialSelected,
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
          Text('재질 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: buttonAspectRatio,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: materials.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              String material = materials[index];
              bool isSelected = selectedMaterial == material;

              return ElevatedButton(
                onPressed: () {
                  // 재선택 시 취소 처리
                  onMaterialSelected(isSelected ? null : material);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.black : Colors.grey[300],
                  foregroundColor: isSelected ? Colors.white : Colors.black,
                  side: isSelected ? BorderSide(color: Colors.black, width: 2) : null,
                ),
                child: Text(material),
              );
            },
          ),
        ],
      ),
    );
  }
}
