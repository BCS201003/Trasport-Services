import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Customize border color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '3.0',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF042763),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < 3 ? Icons.star : Icons.star_border,
                color: index < 3 ? const Color(0xFFFFC014) : const Color(0xFFC0C0C0), // Yellow for filled, gray for empty
                size: 11, // Width and height are set by size property
              );
            }),
          ),
          const Text(
            '2 Reviews',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 8,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
