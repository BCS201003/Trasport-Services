// lib/TimeTable/views/screen/admin_access_driver_token.dart

import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/TimeTable/controllers/admin_access_controller.dart';
import 'package:untitled/TimeTable/views/screen/adjust_timetable.dart';

class AdminAccessDriverTokenPage extends StatefulWidget {
  const AdminAccessDriverTokenPage({super.key});

  @override
  AdminAccessDriverTokenPageState createState() =>
      AdminAccessDriverTokenPageState();
}

class AdminAccessDriverTokenPageState extends State<AdminAccessDriverTokenPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tokenController = TextEditingController();
  bool _obscureToken = true;

  // Our token validation logic resides here
  final AdminAccessController _adminAccessController = AdminAccessController();

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  void _handlePassButton() async {
    if (_formKey.currentState!.validate()) {
      final token = _tokenController.text.trim();

      // Show a loading indicator (optional)
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      // Simulate a short delay to look like "network request"
      await Future.delayed(const Duration(seconds: 1));

      // Pop the loading indicator
      Navigator.of(context).pop();

      // Now validate the token
      if (_adminAccessController.isTokenValid(token)) {

        // If valid, navigate to AdjustTimetablePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdjustTimetablePage()),
        );
      } else {
        // Show error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Token. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.deepPurple;
    const Color accentColor = Colors.white;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Admin Access'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.admin_panel_settings,
                    size: 80.0,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Enter Driver Token',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Please Enter your driver access token to manage the timetables.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // TOKEN INPUT FIELD
                  TextFormField(
                    controller: _tokenController,
                    decoration: InputDecoration(
                      labelText: 'Driver Token',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureToken
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureToken = !_obscureToken;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureToken,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the Driver token';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),

                  // PASS BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: _handlePassButton,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'PASS',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
