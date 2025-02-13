import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/orc_widget/contactview_widget/PointWidget1/client_message.dart';
import 'package:untitled/Advertiz/Widget/orc_widget/contactview_widget/PointWidget1/rating/rating.dart';

class Case1Widget extends StatelessWidget {
  const Case1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.black26,
        color: Colors.white, // Base card background
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Section Title
                const Text(
                  'What You Will Learn:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),

                // Learning Point 1 (with a golden accent icon)
                Row(
                  children: [
                    Icon(
                      Icons.directions_bus,
                      size: 22,
                      color: Colors.amber.shade700, // Subtle golden yellow
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Eco-Friendly Transportation',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description with refined text styling
                const Text(
                  "This app introduces you to a smarter way of managing university transportation, "
                      "offering a complete guide to transforming the commuting experience.\n\n"
                      "✅ Track university buses in real-time to know their exact location.\n"
                      "✅ Plan efficient routes to minimize delays and travel smoothly.\n"
                      "✅ Book seats instantly, customize routes, and make cashless payments.\n"
                      "✅ Receive live alerts to enhance safety and stay connected.\n\n"
                      "Whether you're a student or staff member, this app will teach you how to use "
                      "innovative tools to make transportation stress-free, eco-friendly, and reliable.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 15),

                // Gradient Divider for a modern effect
                Container(
                  width: 360,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.amber.shade700, // Subtle golden highlight
                        Colors.black,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Rating Section
                const RatingWidget(),
                const SizedBox(height: 10),

                // Message Section
                const Message(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
