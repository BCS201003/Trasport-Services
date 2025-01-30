import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/HomeScreen/views/screens/get_in_touch.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart'; // Import FontAwesome

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define Fade In Animation
    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Define Slide Animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Start the animations
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Helper method to build a service item
  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Card(
          elevation: 6,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          shadowColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // Enhanced Icon with Animation
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.black26,
                  ),
                ),
                const SizedBox(width: 25),
                // Service Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Main Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Transport Service App',),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Animated Header Section
            FadeTransition(
              opacity: _fadeInAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 16.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffe0f7fa), Colors.black],
                    ),
                  ),
                  child: Column(
                    children: [
                      // Animated Logo
                      AnimatedScale(
                        scale: _animationController.value,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        child: const Icon(
                          Icons.directions_bus,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Welcome Text with Shadow
                      const Text(
                        'Welcome to Transport Service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Services Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildServiceItem(
                    icon: Icons.directions_bus,
                    title: 'Bus Services',
                    description:
                    'Comfortable and reliable bus rides across the city and beyond.',
                  ),
                  const SizedBox(height: 20),
                  // Add more services here if needed
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Contact Section with Animated Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jost',
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Phone: +92 312 888 9408',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Email: BCS201003@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Animated Elevated Button
                      Center(
                        child: AnimatedOpacity(
                          opacity: _animationController.value,
                          duration: const Duration(seconds: 2),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GetInTouchScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            child: const Text(
                              'Get in Touch',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Footer Section with Social Media Icons
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.black12,
              child: Column(
                children: [
                  const Text(
                    '© 2025 Transport Service App. All rights reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Social Media Icons with FontAwesome
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.facebookF),
                        color: Colors.blueAccent,
                        iconSize: 30,
                        onPressed: () {
                          // Handle Facebook button press
                        },
                        tooltip: 'Facebook',
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.xTwitter),
                        color: Colors.black,
                        iconSize: 30,
                        onPressed: () {
                          // Handle Twitter button press
                        },
                        tooltip: 'Twitter',
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.instagram),
                        color: Colors.pink,
                        iconSize: 30,
                        onPressed: () {
                          // Handle Instagram button press
                        },
                        tooltip: 'Instagram',
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                        color: Colors.blue.shade700,
                        iconSize: 30,
                        onPressed: () {
                          // Handle LinkedIn button press
                        },
                        tooltip: 'LinkedIn',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button with Tooltip and Animation
      floatingActionButton: ScaleTransition(
        scale: _fadeInAnimation,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          tooltip: 'Navigate',
          child: const Icon(
            Icons.navigation,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
