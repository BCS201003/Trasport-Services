import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/Widgets/media_container.dart';
import 'package:untitled/Dashboard/Widgets/media_container1.dart';
import 'package:untitled/Dashboard/Widgets/media_container2.dart';
import 'package:untitled/Dashboard/Widgets/media_container3.dart';

class DashboardWG extends StatelessWidget implements PreferredSizeWidget {
  final String title1;

  const DashboardWG({
    super.key,
    required this.title1,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: TextStyle(
              fontSize: screenWidth * 0.06, // 6% of screen width for title font size
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // 2% of screen height
          SizedBox(
            height: screenHeight * 0.3, // 30% of screen height for the container
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.04), // 4% padding between items
                  BusContainer(),
                  SizedBox(width: screenWidth * 0.04),
                  BusContainer(),
                  SizedBox(width: screenWidth * 0.04),
                  BusContainer1(),
                  SizedBox(width: screenWidth * 0.04),
                  BusContainer2(),
                  SizedBox(width: screenWidth * 0.04),
                  BusContainer3(),
                  SizedBox(width: screenWidth * 0.04),
                  BusContainer(),
                  SizedBox(width: screenWidth * 0.04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
