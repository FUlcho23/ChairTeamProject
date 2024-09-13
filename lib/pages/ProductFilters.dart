import 'package:flutter/material.dart';

class ProductFilters extends StatefulWidget {
  @override
  _ProductFiltersState createState() => _ProductFiltersState();
}

class _ProductFiltersState extends State<ProductFilters> {
  final List<String> detailedFilter = ['금액', '브랜드', '옵션', '종류', '체형', '재질'];
  final List<String> brands = [
    '시디즈', '허먼밀러', '린백', '듀오백', '코멧', '제닉스', '이케아',
    '문스타', '클라우드백', '휴먼스케일', '스틸케이스'
  ];
  List<bool> _isFilterVisible = List.generate(6, (_) => false);
  String _selectedPriceOption = '전체보기';
  TextEditingController _minPriceController = TextEditingController();
  TextEditingController _maxPriceController = TextEditingController();
  int _currentPage = 1;
  final int _itemsPerPage = 9;

  // 옵션 필터 항목 및 선택 상태
  final List<String> options = ['목받침', '팔걸이', '등받이', '바퀴'];
  final Map<String, bool> _optionSelections = {};

  @override
  void initState() {
    super.initState();
    for (var option in options) {
      _optionSelections[option] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterBar(),
        if (_isFilterVisible[1]) _buildBrandFilter(),
        if (_isFilterVisible[0]) _buildPriceFilter(),
        if (_isFilterVisible[2]) _buildOptionFilter(), // 옵션 필터 추가
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
                children: List.generate(detailedFilter.length, (index) {
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
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF7F7F7F),
                        ),
                      ),
                      child: Text(
                        detailedFilter[index],
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

  void _toggleFilter(int index) {
    setState(() {
      _isFilterVisible = List.generate(_isFilterVisible.length, (i) {
        return i == index ? !_isFilterVisible[i] : false;
      });
    });
  }

  Widget _buildBrandFilter() {
    final int totalPages = (brands.length / _itemsPerPage).ceil();
    final List<String> currentBrands = brands
        .skip((_currentPage - 1) * _itemsPerPage)
        .take(_itemsPerPage)
        .toList();

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '브랜드 필터',
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
            itemCount: currentBrands.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Center(child: Text(currentBrands[index])),
                  onTap: () {
                    print('${currentBrands[index]} 선택됨');
                  },
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
                  onPressed: _currentPage > 1
                      ? () {
                    setState(() {
                      _currentPage--;
                    });
                  }
                      : null,
                ),
                Text('$_currentPage / $totalPages'),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _currentPage < totalPages
                      ? () {
                    setState(() {
                      _currentPage++;
                    });
                  }
                      : null,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPriceFilter() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '금액 필터',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              ...['전체보기', '5만원 이하', '5만원 ~ 10만원 이하', '10만원 ~ 20만원 이하', '20만원 이상'].map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedPriceOption,
                  onChanged: _onPriceOptionSelected,
                );
              }).toList(),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: '최소 가격',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _maxPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: '최대 가격',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSearchPressed,
                  child: Text('검색하기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionFilter() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '옵션 필터',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...options.map((option) => _buildOptionRow(option)).toList(),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _resetFilters,
              child: Text('초기화'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(String option) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,  // 중앙 정렬
      children: [
        _buildOptionButton(option, true), // O 버튼
        SizedBox(width: 10), // 버튼 사이의 간격
        Text(
          option,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 10), // 버튼 사이의 간격
        _buildOptionButton(option, false), // X 버튼
      ],
    );
  }

  Widget _buildOptionButton(String option, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _optionSelections[option] = isSelected;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          _optionSelections[option] == isSelected
              ? Colors.orange
              : Colors.grey,
        ),
      ),
      child: Text(
        isSelected ? 'O' : 'X',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  void _onPriceOptionSelected(String? option) {
    setState(() {
      _selectedPriceOption = option ?? '전체보기';
    });
  }

  void _onSearchPressed() {
    print('검색하기 버튼이 눌렸습니다.');
    print('선택된 가격 옵션: $_selectedPriceOption');
    print('최소 가격: ${_minPriceController.text}');
    print('최대 가격: ${_maxPriceController.text}');
  }

  void _resetFilters() {
    setState(() {
      for (var option in options) {
        _optionSelections[option] = false;
      }
    });
  }
}
