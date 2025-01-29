// lib/Widgets/Expend/expend_container.dart

import 'package:flutter/material.dart';

class ExpandableContainer2 extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget expandedContent;

  const ExpandableContainer2({
    super.key,
    required this.title,
    required this.icon,
    required this.expandedContent,
  });

  @override
  State<ExpandableContainer2> createState() => _ExpandableContainer2State();
}

class _ExpandableContainer2State extends State<ExpandableContainer2> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(widget.icon, color: Colors.black),
              onPressed: toggleExpand,
            ),
            onTap: toggleExpand,
          ),
          if (isExpanded) widget.expandedContent,
        ],
      ),
    );
  }
}
