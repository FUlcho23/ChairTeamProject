// widgets/price_filter.dart

import 'package:flutter/material.dart';

class PriceFilter extends StatelessWidget {
  final String selectedOption;
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;
  final ValueChanged<String?> onOptionSelected;
  final VoidCallback onSearchPressed;

  PriceFilter({
    required this.selectedOption,
    required this.minPriceController,
    required this.maxPriceController,
    required this.onOptionSelected,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('금액 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Column(
            children: [
              ...['전체보기', '5만원 이하', '5만원 ~ 10만원 이하', '10만원 ~ 20만원 이하', '20만원 이상']
                  .map((option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: onOptionSelected,
              ))
                  .toList(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minPriceController,
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
                      controller: maxPriceController,
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
                  onPressed: onSearchPressed,
                  child: Text('검색하기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
