import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Textfield_widget/password_confirm_field.dart';
import 'package:untitled/Widgets/Textfield_widget/password_field.dart';
import 'package:untitled/sign/login_screen.dart';

void _navigateToSubscriberInfoScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});
  
  @override
  CreatePasswordScreenState createState() => CreatePasswordScreenState();
}

class CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  bool _isPasswordValid = true;
  bool _isPasswordMatch = true;

  void _handlePasswordFieldChange(String value) {
    setState(() {
      _isPasswordValid = value.isNotEmpty;
      _isPasswordMatch = _passwordController.text == _passwordConfirmController.text;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset('assets/logo2.png')),
                const SizedBox(height: 20),
                const Text(
                  'Enter Password',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Reset password',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                PasswordField(
                  controller: _passwordController,
                  onChanged: _handlePasswordFieldChange,
                ),
                const SizedBox(height: 20),
                PasswordConfirmField(
                  controller: _passwordConfirmController,
                  onChanged: _handlePasswordFieldChange,
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _isPasswordMatch && _isPasswordValid
                        ? () => _navigateToSubscriberInfoScreen(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isPasswordMatch && _isPasswordValid
                          ? Colors.black
                          : Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}