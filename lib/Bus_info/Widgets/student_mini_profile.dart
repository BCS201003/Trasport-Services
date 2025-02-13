import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class StudentMiniProfile extends StatelessWidget {
  const StudentMiniProfile({super.key, required this.fullName, required this.grades});

  final String fullName;
  final String grades;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenWidth * 0.04;
    final iconSize = screenWidth * 0.18;
    final textFontSize = screenWidth * 0.045;

    final profileController = Get.find<ProfileController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: screenWidth * 0.85,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon size adjusted based on screen width
            Icon(
              Icons.account_circle,
              size: iconSize,
              color: const Color(0xFF2A4B6B),
            ),
            SizedBox(width: screenWidth * 0.03), // Adjusted spacing
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fullName.isEmpty ? 'Name not available' : fullName,
                      style: TextStyle(
                        color: const Color(0xFF2A4B6B),
                        fontFamily: 'Jost',
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: screenWidth * 0.05,
                      endIndent: screenWidth * 0.05,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      profileController.selectedStudentGrade.isEmpty
                          ? 'Grade not available'
                          : grades,
                      style: TextStyle(
                        color: const Color(0xFF2A4B6B),
                        fontFamily: 'Jost',
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
