import 'package:flutter/material.dart';
import '../models/filters.dart';
import '../widgets/brand_filter.dart';
import '../widgets/price_filter.dart';
import '../widgets/option_filter.dart';
import '../widgets/type_filter.dart';
import '../widgets/shape_filter.dart';
import '../widgets/material_filter.dart'; // MaterialFilter 위젯 임포트

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
  String? _selectedType;
  String? _selectedCalfLength;
  String? _selectedThighWidth;
  String? _selectedThighLength;
  String? _selectedBackHeight;
  String? _selectedMaterial; // 선택된 재질 저장
  final Map<String, bool> _optionSelections = {};

  @override
  void initState() {
    super.initState();
    for (var option in _filterOptions.options) {
      _optionSelections[option] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterBar(),
        if (_isFilterVisible[1])
          BrandFilter(
            brands: _filterOptions.brands,
            currentPage: _currentPage,
            itemsPerPage: _itemsPerPage,
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
            onTypeSelected: (type) => setState(() => _selectedType = type ?? ''),
            isExpanded: _isTypesExpanded,
            onToggleExpanded: () =>
                setState(() => _isTypesExpanded = !_isTypesExpanded),
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
            materials: [
              '메쉬',
              '인조가죽',
              '합성가죽',
              '천연가죽',
              '패브릭',
              '목재',
              '플라스틱',
              '기타'
            ],
            selectedMaterial: _selectedMaterial,
            onMaterialSelected: (material) =>
                setState(() => _selectedMaterial = material),
            isExpanded: _isTypesExpanded, // 여기에 맞는 bool 값
            onToggleExpanded: () =>
                setState(() => _isTypesExpanded = !_isTypesExpanded), // 토글 함수
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
                children: List.generate(_filterOptions.detailedFilter.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                          onPressed: () => _toggleFilter(index),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.all(0),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            elevation:
                            MaterialStateProperty.all<double>(0),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                              Color(0xFF7F7F7F),
                            ),
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
    // 필터 초기화
  }

  void _toggleFilter(int index) {
    setState(() {
      _isFilterVisible = List.generate(_isFilterVisible.length,
              (i) => i == index ? !_isFilterVisible[i] : false);
    });
  }
}
