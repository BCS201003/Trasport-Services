import 'package:flutter/material.dart';

class CustomDropdownTile extends StatelessWidget {
  final String title;
  final String currentValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownTile({
    Key? key,
    required this.title,
    required this.currentValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: DropdownButton<String>(
        value: currentValue,
        // Convert your items list into DropdownMenuItem widgets
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        underline: const SizedBox(), // Remove default underline
      ),
    );
  }
}
