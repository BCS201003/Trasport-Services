import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Views/screens/create_profile/createprofilescreen.dart';
import 'package:untitled/Bus_info/Widgets/student_mini_profile.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class AddStudentLoop extends StatefulWidget {
  const AddStudentLoop({super.key});

  @override
  State<AddStudentLoop> createState() => _AddStudentLoopState();
}

class _AddStudentLoopState extends State<AddStudentLoop> {
  final ProfileController controller = ProfileController(); // Initialize controller

  @override
  void initState() {
    super.initState();
    controller.updateSaveButtonState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double verticalPadding = mediaQuery.size.height * 0.02; // 2% of screen height
    final double horizontalPadding = mediaQuery.size.width * 0.04; // 4% of screen width

    return SingleChildScrollView( // Added SingleChildScrollView to prevent overflow issues
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: horizontalPadding),
            child: controller.listSubscriberData.isEmpty
                ? const Center(
              child: Text(
                'No data found',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.separated(
              shrinkWrap: true, // Ensures ListView does not take up more space than necessary
              itemCount: controller.listSubscriberData.length,
              separatorBuilder: (context, index) => SizedBox(height: verticalPadding),
              itemBuilder: (context, index) {
                final data = controller.listSubscriberData[index];
                return StudentMiniProfile(
                  grades: data['grades']!,
                  fullName: data['name']!,
                );
              },
            ),
          ),

        if (controller.errorMessage.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: Text(
                controller.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

          // Add Student Button
          if (controller.listSubscriberData.length < 5)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: SizedBox(
                width: double.infinity,
                height: mediaQuery.size.height * 0.06, // 6% of screen height for button height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(vertical: verticalPadding * 0.6),
                    textStyle: const TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.handleAddStudentButton();
                    if (controller.errorMessage.isEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateProfileScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text("+  Add Student"),
                ),
              ),
            ),

          // No Add Button Placeholder
          if (controller.listSubscriberData.length >= 5)
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: const Center(
                child: Text(
                  'Maximum of 5 students added.',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
