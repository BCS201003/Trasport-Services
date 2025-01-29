import 'package:flutter/material.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/PointWidget1/client_message.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/PointWidget1/rating/rating.dart';

class Case1Widget extends StatelessWidget {
  const Case1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'What You Will Learn:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(
                Icons.ac_unit,
                size: 18,
                color: Color(0xFF45C881),
              ),
              SizedBox(width: 5),
              Text(
                'Eco-Friendly Transportation',
                textAlign: TextAlign.left, // Optional: Adjust alignment
                style: TextStyle(
                  fontFamily: 'Jost',
                  // Font family
                  fontSize: 9,
                  // Font size
                  fontWeight: FontWeight.w400,
                  // Font weight (400 = normal)
                  height: 12.33 / 9,
                  // Line height as a multiplier of font size
                  letterSpacing: -0.01,
                  // Adjust letter spacing
                  color: Color(0xFF75788D), // Text color
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "This app introduces you to a smarter way of managing university transportation, offering a\n"
                "complete guide to transforming the commuting experience.\n"
                " Learn how to track university buses in real-time, ensuring you always know their exact\n"
                " location and arrival times.\n"
                " Explore features like route planning that help you select the most efficient paths and\n"
                "  minimize delays.\n"
                " Master the convenience of booking seats instantly, customizing routes to suit your schedule,\n"
                " and making cashless payments for a hassle-free journey.\n"
                " Discover how the app leverages technology to enhance safety with live alerts, improve\n"
                " connectivity across campuses, and minimize waiting times.\n"
                " Whether you're a student or staff member, this app will teach you how to use innovative\n"
                " tools to make transportation stress-free, eco-friendly, and more reliable than ever before.\n",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 9,
              fontWeight: FontWeight.w400,
              height: 12.33 / 9,
              letterSpacing: -0.01,
              color: Color(0xFF75788D),
            ),
            softWrap: true,
            maxLines: null,
            overflow: TextOverflow
                .visible, // Allows text to overflow if required
          ),
          const SizedBox(height: 5),
          Container(
            width: 360, // Set a fixed width for the container (divider)
            height: 1, // Set a fixed height (this makes the divider visible)
            color: Colors.grey[300], // Divider color
          ),
          const SizedBox(height: 10),
          const RatingWidget(),
          const SizedBox(height: 10),
          const Message(),
        ],
      ),
    );
  }
}
