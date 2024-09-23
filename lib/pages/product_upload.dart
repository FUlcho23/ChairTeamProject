import 'package:flutter/material.dart';
import '../widgets/db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductUpload(),
    );
  }
}

class ProductUpload extends StatefulWidget {
  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  // 상품명, 가격, 회사명, 브랜드
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productCompanyNameController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();

  List<String> selectedOptions = [];

  List<String> chairTypes = ["사무용/학생", "게이밍", "메쉬", "식탁", "안마", "접이식", "좌식", "베드벤치", "스툴"];
  List<String?> selectedChairTypes = [null];
  @override
  void initState() {
    super.initState();
    selectedChairTypes[0] = chairTypes[0]; // 첫 번째 항목으로 초기화
  }

  void addChairType() {
    setState(() {
      selectedChairTypes.add(null); // 새로운 드롭다운을 추가
    });
  }
  void removeChairType(int index) {
    setState(() {
      selectedChairTypes.removeAt(index); // 드롭다운 제거
    });
  }

  final List<String> colors = [
    '#000000', '#7F7F7F', '#BFBFBF', '#E4D7CC',
    '#6B5640', '#FCAAA7', '#698E73', '#AAF1CF',
    '#FFFFFF', '#E60600', '#EE6D10', '#FFD600',
    '#6FD44C', '#2686F7', '#253F9C', '#A030D4'
  ];
  List<bool> selectedColors = List.generate(16, (index) => false);

  // 전체너비, 전체높이, 좌판가로, 좌판세로, 높이, 등받이
  final TextEditingController totalWidthController = TextEditingController();
  final TextEditingController totalHeightController = TextEditingController();
  final TextEditingController seatWidthController = TextEditingController();
  final TextEditingController seatDepthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController backrestHeightController = TextEditingController();

  //상세설명
  final TextEditingController descriptionController = TextEditingController();

  int currentTextLength = 0;

  @override
  Widget build(BuildContext context) {
    double labelWidth = (MediaQuery.of(context).size.width - 80) / 2;
    double TextWidth = (MediaQuery.of(context).size.width - 60);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFF404040)),
          onPressed: () {},
        ),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.upload_file,
              color: Color(0xFF404040),
            ),
            SizedBox(width: 8),
            Text(
              '상품 등록',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF404040),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10, child: Container(color: Color(0xFF404040))),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width - 80) / 2,
                        height: (MediaQuery.of(context).size.width) / 2,
                        color: Colors.grey[400],
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "상품명*",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF404040),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: productNameController,
                              decoration: InputDecoration(
                                hintText: '상품명',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "가격*",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF404040),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: productPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '가격',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "회사명*",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: productCompanyNameController,
                    decoration: InputDecoration(
                      hintText: '회사명',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "브랜드명*",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: productBrandController,
                    decoration: InputDecoration(
                      hintText: '브랜드명',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "옵션 유무",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      OptionButton(
                        label: "목받침",
                        onOptionSelected: (String option, bool isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                      OptionButton(
                        label: "팔걸이",
                        onOptionSelected: (String option, bool isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                      OptionButton(
                        label: "바퀴",
                        onOptionSelected: (String option, bool isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                      OptionButton(
                        label: "등받이",
                        onOptionSelected: (String option, bool isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                      OptionButton(
                        label: "틸팅",
                        onOptionSelected: (String option, bool isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "의자 종류*",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedChairTypes[0],
                          hint: Text("의자 종류를 선택"),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          items: chairTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedChairTypes[0] = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: addChairType,
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(selectedChairTypes.length - 1, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedChairTypes[index + 1],
                              hint: Text("의자 종류 선택"),
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              items: chairTypes.map((String type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedChairTypes[index + 1] = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.remove), // - 아이콘
                            onPressed: () => removeChairType(index + 1),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "색상*",
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
                    children: List.generate(colors.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColors[index] = !selectedColors[index];
                          });
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(int.parse(colors[index].replaceAll('#', '0xFF'))),
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
                  SizedBox(height: 20),
                  Text(
                    "사이즈*",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft, // 왼쪽 정렬
                            child: Text("전체 너비(W)*", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: totalWidthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '전체 너비',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("전체 높이(H)*", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: totalHeightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '전체 높이',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("좌판 가로 너비(w)*", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: seatWidthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '좌판 가로 너비',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("좌판 세로 깊이(d)*", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: seatDepthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '좌판 세로 깊이',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("높이(h)", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '높이',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: labelWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("등받이 높이", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: backrestHeightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '등받이 높이',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("cm", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "제품 상세설명",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
                        width: TextWidth,
                        height: TextWidth,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: descriptionController,
                          maxLength: 120,
                          maxLines: null,
                          expands: true,
                          onChanged: (text) {
                            setState(() {
                              currentTextLength = text.length;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: '상세설명을 입력해주세요',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(10),
                            counterText: '', // 기본 글자 수 표시 제거
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Text(
                          "$currentTextLength/120",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 버튼들을 중앙 정렬
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 저장하기 버튼 클릭 시 동작
                          print('저장하기 버튼 클릭됨');

                          String productName = productNameController.text;
                          String price = productPriceController.text;
                          String companyName = productCompanyNameController.text;
                          String brand = productBrandController.text;
                          List<String> selectedColorCodes = [];
                          for (int i = 0; i < selectedColors.length; i++) {
                            if (selectedColors[i]) {
                              selectedColorCodes.add(colors[i]);
                            }
                          }
                          String totalWidth = totalWidthController.text;
                          String totalHeight = totalHeightController.text;
                          String seatWidth = seatWidthController.text;
                          String seatDepth = seatDepthController.text;
                          String height = heightController.text;
                          String backrestHeight = backrestHeightController.text;
                          String detailedDescription = descriptionController.text;

                          print('상품명: $productName');
                          print('가격: $price');
                          print('회사명: $companyName');
                          print('브랜드: $brand');
                          print('선택된 옵션들: $selectedOptions');
                          print('선택된 의자 종류: $selectedChairTypes');
                          print('선택된 색상: $selectedColorCodes');
                          print('전체 너비(W): $totalWidth');
                          print('전체 높이(H): $totalHeight');
                          print('좌판 가로 너비(w): $seatWidth');
                          print('좌판 세로 깊이(d): $seatDepth');
                          print('높이(h): $height');
                          print('등받이 높이: $backrestHeight');
                          print('상세설명: $detailedDescription');

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE9A05C), // 버튼 배경 색상
                          minimumSize: Size(200, 60), // 버튼 너비, 높이
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 내부 패딩
                        ),
                        child: Text(
                          '저장하기',
                          style: TextStyle(fontSize: 20, color: Colors.white), // 텍스트 스타일
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productCompanyNameController.dispose();
    productBrandController.dispose();
    totalWidthController.dispose();
    totalHeightController.dispose();
    seatWidthController.dispose();
    seatDepthController.dispose();
    heightController.dispose();
    backrestHeightController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

class OptionButton extends StatefulWidget {
  final String label;
  final Function(String, bool) onOptionSelected; // callback 함수 추가

  OptionButton({required this.label, required this.onOptionSelected});

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        // 선택된 상태를 부모에게 전달
        widget.onOptionSelected(widget.label, _isSelected);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF404040),
              ),
            ),
            if (_isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.check, size: 16, color: Colors.orangeAccent),
              ),
          ],
        ),
      ),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 하얀색 체크
    final whitePath = Path();
    whitePath.moveTo(size.width * 0.3, size.height * 0.55); // 하얀색 시작점
    whitePath.lineTo(size.width * 0.45, size.height * 0.7); // 하얀색 중간점
    whitePath.lineTo(size.width * 0.7, size.height * 0.35); // 하얀색 끝점
    canvas.drawPath(whitePath, whitePaint);

    // 검은색 체크
    final blackPath = Path();
    blackPath.moveTo(size.width * 0.33, size.height * 0.58); // 검은색 시작점
    blackPath.lineTo(size.width * 0.45, size.height * 0.7); // 검은색 중간점
    blackPath.lineTo(size.width * 0.68, size.height * 0.38); // 검은색 끝점
    canvas.drawPath(blackPath, blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


