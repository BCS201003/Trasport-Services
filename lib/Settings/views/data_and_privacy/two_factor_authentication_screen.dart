// lib/views/settings/two_factor_auth_screen.dart
import 'package:flutter/material.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  const TwoFactorAuthScreen({Key? key}) : super(key: key);

  @override
  State<TwoFactorAuthScreen> createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  bool is2FAEnabled = false;

  @override
  Widget build(BuildContext context) {
    // In a real scenario, get the initial value from the controller or server
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Factor Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable 2FA'),
              value: is2FAEnabled,
              onChanged: (val) {
                setState(() {
                  is2FAEnabled = val;
                  // TODO: Pass to controller => model => server
                });
              },
            ),
            const SizedBox(height: 20),
            if (is2FAEnabled) ...[
              const Text('2FA is enabled. Please follow steps to verify your device.'),
              // Possibly show QR code or verification instructions
            ]
          ],
        ),
      ),
    );
  }
}
