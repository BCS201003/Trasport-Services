import 'package:flutter/material.dart';
import 'package:untitled/Bus_info/Widgets/screen_loop.dart';
import 'package:untitled/Widgets/Other_widget/logout.dart';

class SubscriberInfoScreen extends StatelessWidget {
  const SubscriberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.power_settings_new_outlined),
                    color: Colors.grey,
                    onPressed: () {
                      showLogoutDialog(context);
                    },
                  ),
                ),
                Positioned(
                  top: -5,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Image.asset(
                    'assets/logo2.png',
                    height: 250,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 220),
                    Text(
                      "  Subscriber Info",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Jost',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Hello (Subscriber Name)",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Jost',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    AddStudentLoop(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
