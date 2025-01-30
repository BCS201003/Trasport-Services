// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:untitled/HomeScreen/Controller/home_controller.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
import 'package:untitled/Notification/notification_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
import 'package:untitled/Seats/controller/seatcontroller.dart';
import 'package:untitled/HomeScreen/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Controllers
  final notificationController = Get.put(NotificationController());
  await notificationController.initializeNotifications();

  Get.put(ProfileController(), permanent: true);
  Get.put(MainController(), permanent: true);
  Get.put(MyBusController(), permanent: true);
  Get.put(SeatingController(), permanent: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeatingController()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cust University Bus App',

      // Define the global theme
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set Scaffold background to pure white
        primaryColor: Colors.black, // Primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber.shade700, // Accent color (1% other color)
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Jost',
            color: Colors.black,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Jost',
            color: Colors.black,
            fontSize: 14,
          ),
          // Define other text styles as needed
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Button background color
            foregroundColor: Colors.black, // Button text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Jost',
            color: Colors.black,
            fontSize: 16,
          ),
          hintStyle: TextStyle(
            fontFamily: 'Jost',
            color: Colors.grey[600],
            fontSize: 14,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.amber.shade700,
              width: 2,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(Colors.white),
          checkColor: WidgetStateProperty.all(Colors.white),
        ),
      ),

      home: const LoadingScreen(),

      // Define routes if necessary
      // routes: {
      //   '/admin': (context) => const AdminScreen(),
      //   '/driver': (context) => const DriverScreen(),
      //   '/passenger': (context) => const PassengerScreen(),
      // },
    );
  }
}
