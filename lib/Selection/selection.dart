import 'package:flutter/material.dart';
import 'package:untitled/Selection/Admin/admin.dart';
import 'package:untitled/Selection/Driver/driver.dart';
import 'package:untitled/Selection/Passenger/passenger.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Selection"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: screenWidth * 0.3,
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text(
              'Are You?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DriverScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(screenWidth * 0.5, 50),
              ),
              child: const Text('DRIVER'),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(screenWidth * 0.5, 50),
              ),
              child: const Text('ADMIN'),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassengerScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(screenWidth * 0.5, 50),
              ),
              child: const Text('PASSANGER'),
            ),
          ],
        ),
      ),
    );
  }
}
