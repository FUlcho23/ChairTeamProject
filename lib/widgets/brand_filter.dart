import 'package:flutter/material.dart';

class BrandFilter extends StatelessWidget {
  final List<String> brands;
  final String? selectedBrand;
  final ValueChanged<String?> onBrandSelected;
  final int itemsPerPage;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  BrandFilter({
    required this.brands,
    required this.selectedBrand,
    required this.onBrandSelected,
    required this.itemsPerPage,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('브랜드 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, // 버튼의 최대 가로 크기
            childAspectRatio: 3 / 2, // 가로:세로 비율을 고정
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            final isSelected = selectedBrand == brand;

            return ElevatedButton(
              onPressed: () => onBrandSelected(brand),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.black : Colors.grey[300],
                foregroundColor: isSelected ? Colors.white : Colors.black,
                side: isSelected ? BorderSide(color: Colors.black, width: 2) : null,
              ),
              child: Text(brand),
            );
          },
        ),
      ],
    );
  }
}
