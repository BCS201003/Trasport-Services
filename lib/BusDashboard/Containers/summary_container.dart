import 'package:flutter/material.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          title: const Text(
            'Summary',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            ListTile(
              title: const Text(
                'Available',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('50%'),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: screenHeight * 0.05,
                    height: screenHeight * 0.05,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
                    ),
                  ),
                  Image.asset(
                    'assets/MaskGroupFile.png',
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
