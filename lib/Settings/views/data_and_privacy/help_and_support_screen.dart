// lib/views/settings/help_and_support_screen.dart
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Possibly a list of FAQs or contact info
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: const Center(
        child: Text('FAQs, contact info, troubleshooting steps here.'),
      ),
    );
  }
}
