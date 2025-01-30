import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure this is added in pubspec.yaml
import 'package:untitled/NavigationSideBar/navigation_sidebar_admin.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'controller_a.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  AdminScreenState createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  final ControllerA _controllerA = ControllerA();
  String errorMessage = '';
  bool _isTermsAccepted = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController for button animation
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _login() {
    if (_controllerA.validateCredentials()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SideBarNavigationAdmin()),
      );
    } else {
      setState(() {
        errorMessage = 'Your Token ID and Passcode are incorrect';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final padding = screenWidth * 0.05;
    final spacing = screenHeight * 0.02;
    final fontSizeLabel = screenWidth * 0.04;
    final fontSizeInput = screenWidth * 0.04;
    final buttonWidth = screenWidth * 0.5;
    final buttonHeight = screenHeight * 0.07;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Admin Token"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Title
                  Text(
                    'Admin Login',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: spacing),

                  // Token ID TextField
                  TextField(
                    controller: _controllerA.tokenController,
                    decoration: InputDecoration(
                      labelText: 'Token ID',
                      hintText: 'Enter Token ID',
                      labelStyle: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: fontSizeLabel,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: fontSizeInput,
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.amber.shade700,
                          width: 2,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: fontSizeInput,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: spacing),

                  // Passcode TextField
                  TextField(
                    controller: _controllerA.passCodeController,
                    decoration: InputDecoration(
                      labelText: 'Passcode',
                      hintText: 'Enter Passcode',
                      labelStyle: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: fontSizeLabel,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: fontSizeInput,
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.amber.shade700,
                          width: 2,
                        ),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: fontSizeInput,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: spacing),

                  // Error message display
                  if (errorMessage.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red.shade700,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: Text(
                              errorMessage,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: screenWidth * 0.035,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (errorMessage.isNotEmpty)
                    SizedBox(height: spacing),

                  // Terms and Privacy Policy Checkbox
                  CheckboxListTile(
                    title: Text(
                      "I accept the terms and privacy policy",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.035,
                        color: Colors.black,
                      ),
                    ),
                    value: _isTermsAccepted,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isTermsAccepted = newValue ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.amber.shade700,
                    checkColor: Colors.white,
                  ),
                  SizedBox(height: spacing),

                  // Animated Login Button
                  AnimatedOpacity(
                    opacity: _animationController.value,
                    duration: const Duration(seconds: 2),
                    child: ElevatedButton(
                      onPressed: _isTermsAccepted ? _login : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        fixedSize: Size(buttonWidth, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FontAwesomeIcons.signInAlt,
                            color: Colors.amber.shade700,
                            size: screenWidth * 0.05,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'LOGIN ADMIN',
                            style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: screenWidth * 0.031,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
