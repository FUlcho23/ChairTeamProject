import 'package:flutter/material.dart';

class BrandFilter extends StatefulWidget {
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
  _BrandFilterState createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  String? _previousSelectedBrand;

  void _handleBrandTap(String brand) {
    if (brand == widget.selectedBrand) {
      // 이미 선택된 브랜드를 다시 클릭했을 경우 선택 해제
      widget.onBrandSelected(null);
    } else {
      widget.onBrandSelected(brand);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = (widget.currentPage - 1) * widget.itemsPerPage;
    final int endIndex = (startIndex + widget.itemsPerPage).clamp(0, widget.brands.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('브랜드 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: endIndex - startIndex,
          itemBuilder: (context, index) {
            final brand = widget.brands[startIndex + index];
            final isSelected = widget.selectedBrand == brand;

            return ElevatedButton(
              onPressed: () => _handleBrandTap(brand), // 클릭 처리 메소드 호출
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.black : Colors.grey[300],
                foregroundColor: isSelected ? Colors.white : Colors.black,
                side: isSelected ? BorderSide(color: Colors.black, width: 2) : null,
              ),
              child: Text(brand),
            );
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.currentPage > 1)
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => widget.onPageChanged(widget.currentPage - 1),
              ),
            Text('${widget.currentPage} 페이지'),
            if (endIndex < widget.brands.length)
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => widget.onPageChanged(widget.currentPage + 1),
              ),
          ],
        ),
      ],
    );
  }
}
