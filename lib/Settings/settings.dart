import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Example states for toggles / selections
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
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // ESSENTIAL SETTINGS
          _buildSectionTitle(context, 'ESSENTIAL SETTINGS'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                _buildSwitchListTile(
                  context,
                  title: 'Dark Theme',
                  subtitle: 'Toggle between Light and Dark theme',
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() => isDarkTheme = value);
                    // TODO: Hook to your actual theme logic
                  },
                ),
                _buildSwitchListTile(
                  context,
                  title: 'Notifications',
                  subtitle: 'Enable or disable push notifications',
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() => notificationsEnabled = value);
                    // TODO: Handle notification permission / logic
                  },
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
          _buildSectionTitle(context, 'USER PREFERENCES'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                _buildDropdownTile(
                  context,
                  title: 'Language',
                  currentValue: selectedLanguage,
                  items: const ['English', 'Spanish', 'French', 'German'],
                  onChanged: (value) {
                    setState(() => selectedLanguage = value!);
                    // TODO: Handle language change in your app
                  },
                ),
                _buildDropdownTile(
                  context,
                  title: 'Currency',
                  currentValue: selectedCurrency,
                  items: const ['USD', 'EUR', 'GBP', 'JPY'],
                  onChanged: (value) {
                    setState(() => selectedCurrency = value!);
                    // TODO: Handle currency change
                  },
                ),
                _buildSwitchListTile(
                  context,
                  title: 'Location Services',
                  subtitle: 'Enable or disable GPS tracking',
                  value: locationEnabled,
                  onChanged: (value) {
                    setState(() => locationEnabled = value);
                    // TODO: Request or revoke location permissions
                  },
                ),
                _buildDropdownTile(
                  context,
                  title: 'Default Payment',
                  currentValue: preferredPayment,
                  items: const ['Credit Card', 'Wallet', 'Cash'],
                  onChanged: (value) {
                    setState(() => preferredPayment = value!);
                    // TODO: Save user’s preferred payment method
                  },
                ),
                _buildDropdownTile(
                  context,
                  title: 'Preferred Vehicle',
                  currentValue: preferredVehicle,
                  items: const ['Economy', 'Premium', 'Shared'],
                  onChanged: (value) {
                    setState(() => preferredVehicle = value!);
                    // TODO: Save user’s preferred vehicle type
                  },
                ),
                ListTile(
                  title: const Text('Ride/Service History'),
                  subtitle: const Text('View or manage your past trips & bookings'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to ride/service history screen
                  },
                ),
              ],
            ),
          ),

          // SECURITY & PRIVACY
          _buildSectionTitle(context, 'SECURITY & PRIVACY'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                _buildSwitchListTile(
                  context,
                  title: 'Biometric Authentication',
                  subtitle: 'Enable Face ID or Fingerprint',
                  value: biometricEnabled,
                  onChanged: (value) {
                    setState(() => biometricEnabled = value);
                    // TODO: Integrate local_auth or relevant library
                  },
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
                    // TODO: Navigate to 2FA settings
                  },
                ),
                ListTile(
                  title: const Text('Data & Privacy Settings'),
                  subtitle: const Text('Manage permissions and data collection'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to data & privacy settings
                  },
                ),
              ],
            ),
          ),

          // SUPPORT & ASSISTANCE
          _buildSectionTitle(context, 'SUPPORT & ASSISTANCE'),
          Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Help & Support'),
                  subtitle: const Text('FAQs, contact support, troubleshooting'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to help & support page
                  },
                ),
                ListTile(
                  title: const Text('Report an Issue'),
                  subtitle: const Text('Report bugs or service problems'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Navigate to issue reporting page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper widget for section title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  /// Helper for a SwitchListTile with consistent style
  Widget _buildSwitchListTile(
      BuildContext context, {
        required String title,
        required String subtitle,
        required bool value,
        required ValueChanged<bool> onChanged,
      }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      secondary: Icon(value ? Icons.toggle_on : Icons.toggle_off, color: Theme.of(context).primaryColor),
    );
  }

  /// Helper for a Dropdown selection
  Widget _buildDropdownTile(
      BuildContext context, {
        required String title,
        required String currentValue,
        required List<String> items,
        required ValueChanged<String?> onChanged,
      }) {
    return ListTile(
      title: Text(title),
      trailing: DropdownButton<String>(
        value: currentValue,
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
        underline: const SizedBox(), // remove the default underline
      ),
    );
  }
}
