import 'package:flutter/material.dart';

class SelectClassContainer extends StatelessWidget {
  const SelectClassContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(
            'Select Class',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: Color(0xFF343A40),
          children: [
            ListTile(
              title: Text('Bacture Graduate'),
            ),
            ListTile(
              title: Text('Master Graduate'),
            ),
            ListTile(
              title: Text('Dr. Graduate'),
            ),
          ],
        ),
      ),
    );
  }
}
