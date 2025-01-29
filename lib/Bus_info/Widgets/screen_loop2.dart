import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class AddStudentLoop2 extends StatefulWidget {
  final ProfileController profileController;
  const AddStudentLoop2({super.key, required this.profileController});

  @override
  State<AddStudentLoop2> createState() => AddStudentLoop2State();
}

class AddStudentLoop2State extends State<AddStudentLoop2> {
  @override
  Widget build(BuildContext context) {
    widget.profileController.updateSaveButtonState();

    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.profileController.isSaveButtonEnabled
              ? () {
            widget.profileController
                .increment(widget.profileController.nameController.text);
            Navigator.pop(context);
          }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.profileController.isSaveButtonEnabled
                ? Colors.black
                : Colors.grey,
            minimumSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: const Text(
            'Save Profile Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}