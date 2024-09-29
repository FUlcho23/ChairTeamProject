import 'package:chair/pages/product_upload.dart';
import 'package:flutter/material.dart';
import 'package:chair/widgets/bottom_navi_bar.dart';
import '../models/Cproduct.dart';
import 'searchpage.dart';
import 'product_filters.dart';

Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.replaceFirst('#', '0xff')));
}

void main() {
  runApp(MaterialApp(
    home: CompanyFirstPage(
      products: [], // 초기 상품 목록을 빈 리스트로 설정
      onProductAdded: (newProduct) {
        // 상품 추가 로직
        // 이곳에 상품을 저장하거나 다른 로직을 구현하세요.
        print('새로운 상품이 추가되었습니다: ${newProduct.productName}');
      },
    ),
  ));
}

class CompanyFirstPage extends StatefulWidget {
  final List<CProduct> products; // 상품 목록을 받을 변수
  final Function(CProduct) onProductAdded; // 상품 추가 콜백 추가

  CompanyFirstPage({
    Key? key,
    this.products = const [],
    required this.onProductAdded, // 필수 인자로 수정
  }) : super(key: key);

  @override
  _CompanyFirstPage createState() => _CompanyFirstPage();
}

class _CompanyFirstPage extends State<CompanyFirstPage> {
  int _selectedIndex = 0;
  bool isExpanded = false;
  List<CProduct> _products = []; // 저장된 상품 리스트

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addProduct(CProduct product) {
    setState(() {
      _products.add(product); // 새 상품을 리스트에 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(242, 235, 223, 1.0);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: customColor,
        body: Column(
          children: [
            SizedBox(height: 31),
            _buildSearchBar(customColor, context),
            _buildDivider(),
            ProductFilters(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: _products.length + 1, // 상품 개수 + 1 (등록 버튼)
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductUpload(onProductAdded: _addProduct),
                          ),
                        );
                      },
                      child: Container(
                        width: 168,
                        height: 272,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 150,
                              color: Colors.black,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '상품을 추가하려면\n여기를 누르세요',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // 등록된 상품 카드 표시
                    final product = _products[index - 1]; // 첫 번째 카드 제외
                    return Card(
                      color: Colors.white, // 카드 배경색을 흰색으로 설정
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                product.selectedColorCodes.length,
                                    (cindex) => Container(
                                  height: 15,
                                  width: 15,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: hexToColor(product.selectedColorCodes[cindex]),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF7F7F7F), // Color를 const로 지정
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 상품 이미지 대신 네모상자
                          Expanded(
                            child: Container(
                              width: 120,
                              height: 120,
                              color: Colors.grey[300], // 배경색을 원하는 색으로 설정
                              // 원하는 스타일 속성을 추가할 수 있습니다.
                            ),
                          ),
                          // 상품 이름 컨테이너
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                product.productName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          // 세부사항
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  // 버튼을 누를 때마다 확장/축소 상태 변경
                                  isExpanded = !isExpanded;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // 버튼 내부의 패딩을 제거합니다.
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // 세부사항과 옵션을 왼쪽으로 정렬합니다.
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '세부사항',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF5E5E5E),
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15.0),
                                          child: Icon(
                                            isExpanded ? Icons.expand_less : Icons.expand_more,
                                            color: Color(0xFF5E5E5E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: SingleChildScrollView( // 세부사항 내용이 넘칠 경우 스크롤 가능하게
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            isExpanded
                                                ? '회사명: ${product.companyName}\n'
                                                '브랜드: ${product.brand}\n'
                                                '선택 옵션: ${product.selectedOptions.join(", ")}\n'
                                                '의자 타입: ${product.selectedChairTypes.join(", ")}\n'
                                                '전체 너비: ${product.totalWidth}\n'
                                                '전체 높이: ${product.totalHeight}\n'
                                                '좌석 너비: ${product.seatWidth}\n'
                                                '좌석 깊이: ${product.seatDepth}\n'
                                                '높이: ${product.height}\n'
                                                '등받이 높이: ${product.backrestHeight}\n'
                                                '상세 설명: ${product.detailedDescription}'
                                                : '전체 너비: ${product.totalWidth}, '
                                                '전체 높이: ${product.totalHeight}, '
                                                '좌석 너비: ${product.seatWidth}, '
                                                '좌석 깊이: ${product.seatDepth}',
                                            style: TextStyle(
                                              color: Color(0xFF5E5E5E),
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.start, // 텍스트를 왼쪽으로 정렬
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 상품 가격 컨테이너 및 하트 버튼
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "${product.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildSearchBar(Color customColor, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 9,
      color: customColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () {
                print('메인 아이콘 클릭됨');
              },
              child: Image.asset(
                'assets/images/mainicon.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFFE9A05C), width: 3.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '검색어를 입력해주세요.',
                        style: TextStyle(color: Color(0xFF7F7F7F)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 3.0,
                      color: Color(0xFFE9A05C),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Color(0xFF7F7F7F),
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      height: 10,
      child: Container(
        color: Color(0xFF404040),
      ),
    );
  }
}
