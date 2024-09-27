import 'package:flutter/material.dart';
import '../models/filters.dart';
import '../widgets/brand_filter.dart';
import '../widgets/price_filter.dart';
import '../widgets/option_filter.dart';
import '../widgets/type_filter.dart';
import '../widgets/shape_filter.dart';
import '../widgets/material_filter.dart'; // MaterialFilter 위젯 임포트
import '../widgets/color_filter.dart'; // ColorFilter 위젯 임포트 (필요한 경우)
import '../pages/product_upload.dart'; // CheckmarkPainter 임포트 (파일 이름에 따라 변경)

class ProductFilters extends StatefulWidget {
  @override
  _ProductFiltersState createState() => _ProductFiltersState();
}

class _ProductFiltersState extends State<ProductFilters> {
  final FilterOptions _filterOptions = FilterOptions();
  List<bool> _isFilterVisible = List.generate(7, (_) => false); // 필터 개수 6 -> 7로 확장
  String _selectedPriceOption = '전체보기';
  TextEditingController _minPriceController = TextEditingController();
  TextEditingController _maxPriceController = TextEditingController();
  int _currentPage = 1;
  final int _itemsPerPage = 9;
  bool _isTypesExpanded = false;
  String? _selectedBrand;  // 선택된 브랜드를 저장할 필드 추가
  String? _selectedType;
  String? _selectedCalfLength;
  String? _selectedThighWidth;
  String? _selectedThighLength;
  String? _selectedBackHeight;
  String? _selectedMaterial; // 선택된 재질 저장
  List<bool> selectedColors = List.generate(16, (_) => false); // 기본적으로 선택되지 않은 상태
  final Map<String, bool> _optionSelections = {};

  @override
  void initState() {
    super.initState();
    for (var option in _filterOptions.options) {
      _optionSelections[option] = false;
    }
  }

  @override
  void dispose() {
    // 메모리 누수 방지: TextEditingController 해제
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // 스크롤 가능하게 감싸기
      child: Column(
        children: [
          _buildFilterBar(),
          if (_isFilterVisible[1])
            BrandFilter(
              brands: _filterOptions.brands,
              selectedBrand: _selectedBrand,
              onBrandSelected: (brand) => setState(() {
                _selectedBrand = brand;
              }),
              itemsPerPage: _itemsPerPage,
              currentPage: _currentPage,
              onPageChanged: (page) => setState(() => _currentPage = page),
            ),
          if (_isFilterVisible[0])
            PriceFilter(
              selectedOption: _selectedPriceOption,
              minPriceController: _minPriceController,
              maxPriceController: _maxPriceController,
              onOptionSelected: (option) =>
                  setState(() => _selectedPriceOption = option ?? '전체보기'),
              onSearchPressed: _onSearchPressed,
            ),
          if (_isFilterVisible[2])
            OptionFilter(
              options: _filterOptions.options,
              optionSelections: _optionSelections,
              onSelectionChanged: (option, isSelected) =>
                  setState(() => _optionSelections[option] = isSelected),
              onResetFilters: _resetFilters,
            ),
          if (_isFilterVisible[3])
            TypeFilter(
              types: _filterOptions.types,
              selectedType: _selectedType,
              onTypeSelected: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
              // isExpanded: _isTypesExpanded, // 이 줄은 삭제하세요
              // onToggleExpanded: () { setState(() { _isTypesExpanded = !_isTypesExpanded; }); }, // 이 줄도 삭제하세요
            ),
          if (_isFilterVisible[4])
            ShapeFilter(
              calfLengths: _filterOptions.calfLengths,
              thighWidths: _filterOptions.thighWidths,
              thighLengths: _filterOptions.thighLengths,
              backHeights: _filterOptions.backHeights,
              selectedCalfLength: _selectedCalfLength,
              selectedThighWidth: _selectedThighWidth,
              selectedThighLength: _selectedThighLength,
              selectedBackHeight: _selectedBackHeight,
              onCalfLengthSelected: (length) =>
                  setState(() => _selectedCalfLength = length),
              onThighWidthSelected: (width) =>
                  setState(() => _selectedThighWidth = width),
              onThighLengthSelected: (length) =>
                  setState(() => _selectedThighLength = length),
              onBackHeightSelected: (height) =>
                  setState(() => _selectedBackHeight = height),
            ),
          if (_isFilterVisible[5])
            MaterialFilter(
              materials: _filterOptions.materials,
              selectedMaterial: _selectedMaterial,
              onMaterialSelected: (value) {
                setState(() {
                  _selectedMaterial = value;
                });
              },
            ),
          if (_isFilterVisible[6])
            _buildColorFilter(),
        ],
      ),
    );
  }

  Widget _buildColorFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "색상 필터",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF404040),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: List.generate(_filterOptions.colors.length, (index) {
            return InkWell(  // GestureDetector 대신 InkWell 사용
              onTap: () {
                setState(() {
                  selectedColors[index] = !selectedColors[index];
                });
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color(int.parse(_filterOptions.colors[index].replaceAll('#', '0xFF'))),
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

  Widget _buildFilterBar() {
    return Container(
      height: 50,
      color: Color(0xFF7F7F7F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_filterOptions.detailedFilter.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                      onPressed: () => _toggleFilter(index),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7F7F7F)),
                      ),
                      child: Text(
                        _filterOptions.detailedFilter[index],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _onSearchPressed() {
    // 검색 버튼 클릭 시 동작
  }

  void _resetFilters() {
    // 필터 초기화 메소드
    setState(() {
      _selectedPriceOption = '전체보기';
      _minPriceController.clear();
      _maxPriceController.clear();
      _selectedBrand = null;
      _selectedType = null;
      _selectedCalfLength = null;
      _selectedThighWidth = null;
      _selectedThighLength = null;
      _selectedBackHeight = null;
      _selectedMaterial = null;
      selectedColors = List.generate(16, (_) => false);
      _optionSelections.updateAll((key, value) => false);
    });
  }

  void _toggleFilter(int index) {
    setState(() {
      _isFilterVisible = List.generate(
          _isFilterVisible.length, (i) => i == index ? !_isFilterVisible[i] : false);
    });
  }
}
