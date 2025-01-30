import 'package:untitled/Dashboard/dashboard.dart';
import 'package:untitled/Advertiz/advertiz.dart';
import 'package:untitled/File/file.dart';
import 'package:untitled/Notification/notification_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Views/screens/create_profile/createprofilescreen.dart';
import 'package:untitled/Seats/view/seats.dart';
import 'package:untitled/Settings/views/settings.dart';
import 'package:untitled/Widgets/Other_widget/my_button_neg.dart';
import 'package:untitled/Widgets/Other_widget/drawer_neg.dart';
import 'package:untitled/Widgets/Other_widget/logout.dart';
import 'package:untitled/ProfileActivity/profile_activity.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SideBarNavigationPassenger extends StatefulWidget {
  const SideBarNavigationPassenger({super.key});
  @override
  SideBarNavigationPassengerState createState() =>
      SideBarNavigationPassengerState();
}

class SideBarNavigationPassengerState extends State<SideBarNavigationPassenger>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Offset _offset = const Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  late AnimationController _animationController;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Toggle menu state
  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());

    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.45;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey, Colors.white12],
            ),
          ),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(33.6844, 73.0479),
                  initialZoom: 12.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.maptiler.com/maps/basic-v2/{z}/{x}/{y}.png?key=9amPXYzYEX44i7Emfblv",
                    userAgentPackageName: 'com.service.transport_service_app',
                  ),
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: isMenuOpen ? 0 : -sidebarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sidebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sidebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }
                      if (details.localPosition.dx > sidebarSize - 20 &&
                          details.delta.distanceSquared > 2) {
                        toggleMenu();
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = const Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sidebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        SizedBox(
                          height: mediaQuery.height,
                          width: sidebarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: mediaQuery.height * 0.20,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/logo2.png",
                                          width: sidebarSize / 2),
                                      const Text(
                                        "version 1.1.0",
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(thickness: 1),
                              SizedBox(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: <Widget>[
                                    MyButton(
                                      text: "Profile",
                                      iconData: Icons.person,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileScreen()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "Buses",
                                      iconData: Icons.payment,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Dashboard()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "Feedback",
                                      iconData: Icons.payment,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BusSeatingScreen()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "Advertise",
                                      iconData: Icons.payment,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Advertiz()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    // MyButton(
                                    //   text: "Notifications",
                                    //   iconData: Icons.notifications,
                                    //   onPressed: () {},
                                    //   textSize: 16.0,
                                    //   height: 50.0,
                                    // ),
                                    MyButton(
                                      text: "Settings",
                                      iconData: Icons.settings,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SettingsScreen()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "My Profile",
                                      iconData: Icons.attach_file,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CreateProfileScreen()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "Upload File",
                                      iconData: Icons.lock,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UploadDocumentPage()),
                                        );
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                    MyButton(
                                      text: "Logout",
                                      iconData: Icons.lock,
                                      onPressed: () {
                                        showLogoutDialog(context);
                                      },
                                      textSize: 16.0,
                                      height: 50.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
