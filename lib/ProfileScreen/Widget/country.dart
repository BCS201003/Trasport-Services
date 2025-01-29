import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
import 'package:untitled/ProfileScreen/Models/profilefield_model.dart'; // Import the model

class CountryDropdown extends StatelessWidget {
  final ProfileController controller;

  const CountryDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Country',
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
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: controller.selectedCountry,
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.changeCountry(newValue); // Update controller's state
                // Update the ProfileFieldModel when country changes
                final profileModel = ProfileFieldModel(
                  fullName: controller.nameController.text,
                  dateOfBirth: controller.birthController.text,
                  country: controller.selectedCountry,
                  city: controller.selectedCity,
                  address: controller.addressController.text,
                  gender: controller.selectedGender,
                  schoolCode: controller.codeController.text,
                  studentGrade: controller.selectedStudentGrade,
                  selectedSchoolList: controller.selectedSchoolList,
                  schoolType: controller.selectedSchoolType,
                  state: controller.selectedState,
                );

                controller.saveProfile(profileModel);
                controller.update();
              }
            },
            items: <String>['Pakistan', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
