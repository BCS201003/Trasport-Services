// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:untitled/Payment/enroll.dart';
import 'package:untitled/Seats/view/seats.dart';

class BusContainer2 extends StatelessWidget {
  const BusContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.4, // 40% of screen width
      height: screenHeight * 0.3, // 30% of screen height
      margin: EdgeInsets.only(right: screenWidth * 0.04), // 4% of screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02), // 2% of screen width
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: screenWidth * 0.01, // 1% of screen width
            blurRadius: screenWidth * 0.02, // 2% of screen width
            offset: Offset(0, screenHeight * 0.005), // 0.5% of screen height
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.12, // 12% of screen height
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/BusSample3.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(screenWidth * 0.02), // 2% of screen width
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02), // 2% of screen width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.005), // 0.5% of screen height
                  Text(
                    'Route 3',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035, // Adjust font size
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: screenWidth * 0.04, // 4% of screen width
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Price :PKR 1599',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: screenWidth * 0.02, // Adjust font size
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.33, // Adjust line height
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: screenWidth * 0.02), // Adjust spacing
                      Text(
                        'PKR 1807',
                        style: TextStyle(
                          fontSize: screenWidth * 0.02, // Adjust font size
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01), // Adjust spacing
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.35, // Adjust button width
                      height: screenHeight * 0.04, // Adjust button height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BusSeatingScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(screenWidth * 0.012), // Adjust radius
                            ),
                          ),
                        ),
                        child: Text(
                          'Go Now',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // Adjust font size
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
