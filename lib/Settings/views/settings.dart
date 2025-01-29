// lib/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:untitled/Settings/views/data_and_privacy/about_screen.dart';
import 'package:untitled/Settings/views/data_and_privacy/change_password_screen.dart';
import 'package:untitled/Settings/views/data_and_privacy/help_and_support_screen.dart';
import 'package:untitled/Settings/views/data_and_privacy/report_an_issue_screen.dart';
import 'package:untitled/Settings/views/data_and_privacy/ride_history_screen.dart';
import 'package:untitled/Settings/views/data_and_privacy/two_factor_authentication_screen.dart';
import 'widgets/custom_switch_tile.dart';
import 'widgets/custom_dropdown_tile.dart';
import 'widgets/section_title.dart';
import 'package:untitled/Settings/controllers/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController _controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SectionTitle(title: 'ESSENTIAL SETTINGS'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomSwitchTile(
                  title: 'Dark Theme',
                  subtitle: 'Toggle between Light and Dark theme',
                  value: _controller.isDarkTheme,
                  onChanged: (value) {
                    setState(() => _controller.setDarkTheme(value));
                  },
                  activeColor: Colors.blue,        // Thumb color when ON
                  activeTrackColor: Colors.blue[200], // Track color when ON
                ),
                CustomSwitchTile(
                  title: 'Notifications',
                  subtitle: 'Enable or disable push notifications',
                  value: _controller.notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _controller.setNotificationsEnabled(value));
                  },
                  activeColor: Colors.blue,        // Thumb color when ON
                  activeTrackColor: Colors.blue[200], // Track color when ON
                ),
                ListTile(
                  title: const Text('About'),
                  subtitle: const Text('App version, developer info, etc.'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SectionTitle(title: 'USER PREFERENCES'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomDropdownTile(
                  title: 'Language',
                  currentValue: _controller.language,
                  items: const ['English', 'Spanish', 'French', 'German'],
                  onChanged: (value) {
                    setState(() => _controller.setLanguage(value!));
                  },
                ),
                CustomDropdownTile(
                  title: 'Currency',
                  currentValue: _controller.currency,
                  items: const ['USD', 'EUR', 'GBP', 'JPY'],
                  onChanged: (value) {
                    setState(() => _controller.setCurrency(value!));
                  },
                ),
                CustomSwitchTile(
                  title: 'Location Services',
                  subtitle: 'Enable or disable GPS tracking',
                  value: _controller.locationEnabled,
                  onChanged: (value) {
                    setState(() => _controller.setLocationEnabled(value));
                  },
                  activeColor: Colors.blue,        // Thumb color when ON
                  activeTrackColor: Colors.blue[200], // Track color when ON
                ),
                CustomDropdownTile(
                  title: 'Default Payment',
                  currentValue: _controller.preferredPaymentMethod,
                  items: const ['Credit Card', 'Wallet', 'Cash'],
                  onChanged: (value) {
                    setState(() => _controller.setPreferredPaymentMethod(value!));
                  },
                ),
                CustomDropdownTile(
                  title: 'Preferred Vehicle',
                  currentValue: _controller.preferredVehicleType,
                  items: const ['Economy', 'Premium', 'Shared'],
                  onChanged: (value) {
                    setState(() => _controller.setPreferredVehicleType(value!));
                  },
                ),
                ListTile(
                  title: const Text('Ride/Service History'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RideHistoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SectionTitle(title: 'SECURITY & PRIVACY'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomSwitchTile(
                  title: 'Biometric Authentication',
                  subtitle: 'Enable Face ID or Fingerprint',
                  value: _controller.biometricEnabled,
                  onChanged: (value) {
                    setState(() => _controller.setBiometricEnabled(value));
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.blue[200],
                ),
                ListTile(
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Two-Factor Authentication (2FA)'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TwoFactorAuthScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SectionTitle(title: 'SUPPORT & ASSISTANCE'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HelpAndSupportScreen()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Report an Issue'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ReportIssueScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}