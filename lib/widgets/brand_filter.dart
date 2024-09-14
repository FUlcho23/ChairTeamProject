// widgets/brand_filter.dart

import 'package:flutter/material.dart';

class BrandFilter extends StatelessWidget {
  final List<String> brands;
  final int currentPage;
  final int itemsPerPage;
  final ValueChanged<int> onPageChanged;

  BrandFilter({
    required this.brands,
    required this.currentPage,
    required this.itemsPerPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final int totalPages = (brands.length / itemsPerPage).ceil();
    final List<String> currentBrands = brands
        .skip((currentPage - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('브랜드 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: currentBrands.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Center(child: Text(currentBrands[index])),
                  onTap: () => print('${currentBrands[index]} 선택됨'),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          if (totalPages > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
                ),
                Text('$currentPage / $totalPages'),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
