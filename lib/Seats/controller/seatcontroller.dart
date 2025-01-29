import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeatingController extends ChangeNotifier {
  String selectedGender = "Ladies";
  List<List<Map<String, dynamic>>> seatStatus = List.generate(
    5,
        (_) => List.generate(
        4, (_) => {"selected": false, "color": Colors.grey.shade300, "gender": "", "locked": false}),
  );

  Future<void> loadSeatData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('seatStatus');
    if (savedData != null) {
      List<dynamic> jsonData = json.decode(savedData);
      seatStatus = jsonData
          .map((row) => (row as List).map((seat) => Map<String, dynamic>.from(seat)).toList())
          .toList();
      notifyListeners();
    }
  }

  Future<void> saveSeatData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(seatStatus);
    await prefs.setString('seatStatus', encodedData);
  }

  void lockSeats() {
    for (var row in seatStatus) {
      for (var seat in row) {
        if (seat['selected']) {
          seat['locked'] = true;
        }
      }
    }
    notifyListeners();
  }

  void changeGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void toggleSeat(int row, int col) {
    if (seatStatus[row][col]['locked']) {
      return;
    }

    if ((seatStatus[row][col]['gender'] == "Ladies" && selectedGender == "Gents") ||
        (seatStatus[row][col]['gender'] == "Gents" && selectedGender == "Ladies")) {
      return;
    }

    if (seatStatus[row][col]['selected']) {
      seatStatus[row][col]['selected'] = false;
      seatStatus[row][col]['color'] = Colors.grey.shade300;
      seatStatus[row][col]['gender'] = "";
    } else {
      seatStatus[row][col]['selected'] = true;
      seatStatus[row][col]['color'] = selectedGender == "Ladies" ? Colors.pink : Colors.blue;
      seatStatus[row][col]['gender'] = selectedGender;
    }
    notifyListeners();
  }
}