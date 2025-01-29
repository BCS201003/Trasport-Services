import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class MainController extends GetxController {
  final myCourseController = MyBusController();
  final profileController = ProfileController();

  String errorMessage = '';

  void updateErrorMessage() {
    if (myCourseController.errorMessage.isNotEmpty) {
      errorMessage = myCourseController.errorMessage;
    } else if (profileController.errorMessage.isNotEmpty) {
      errorMessage = profileController.errorMessage;
    } else {
      errorMessage = '';
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myCourseController.addListener(() {
        updateErrorMessage();
      });
      profileController.addListener(() {
        updateErrorMessage();
      });
    });
  }

  void clearAllData() {
    myCourseController.courses.clear();
    profileController.namesList.clear();
    updateErrorMessage();
  }
}
