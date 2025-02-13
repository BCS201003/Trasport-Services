import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class VerifyCertificateWidget extends StatelessWidget {
  const VerifyCertificateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Part-I Media Foundation & Civic Learning',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Verify Learner Certificate',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2A4B6B),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter the learner\'s credential ID to verify the certificate.',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Input Field and Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TextField with custom width and height using MediaQuery
                  SizedBox(
                    width: screenWidth * 0.55,  // Adjusted width of the TextField
                    height: screenHeight * 0.05,  // Adjusted height of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Credential ID',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8), // Adjusted padding
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Verify Button with custom width, height, and border-radius using MediaQuery
                  SizedBox(
                    width: screenWidth * 0.24,  // Adjusted width of the button
                    height: screenHeight * 0.05, // Adjusted height of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Verify button action
                        // You can add your verification logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF45C881),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 5px border-radius
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Image with width and height using MediaQuery
              Image.asset(
                'assets/certificate.png',
                width: screenWidth * 0.45,
                height: screenHeight * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
