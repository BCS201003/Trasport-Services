import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure this is added in pubspec.yaml

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
    // Fetch screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final tabBarWidth = screenWidth * 0.99;
    final tabBarHeight = screenHeight * 0.06; // Adjust as needed
    final tabWidth = (tabBarWidth) / 3 - 20; // 3 tabs with spacing
    final iconSize = screenWidth * 0.03; // Responsive icon size
    final fontSize = screenWidth * 0.04; // Responsive font size

    // Define the list of tabs with optional icons
    final List<_TabItem> tabs = [
      _TabItem(title: 'Overview', icon: Icons.info_outline),
      _TabItem(title: 'Comparison', icon: Icons.compare_arrows),
      _TabItem(title: 'Certified', icon: FontAwesomeIcons.checkCircle),
    ];

    return Center(
      child: Container(
        width: tabBarWidth,
        height: tabBarHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(tabBarHeight / 2), // Pill-shaped
          boxShadow: [
            // Soft shadow for elevated look
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Animated Indicator
            AnimatedAlign(
              alignment: Alignment(
                  (selectedIndex == 0)
                      ? -1
                      : (selectedIndex == 1)
                      ? 0
                      : 1, // Align indicator based on selected index
                  0),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: tabWidth,
                height: tabBarHeight * 0.7, // Slightly smaller than tab bar height
                decoration: BoxDecoration(
                  color: Colors.amber.shade700.withOpacity(0.2), // Subtle yellow accent
                  borderRadius: BorderRadius.circular(tabBarHeight * 0.35),
                ),
              ),
            ),
            // Tab Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tabs.asMap().entries.map((entry) {
                int idx = entry.key;
                _TabItem tab = entry.value;
                bool isSelected = idx == selectedIndex;

                return GestureDetector(
                  onTap: () => onTabSelected(idx),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (tab.icon != null)
                          Icon(
                            tab.icon,
                            size: iconSize,
                            color: isSelected ? Colors.amber.shade700 : Colors.black54,
                          ),
                        if (tab.icon != null) const SizedBox(width: 6),
                        Text(
                          tab.title,
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.amber.shade700 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper class to define tab items
class _TabItem {
  final String title;
  final IconData? icon;

  _TabItem({required this.title, this.icon});
}
