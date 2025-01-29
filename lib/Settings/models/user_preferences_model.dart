// lib/models/user_preferences_model.dart
class UserPreferencesModel {
  bool isDarkTheme;
  bool notificationsEnabled;
  bool locationEnabled;
  bool biometricEnabled;

  String language;
  String currency;
  String preferredPaymentMethod;
  String preferredVehicleType;

  UserPreferencesModel({
    this.isDarkTheme = false,
    this.notificationsEnabled = true,
    this.locationEnabled = true,
    this.biometricEnabled = false,
    this.language = 'English',
    this.currency = 'USD',
    this.preferredPaymentMethod = 'Credit Card',
    this.preferredVehicleType = 'Economy',
  });

  // Example method to reset defaults
  void resetToDefaults() {
    isDarkTheme = false;
    notificationsEnabled = true;
    locationEnabled = true;
    biometricEnabled = false;
    language = 'English';
    currency = 'USD';
    preferredPaymentMethod = 'Credit Card';
    preferredVehicleType = 'Economy';
  }
}
