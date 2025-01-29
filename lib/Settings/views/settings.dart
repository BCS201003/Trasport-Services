import 'package:flutter/material.dart';
import 'package:untitled/Settings/views/widgets/custom_dropdown_tile.dart';
import 'package:untitled/Settings/views/widgets/custom_switch_tile.dart';
import 'package:untitled/Settings/views/widgets/section_title.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Example states for toggles and selections
  bool isDarkTheme = false;
  bool notificationsEnabled = true;
  bool locationEnabled = true;
  bool biometricEnabled = false;

  String selectedLanguage = 'English';
  String selectedCurrency = 'USD';
  String preferredPayment = 'Credit Card';
  String preferredVehicle = 'Economy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: ListView(
        children: [
          // ESSENTIAL SETTINGS
          const SectionTitle(title: 'ESSENTIAL SETTINGS'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomSwitchTile(
                  title: 'Dark Theme',
                  subtitle: 'Toggle between Light and Dark theme',
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() => isDarkTheme = value);
                    // TODO: Add your theme logic (e.g. Provider, Bloc, or setState)
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                ),
                CustomSwitchTile(
                  title: 'Notifications',
                  subtitle: 'Enable or disable push notifications',
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() => notificationsEnabled = value);
                    // TODO: Notification permission logic
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                ),
                ListTile(
                  title: const Text('About'),
                  subtitle: const Text('App version, developer info, privacy policy, etc.'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to About page
                  },
                ),
              ],
            ),
          ),

          // USER PREFERENCES
          const SectionTitle(title: 'USER PREFERENCES'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomDropdownTile(
                  title: 'Language',
                  currentValue: selectedLanguage,
                  items: const ['English', 'Spanish', 'French', 'German'],
                  onChanged: (value) {
                    setState(() => selectedLanguage = value!);
                    // TODO: Implement i18n or localization here
                  },
                ),
                CustomDropdownTile(
                  title: 'Currency',
                  currentValue: selectedCurrency,
                  items: const ['USD', 'EUR', 'GBP', 'JPY'],
                  onChanged: (value) {
                    setState(() => selectedCurrency = value!);
                  },
                ),
                CustomSwitchTile(
                  title: 'Location Services',
                  subtitle: 'Enable or disable GPS tracking',
                  value: locationEnabled,
                  onChanged: (value) {
                    setState(() => locationEnabled = value);
                    // TODO: Request or revoke location permissions
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                ),
                CustomDropdownTile(
                  title: 'Default Payment',
                  currentValue: preferredPayment,
                  items: const ['Credit Card', 'Wallet', 'Cash'],
                  onChanged: (value) {
                    setState(() => preferredPayment = value!);
                  },
                ),
                CustomDropdownTile(
                  title: 'Preferred Vehicle',
                  currentValue: preferredVehicle,
                  items: const ['Economy', 'Premium', 'Shared'],
                  onChanged: (value) {
                    setState(() => preferredVehicle = value!);
                  },
                ),
                ListTile(
                  title: const Text('Ride/Service History'),
                  subtitle: const Text('View or manage your past trips & bookings'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to history screen
                  },
                ),
              ],
            ),
          ),

          // SECURITY & PRIVACY
          const SectionTitle(title: 'SECURITY & PRIVACY'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomSwitchTile(
                  title: 'Biometric Authentication',
                  subtitle: 'Enable Face ID or Fingerprint',
                  value: biometricEnabled,
                  onChanged: (value) {
                    setState(() => biometricEnabled = value);
                    // TODO: Integrate local_auth or relevant library
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                ),
                ListTile(
                  title: const Text('Change Password'),
                  subtitle: const Text('Update your login credentials'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to password change screen
                  },
                ),
                ListTile(
                  title: const Text('Two-Factor Authentication (2FA)'),
                  subtitle: const Text('Enhance account security'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: 2FA setup
                  },
                ),
                ListTile(
                  title: const Text('Data & Privacy Settings'),
                  subtitle: const Text('Manage permissions and data collection'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to data & privacy
                  },
                ),
              ],
            ),
          ),

          // SUPPORT & ASSISTANCE
          const SectionTitle(title: 'SUPPORT & ASSISTANCE'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Help & Support'),
                  subtitle: const Text('FAQs, contact support, troubleshooting'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Help & Support
                  },
                ),
                ListTile(
                  title: const Text('Report an Issue'),
                  subtitle: const Text('Report bugs or service problems'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Issue reporting
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
