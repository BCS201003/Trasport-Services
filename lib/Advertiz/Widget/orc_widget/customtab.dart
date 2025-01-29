import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTabItem('Overview', 0),
            _buildTabItem('Resources', 1),
            _buildTabItem('Certificate', 2),
          const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,top: 8.0, bottom: 8.0),
        child: Container(
          width: 100,
          height: 46,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? Colors.black
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 30 / 25,
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
