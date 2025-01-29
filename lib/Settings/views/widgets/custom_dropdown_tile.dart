// lib/widgets/custom_dropdown_tile.dart
import 'package:flutter/material.dart';

class CustomDropdownTile extends StatelessWidget {
  final String title;
  final String currentValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownTile({
    super.key,
    required this.title,
    required this.currentValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: DropdownButton<String>(
        value: currentValue,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        underline: const SizedBox(),
      ),
    );
  }
}
