// lib/TimeTable/controllers/schedule_shared_prefs_controller.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/TimeTable/models/schedule_model.dart';

class ScheduleSharedPrefsController {
  static const String _kSchedulesKey = 'schedules_key';

  List<Schedule> _schedules = [];
  List<Schedule> get schedules => _schedules;

  /// Call this to load schedules from SharedPreferences when the app/page starts
  Future<void> loadSchedules() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_kSchedulesKey);
    if (jsonString != null) {
      final List<dynamic> decodedList = jsonDecode(jsonString);
      _schedules = decodedList
          .map((item) => Schedule.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      _schedules = [];
    }
  }

  /// Save the current list of schedules to SharedPreferences
  Future<void> saveSchedules() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
    _schedules.map((schedule) => schedule.toJson()).toList();

    final jsonString = jsonEncode(jsonList);
    await prefs.setString(_kSchedulesKey, jsonString);
  }

  /// Add a new schedule
  Future<void> addSchedule(Schedule schedule) async {
    _schedules.add(schedule);
    await saveSchedules(); // persist changes
  }

  /// Update an existing schedule
  Future<void> updateSchedule(Schedule updatedSchedule) async {
    final index = _schedules.indexWhere((s) => s.id == updatedSchedule.id);
    if (index != -1) {
      _schedules[index] = updatedSchedule;
      await saveSchedules();
    }
  }

  /// Delete a schedule by ID
  Future<void> deleteSchedule(String id) async {
    _schedules.removeWhere((s) => s.id == id);
    await saveSchedules();
  }

  /// Simple utility to generate unique ID
  String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
