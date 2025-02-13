// lib/TimeTable/controllers/admin_access_controller.dart
class AdminAccessController {
  final String validToken = '123';

  bool isTokenValid(String token) {
    return token == validToken;
  }
}
