import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/HomeScreen/views/screens/get_in_touch.dart'; // Ensure this is added in pubspec.yaml
class GetInTouchButton extends StatefulWidget {
  const GetInTouchButton({super.key});

  @override
  _GetInTouchButtonState createState() => _GetInTouchButtonState();
}

class _GetInTouchButtonState extends State<GetInTouchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // Duration for the fade-in effect
      vsync: this,
    );

    // Define Fade In Animation
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to free resources
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GetInTouchScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Black background
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.15, // Responsive horizontal padding
              vertical: screenHeight * 0.02, // Responsive vertical padding
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            elevation: 5, // Button elevation
            shadowColor: Colors.black.withOpacity(0.3), // Shadow color
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Wrap content
            children: [
              // Optional: Add an icon for better UI
              Icon(
                FontAwesomeIcons.handshake, // Example icon
                color: Colors.amber.shade700, // Yellow accent
                size: screenWidth * 0.05, // Responsive icon size
              ),
              SizedBox(width: screenWidth * 0.02), // Spacing between icon and text
              const Text(
                'Get in Touch',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

