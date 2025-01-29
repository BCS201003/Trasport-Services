import 'package:flutter/material.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/PointWidget1/rating/ratingbox.dart';
import 'package:untitled/Learning/Widget/orc_widget/contactview_widget/PointWidget1/rating/ratingdistribution.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBox(),
        SizedBox(width: 10),
        RatingDistribution(
          ratingPercentages: {5: 50, 4: 23, 3: 40, 2: 20, 1: 50},
          ratingCounts: {5: 120, 4: 132, 3: 311, 2: 210, 1: 11},
        ),
      ],
    );
  }
}
