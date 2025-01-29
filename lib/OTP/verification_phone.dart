import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled/Role/role.dart';
import 'package:untitled/OTP/otp_verification.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  PhoneVerificationState createState() => PhoneVerificationState();
}

class PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _phoneController = TextEditingController();
  final bool _isButtonActive = true;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            Center(
              child: Image.asset(
                'assets/logo2.png',
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 40 / 28,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isButtonActive
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpVerification(),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonActive ? Colors.black : Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Send OTP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(
                    text: 'Remember Password? ',
                    style: const TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 31.78 / 14,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log In Now',
                        style: const TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 31.78 / 14,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
