class CProduct {
  final String productName;
  final String price;
  final String companyName;
  final String brand;
  final List<String> selectedOptions;
  final List<String?> selectedChairTypes;
  final List<String> selectedColorCodes;
  final String totalWidth;
  final String totalHeight;
  final String seatWidth;
  final String seatDepth;
  final String height;
  final String backrestHeight;
  final String detailedDescription;

  CProduct({
    required this.productName,
    required this.price,
    required this.companyName,
    required this.brand,
    required this.selectedOptions,
    required this.selectedChairTypes,
    required this.selectedColorCodes,
    required this.totalWidth,
    required this.totalHeight,
    required this.seatWidth,
    required this.seatDepth,
    required this.height,
    required this.backrestHeight,
    required this.detailedDescription,
  });
}
