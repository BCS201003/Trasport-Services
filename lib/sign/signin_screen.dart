import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Other_widget/phone_field.dart';
import 'package:untitled/Widgets/Textfield_widget/password_field.dart';
import 'package:untitled/sign/create_password.dart';
import 'package:untitled/OTP/verification_phone.dart';
import 'package:untitled/sign/forgot.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  SigninScreenState createState() => SigninScreenState();
}

class SigninScreenState extends State<SigninScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPhoneValid = false;
  bool _isPasswordValid = false;

  void _handlePasswordFieldChange(String value) {
    setState(() {
      _isPasswordValid = value.isNotEmpty;
    });
  }
  void _handlePhoneFieldChange(bool isValid) {
    setState(() {
      _isPhoneValid = isValid;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Define the accent color
  final Color _accentColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Stack(
        children: [
          // Positioned logo with subtle opacity
          Positioned(
            left: 135,
            top: 60,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/logo2.png',
                width: 123,
                height: 167,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 272),
                    const Text(
                      'SignIn',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'It is quick and easy to SignIn. Enter your Phone Number and Password below.',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomPhoneField(
                      controller: _phoneController,
                      onPhoneFieldChange: _handlePhoneFieldChange, // Ensure this matches
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      controller: _passwordController,
                      onChanged: _handlePasswordFieldChange,
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      controller: _passwordController,
                      onChanged: _handlePasswordFieldChange,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isPhoneValid && _isPasswordValid
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneVerification(),
                          ),
                        );
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isPhoneValid && _isPasswordValid
                            ? _accentColor
                            : Colors.grey, // Use accent color when enabled
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: _isPhoneValid && _isPasswordValid ? 5 : 0,
                      ),
                      child: const Text(
                        'SignIn',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreatePasswordScreen(),
                            ),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Opacity(
                      opacity: 0.4,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'or Log In with',
                        style: TextStyle(
                          color: Color(0x99000000),
                          fontFamily: 'Jost',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Facebook.png',
                            height: 24,
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Updated
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(140, 45),
                            elevation: 2,
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Google.png',
                            height: 24,
                          ),
                          label: const Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Updated
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(140, 45),
                            elevation: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30), // Extra space at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

