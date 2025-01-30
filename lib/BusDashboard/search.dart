import 'package:flutter/material.dart';
import 'package:untitled/BusDashboard/Containers/forsearch_container.dart';
import 'package:untitled/BusDashboard/Containers/student_list_container.dart';
import 'package:untitled/BusDashboard/Containers/percentage_container.dart';
import 'package:untitled/BusDashboard/Containers/teacher_list_container.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Slight off-white for softness
      appBar: CustomAppBar(
        title: 'Search',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Title Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Teacher and Students Info',
                style: TextStyle(
                  fontFamily: 'Poppins', // Elegant font
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5, // Subtle spacing
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Content Cards
            _buildCard(child: const ForSearch()),
            _buildCard(child: const StudentListContainer()),
            _buildCard(child: const TeacherListContainer()),
            _buildCard(child: const PercentageContainer()),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Card Wrapper for Better UI
  Widget _buildCard({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4, // Adds a floating effect
        shadowColor: Colors.black.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
