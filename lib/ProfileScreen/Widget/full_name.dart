import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class FullNameField extends StatelessWidget {
  final ProfileController controller;

  const FullNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Full Name',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 4),
            Text(
              '*',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
          // Listen to the error message from the controller
    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.nameController,
                onChanged: (value) {
                  controller.changeName(value); // Update controller's name
                  controller.validateFullName(value); // Validate name
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  hintText: 'Enter full name',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: controller.errorMessage.isNotEmpty
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    controller.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
        ),
      ],
    );
  }
}
