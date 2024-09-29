import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String detailed_option;
  final String image;
  final double price;
  final List<Color> colors;
  final String category;
  final double rate;
  bool isHeartSelected; // 하트 버튼 선택 상태

  Product({
    required this.title,
    required this.description,
    required this.detailed_option,
    required this.image,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
    this.isHeartSelected = false, // 기본값: 빈 하트가 선택되지 않은 상태
  });

  @override
  String toString() {
    return 'Product(title: $title, price: $price)';
  }
}

final List<Product> products = [
  Product(
    title: "의자 1",
    description: "의자 설명",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등 받아와서 따로 해야할듯 이거어디까지나오는거예요?",
    image: "assets/images/chair1.png",
    price: 50000,
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "",
    rate: 4.8,
  ),

  Product(
    title: "의자 2",
    description: "의자 설명?",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등 배열로 수정해야함",
    image: "assets/images/chair2.png",
    price: 20000,
    colors: [
      Colors.brown,
      Colors.red,
      Colors.pink,
    ],
    category: "",
    rate: 4.8,
  ),
  Product(
    title: "의자 3",
    description: "의자 설명?",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등 버튼 안누르면 두줄만",
    image: "assets/images/chair3.png",
    price: 30000,
    colors: [
      Colors.lightGreen,
      Colors.black26,
    ],
    category: "",
    rate: 4.8,
  ),
  Product(
    title: "의자 4",
    description: "의자 설명?",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등",
    image: "assets/images/chair4.png",
    price: 11000,
    colors: [
      Colors.blueGrey,
      Colors.purpleAccent,
      Colors.blueAccent,
      Colors.white12,
      Colors.black,
    ],
    category: "",
    rate: 4.8,
  ),
  Product(
    title: "의자 5",
    description: "의자 설명?",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등",
    image: "assets/images/chair5.png",
    price: 90000,
    colors: [
      Colors.redAccent,
      Colors.tealAccent,
      Colors.yellowAccent,
      Colors.deepPurple,
      Colors.indigo,
      Colors.grey,
    ],
    category: "",
    rate: 4.8,
  ),
  Product(
    title: "의자 6",
    description: "의자 설명?",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등",
    image: "assets/images/chair6.png",
    price: 20000,
    colors: [
      Colors.brown,
      Colors.black26,
      Colors.cyanAccent,
    ],
    category: "",
    rate: 4.8,
  ),
  Product(
    title: "의자 7",
    description: "의자 설명",
    detailed_option: "좌판 가로 깊이 높이와 등받이 높이 등 받아와서 따로 해야할듯 이거어디까지나오는거예요?",
    image: "assets/images/chair1.png",
    price: 50000,
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "",
    rate: 4.8,
  ),
];