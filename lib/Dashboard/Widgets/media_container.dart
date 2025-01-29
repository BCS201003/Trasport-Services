// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:untitled/Payment/enroll.dart';
import 'package:untitled/Seats/view/seats.dart';

class BusContainer extends StatelessWidget {
  const BusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.3,
      margin: EdgeInsets.only(right: screenWidth * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BusSample.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Route 1',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: screenWidth * 0.04,
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Price :PKR 189',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: screenWidth * 0.025,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'PKR 200',
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.35,
                      height: screenHeight * 0.04,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BusSeatingScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.01)),
                          ),
                        ),
                        child: const Text(
                          'Go Now',
                          style: TextStyle(
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
