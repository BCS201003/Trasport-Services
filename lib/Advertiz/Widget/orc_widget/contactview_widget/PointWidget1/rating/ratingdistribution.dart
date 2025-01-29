import 'package:flutter/material.dart';

class RatingDistribution extends StatelessWidget {
  final Map<int, double> ratingPercentages;
  final Map<int, int> ratingCounts;

  const RatingDistribution({
    super.key,
    required this.ratingPercentages,
    required this.ratingCounts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(5, (index) {
          int rating = 5 - index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$rating',
                  style: const TextStyle(
                    color: Color(0xFF2A4B6B), // Set the text color
                    fontSize: 14, // Example font size
                    fontWeight: FontWeight.w600, // Example font weight
                  ),
                ),
                const SizedBox(height: 8, width: 8),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      Icons.star,
                      color: starIndex < rating
                          ? const Color(0xFFFFC014)
                          : const Color(0xFFC0C0C0),
                      size: 11, // Set star size
                    );
                  }),
                ),
                const SizedBox(height: 8, width: 8),
                SizedBox(
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: ratingPercentages[rating]! / 100,
                      backgroundColor: Colors.grey[300],
                      color: const Color(0xFF2A4B6B),
                    ),
                  ),
                ),
                const SizedBox(height: 8, width: 8),
                Text(
                  '${ratingPercentages[rating]!.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF75788D),
                  ),
                ),
                const SizedBox(height: 8, width: 8),
                Text(
                  '${ratingCounts[rating]}',
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF75788D),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}