// gender_dropdown.dart
import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class GenderSelector extends StatelessWidget {
  final ProfileController controller;

  const GenderSelector({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: controller.selectedGender,
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.changeGender(newValue);
            }
          },
          items: <String>['Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          isExpanded: true,
          underline: const SizedBox(),
        ),
      ],
    );
  }
}
