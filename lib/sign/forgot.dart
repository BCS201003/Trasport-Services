import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Other_widget/phone_field.dart';
import 'package:untitled/sign/create_password.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  ForgetScreenState createState() => ForgetScreenState();
}

class ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPhoneValid = true;
  bool _isPasswordValid = true;

  void _handlePasswordFieldChange(String value) {
    setState(() {
      _isPasswordValid = value.isNotEmpty;
    });
  }

  void _handlePhoneFieldChange(String value) {
    setState(() {
      _isPhoneValid = value.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 135,
            top: 60,
            child: Opacity(
              opacity: 1,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 272),
                    const Text(
                      'Forget Password',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 40 / 28,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Now Enter Phone Number',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 24 / 16,
                        color: Color(0xFF75788D),
                      ),
                    ),
                    const SizedBox(height: 60),
                    CustomPhoneField(
                      controller: _phoneController,
                      onPhoneFieldChange: (value) => _handlePhoneFieldChange(value as String),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: _isPhoneValid && _isPasswordValid
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreatePasswordScreen(),
                          ),
                        );
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: _isPasswordValid
                            ? Colors.black
                            : Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
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
                              height: 31.78 / 14,
                              decoration: TextDecoration.none,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 31.78 / 14,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 1,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Opacity(
                      opacity: 0.4,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
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
                          height: 31.78 / 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Facebook.png',
                            height: 24,
                          ),
                          label: const Text('Facebook'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5),
                            side: const BorderSide(color: Color(0xFFF5F5F5)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21.5),
                            ),
                            minimumSize: const Size(117, 29),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Google.png',
                            height: 24,
                          ),
                          label: const Text('Google'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5),
                            side: const BorderSide(color: Color(0xFFF5F5F5)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21.5),
                            ),
                            minimumSize: const Size(117, 29),
                          ),
                        ),
                      ],
                    ),
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