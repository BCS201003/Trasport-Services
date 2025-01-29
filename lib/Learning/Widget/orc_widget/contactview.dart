import 'package:flutter/material.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/case1.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/case2.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/case3.dart';

class ContentView extends StatelessWidget {
  final int selectedIndex;

  const ContentView({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const Case1Widget();
      case 1:
        return const Case2Widget();
      case 2:
        return const Case3Widget();
      default:
        return Container();
    }
  }
}