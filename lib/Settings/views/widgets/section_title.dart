// lib/widgets/section_title.dart
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // If Material 3 is enabled and old style properties are removed,
    // you can use `titleMedium`, `titleLarge`, etc.
    return Padding(
      padding: const EdgeInsets.fromLTRB(107, 16, 0, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
