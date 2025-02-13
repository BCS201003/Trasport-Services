import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/orc_widget/contactview_widget/PointWidget2/verify_certificate.dart';

class Case3Widget extends StatelessWidget {
  const Case3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final containerWidth = screenWidth * 0.9;
    final containerHeight = screenHeight * 0.28;
    final padding = screenWidth * 0.04;
    final buttonWidth = screenWidth * 0.30;
    final buttonHeight = screenHeight * 0.04;
    final imageWidth = screenWidth * 0.5;
    final imageHeight = screenHeight * 0.15;
    final spacing = screenHeight * 0.015;

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.black.withOpacity(0.7),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Verify Button (Yellow Accent)
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerifyCertificateWidget(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing),

                  // Download Button (Black)
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Download button action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Download',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Divider (Stylized)
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing),
                child: Container(
                  width: containerWidth * 0.8,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.amber.shade700, // Yellow Accent
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ),

              // Certificate Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/Certified.png',
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
