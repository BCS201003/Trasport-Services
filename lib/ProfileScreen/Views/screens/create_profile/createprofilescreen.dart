import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Widget/address.dart';
import 'package:untitled/ProfileScreen/Widget/city.dart';
import 'package:untitled/ProfileScreen/Widget/country.dart';
import 'package:untitled/ProfileScreen/Widget/full_name.dart';
import 'package:untitled/ProfileScreen/Widget/gender.dart';
import 'package:untitled/ProfileScreen/Widget/school_code.dart';
import 'package:untitled/ProfileScreen/Widget/school_grade.dart';
import 'package:untitled/ProfileScreen/Widget/school_list.dart';
import 'package:untitled/ProfileScreen/Widget/school_type.dart';
import 'package:untitled/ProfileScreen/Widget/state.dart';
import 'package:untitled/Bus_info/Widgets/screen_loop2.dart';
import 'package:untitled/ProfileScreen/Widget/dateofbirth.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  CreateProfileScreenState createState() => CreateProfileScreenState();
}

class CreateProfileScreenState extends State<CreateProfileScreen> {
  final ProfileController controller = ProfileController(); // Initialize the controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.04;
    double verticalSpacing = screenHeight * 0.02;
    double avatarRadius = screenWidth * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Create PROFILE"),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                CircleAvatar(
                  radius: avatarRadius,
                  child: const Icon(Icons.camera_alt),
                ),
                SizedBox(height: verticalSpacing),
                FullNameField(controller: controller),
                SizedBox(height: verticalSpacing),
                GenderSelector(controller: controller),
                const DateOfBirth(),
                SchoolTypeSelector(controller: controller),
                SizedBox(height: verticalSpacing),
                SchoolList(controller: controller),
                SizedBox(height: verticalSpacing),
                SchoolCodeInput(controller: controller),
                SizedBox(height: verticalSpacing),
                SchoolGradeDropdown(controller: controller),
                SizedBox(height: verticalSpacing),
                CountryDropdown(controller: controller),
                SizedBox(height: verticalSpacing),
                StateDropdown(controller: controller),
                SizedBox(height: verticalSpacing),
                CityDropdown(controller: controller),
                SizedBox(height: verticalSpacing),
                AddressDropdown(controller: controller),
                SizedBox(height: verticalSpacing),
                AddStudentLoop2(profileController: controller),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}