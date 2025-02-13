// lib/Mybuses/Controller/mybus_controller.dart
import 'package:get/get.dart';
import 'package:untitled/Mybuses/Models/mybusmodel.dart';

class MyBusController extends GetxController {
  var buses = <Bus>[].obs;
  final List<String> courses = [];
  final String errorMessage = '';
  var isExpanded = false;

  // Method to add a bus
  void addBus({
    required String type,
    required String name,
    required String source,
    required String destination,
  }) {
    buses.add(Bus(
      type: type,
      name: name,
      source: source,
      destination: destination,
    ));
  }


  // Method to remove a bus
  void removeBus(Bus bus) {
    buses.remove(bus);
  }

  bool toggleExpand() {
    isExpanded = !isExpanded;
    return isExpanded;
  }

  void removeCourse(int index) {
    if (index >= 0 && index < courses.length) {
      courses.removeAt(index);
    }
  }

  void addCourse(String courseName) {
    if (courses.length < 10) {
      courses.add(courseName);
    } else {}
  }
}
