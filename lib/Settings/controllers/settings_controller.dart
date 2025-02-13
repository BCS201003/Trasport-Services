// lib/controllers/settings_controller.dart
import 'package:flutter/foundation.dart'; // For ChangeNotifier if desired
import '../models/user_preferences_model.dart';

class SettingsController with ChangeNotifier {
  // The model that holds user preference data
  final UserPreferencesModel _userPreferencesModel = UserPreferencesModel();

  // Getters
  bool get isDarkTheme => _userPreferencesModel.isDarkTheme;
  bool get notificationsEnabled => _userPreferencesModel.notificationsEnabled;
  bool get locationEnabled => _userPreferencesModel.locationEnabled;
  bool get biometricEnabled => _userPreferencesModel.biometricEnabled;

  String get language => _userPreferencesModel.language;
  String get currency => _userPreferencesModel.currency;
  String get preferredPaymentMethod => _userPreferencesModel.preferredPaymentMethod;
  String get preferredVehicleType => _userPreferencesModel.preferredVehicleType;

  // Setters
  void setDarkTheme(bool value) {
    _userPreferencesModel.isDarkTheme = value;
    notifyListeners(); // Notifies views (if using Provider or similar)
  }

  void setNotificationsEnabled(bool value) {
    _userPreferencesModel.notificationsEnabled = value;
    notifyListeners();
  }

  void setLocationEnabled(bool value) {
    _userPreferencesModel.locationEnabled = value;
    notifyListeners();
  }

  void setBiometricEnabled(bool value) {
    _userPreferencesModel.biometricEnabled = value;
    notifyListeners();
  }

  void setLanguage(String newLanguage) {
    _userPreferencesModel.language = newLanguage;
    notifyListeners();
  }

  void setCurrency(String newCurrency) {
    _userPreferencesModel.currency = newCurrency;
    notifyListeners();
  }

  void setPreferredPaymentMethod(String paymentMethod) {
    _userPreferencesModel.preferredPaymentMethod = paymentMethod;
    notifyListeners();
  }

  void setPreferredVehicleType(String vehicleType) {
    _userPreferencesModel.preferredVehicleType = vehicleType;
    notifyListeners();
  }

  // Additional logic, e.g., resetting defaults
  void resetPreferences() {
    _userPreferencesModel.resetToDefaults();
    notifyListeners();
  }
}
