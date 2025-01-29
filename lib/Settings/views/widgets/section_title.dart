import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Some versions of Flutter removed 'subtitle1'; use 'titleMedium' or
    // whichever text style you prefer for your headings.
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
