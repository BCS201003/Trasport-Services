//this is message widget
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Muhammad Saad Hussain',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '3 Weeks ago',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          'It was very helpful to learn lessons.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    );
   }
  }