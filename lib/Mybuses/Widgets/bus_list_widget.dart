import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Mybuses/Controller/mybus_controller.dart';
class CourseListWidget extends StatelessWidget {
  const CourseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBusController>(
      builder: (controller) {
        return Column(
          children: List.generate(
            controller.courses.length,
                (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFEFEFEF)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Course ${index + 1}: ${controller.courses[index]}',
                        style: const TextStyle(
                          color: Color(0xFF2A4B6B),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.removeCourse(index);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
