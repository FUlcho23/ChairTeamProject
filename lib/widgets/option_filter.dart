// widgets/option_filter.dart

import 'package:flutter/material.dart';

class OptionFilter extends StatelessWidget {
  final List<String> options;
  final Map<String, bool> optionSelections;
  final void Function(String, bool) onSelectionChanged;
  final void Function() onResetFilters;

  OptionFilter({
    required this.options,
    required this.optionSelections,
    required this.onSelectionChanged,
    required this.onResetFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('옵션 필터', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: options.map((option) {
              return FilterChip(
                label: Text(option),
                selected: optionSelections[option] ?? false,
                onSelected: (selected) => onSelectionChanged(option, selected),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onResetFilters,
              child: Text('초기화'),
            ),
          ),
        ],
      ),
    );
  }
}
