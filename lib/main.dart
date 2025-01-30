// get.dart
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/HomeScreen/Controller/home_controller.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
import 'package:untitled/NavigationSideBar/navigation_sidebar_driver.dart';
import 'package:untitled/NavigationSideBar/navigation_sidebar_passenger.dart';
import 'package:untitled/Notification/notification_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
import 'package:untitled/Seats/controller/seatcontroller.dart';
import 'package:untitled/HomeScreen/loading_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationController = Get.put(NotificationController());
  await notificationController.initializeNotifications();
  Get.put(ProfileController(),permanent: true);
  Get.put(MainController(),permanent: true);
  Get.put(MyBusController(),permanent: true);
  Get.put(SeatingController(),permanent: true);
  Get.put(MyBusController(),permanent: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeatingController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyBusesScreen(),
       home: SideBarNavigationDriver(),
      // home: FeedbackScreen(),
      // home: BusSeatingScreen(),
      // home: Dashboard(),
      // home: LoginDriverScreen(),
      // home: EnrollScreen(),
      // home: LoadingScreen(),
    );
  }
}