// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:untitled/BusDashboard/Containers/forsearch_container.dart';
import 'package:untitled/BusDashboard/Containers/student_list_container.dart';
import 'package:untitled/BusDashboard/Containers/percentage_container.dart';
import 'package:untitled/BusDashboard/Containers/teacher_list_container.dart';
import 'package:untitled/Advertiz/advertiz.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Search',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Teacher Info
            Text(
              'Teacher and Students Info',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 24.48 / 24,
                textBaseline: TextBaseline.alphabetic,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.black,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 20),

            // Centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // For search
                  ForSearch(),
                  SizedBox(height: 20),

                  // Student List
                  StudentListContainer(),
                  SizedBox(height: 20),

                  // Teacher List
                  TeacherListContainer(),
                  SizedBox(height: 20),

                  // Summary
                  PercentageContainer(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
