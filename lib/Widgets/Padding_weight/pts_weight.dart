import 'package:flutter/material.dart';

class PTSWidget extends StatefulWidget {
  const PTSWidget({super.key});

  @override
  PTSWidgetState createState() => PTSWidgetState();
}

class PTSWidgetState extends State<PTSWidget> {
  String _selectedRole = 'Parent';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Role',
            style: TextStyle(fontSize: 18),
          ),
          ListTile(
            title: const Text('Parent'),
            leading: Radio<String>(
              value: 'Parent',
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Student'),
            leading: Radio<String>(
              value: 'Student',
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Teacher'),
            leading: Radio<String>(
              value: 'Teacher',
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
