import 'package:flutter/material.dart';
import 'package:chair/ProductCard & Products/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상품 색 컨테이너
            Container(
              padding: EdgeInsets.only(top: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  widget.product.colors.length,
                      (cindex) => Container(
                    height: 15,
                    width: 15,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: widget.product.colors[cindex],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 상품 이미지 컨테이너
            Expanded(
              child: Container(
                child: AspectRatio(
                  aspectRatio: 3 / 5,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // 상품 이름 컨테이너
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  widget.product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            // 세부사항 (생략)
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: TextButton(
                onPressed: () {
                  print('세부사항 버튼이 눌러졌습니다');
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
                              Icons.expand_more,
                              color: Color(0xFF5E5E5E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        widget.product.detailed_option,
                        style: TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.start, // 텍스트를 왼쪽으로 정렬
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
                    "${widget.product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.product.isHeartSelected = !widget.product.isHeartSelected;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                    child: Image.asset(
                      widget.product.isHeartSelected
                          ? 'assets/images/heart.png'
                          : 'assets/images/empty_heart.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
