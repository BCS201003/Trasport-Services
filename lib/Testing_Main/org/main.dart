// get.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/HomeScreen/Controller/home_controller.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
import 'package:untitled/Notification/notification_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationController = Get.put(NotificationController());
  await notificationController.initializeNotifications();
  Get.put(ProfileController(),permanent: true);
  Get.put(MainController(),permanent: true);
  Get.put(MyBusController(),permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GetX Notifications Demo',
      debugShowCheckedModeBanner: false,
      //home: MyCoursesScreen(),
      //home: LoadingScreen(),
      //home: SubscriberInfoScreen(),
      //home: TeacherDashboard(),
      //home:Learning(),
      //home: QuizScreen(),
      //home: SubscriberInfoScreen(),
      //home: Testchild(),
    );
  }
}
