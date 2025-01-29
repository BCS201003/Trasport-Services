import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/orc_widget/contactview.dart';
import 'package:untitled/Advertiz/Widget/orc_widget/customtab.dart';

class ORC extends StatefulWidget {
  const ORC({super.key});

  @override
  ORCState createState() => ORCState();
}

class ORCState extends State<ORC> {
  int _selectedIndex = 1;

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (kDebugMode) {
      print('$_selectedIndex');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('$_selectedIndex');
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTabBar(
            selectedIndex: _selectedIndex,
            onTabSelected: _updateSelectedIndex,
          ),
          const SizedBox(height: 20),
          ContentView(selectedIndex: _selectedIndex),
        ],
      ),
    );
  }
}

