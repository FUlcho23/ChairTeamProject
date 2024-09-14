import 'package:flutter/material.dart';
import '../models/filters.dart';
import '../widgets/brand_filter.dart';
import '../widgets/price_filter.dart';
import '../widgets/option_filter.dart';
import '../widgets/type_filter.dart';

class ProductFilters extends StatefulWidget {
  @override
  _ProductFiltersState createState() => _ProductFiltersState();
}

class _ProductFiltersState extends State<ProductFilters> {
  final FilterOptions _filterOptions = FilterOptions();
  String? _activeFilter; // 현재 활성화된 필터를 추적
  String _selectedPriceOption = '전체보기';
  TextEditingController _minPriceController = TextEditingController();
  TextEditingController _maxPriceController = TextEditingController();
  int _currentPage = 1;
  final int _itemsPerPage = 9;
  bool _isTypesExpanded = false;
  String _selectedType = ''; // 기본값을 빈 문자열로 설정
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
        if (_activeFilter == '브랜드') BrandFilter(
          brands: _filterOptions.brands,
          currentPage: _currentPage,
          itemsPerPage: _itemsPerPage,
          onPageChanged: (page) => setState(() => _currentPage = page),
        ),
        if (_activeFilter == '금액') PriceFilter(
          selectedOption: _selectedPriceOption,
          minPriceController: _minPriceController,
          maxPriceController: _maxPriceController,
          onOptionSelected: (option) => setState(() => _selectedPriceOption = option ?? '전체보기'),
          onSearchPressed: _onSearchPressed,
        ),
        if (_activeFilter == '옵션') OptionFilter(
          options: _filterOptions.options,
          optionSelections: _optionSelections,
          onSelectionChanged: (option, isSelected) => setState(() => _optionSelections[option] = isSelected),
          onResetFilters: _resetFilters,
        ),
        if (_activeFilter == '종류') TypeFilter(
          types: _filterOptions.types,
          selectedType: _selectedType,
          onTypeSelected: (type) => setState(() => _selectedType = type ?? ''),
          isExpanded: _isTypesExpanded,
          onToggleExpanded: () => setState(() => _isTypesExpanded = !_isTypesExpanded),
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
                      onPressed: () => _toggleFilter(_filterOptions.detailedFilter[index]),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(0),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
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
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              print('+버튼 클릭됨');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Image.asset(
                'assets/images/addbutton.png',
                height: 60,
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFilter(String filter) {
    setState(() {
      if (_activeFilter == filter) {
        _activeFilter = null; // 클릭한 필터가 이미 활성화되어 있으면 비활성화
      } else {
        _activeFilter = filter; // 클릭한 필터를 활성화
      }
    });
  }

  void _onSearchPressed() {
    // 검색 버튼 클릭 시 동작
  }

  void _resetFilters() {
    // 필터 초기화
  }
}
