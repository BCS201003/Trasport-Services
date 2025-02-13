import 'package:flutter/material.dart';

class PercentageContainer extends StatelessWidget {
  const PercentageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // Removes extra dividers
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            title: const Text(
              'Percentage',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                color: Colors.black87,
              ),
            ),
            iconColor: const Color(0xFF343A40),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // Circular Percentage Indicator
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: screenHeight * 0.06,
                          height: screenHeight * 0.06,
                          child: CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: 5.5,
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                          ),
                        ),
                        Image.asset(
                          'assets/Percentage.png',
                          width: screenHeight * 0.035,
                          height: screenHeight * 0.035,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // Text Content
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '50%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
