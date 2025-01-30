import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/RulesAndConditions/term_and_conditions.dart';
import 'package:untitled/Advertiz/Widget/RulesAndConditions/rules_and_regulations.dart';

class FollowRules extends StatelessWidget {
  const FollowRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.black38,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Read Carefully Label
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 600),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double opacity, child) {
                      return Opacity(opacity: opacity, child: child);
                    },
                    child: const Text(
                      'Read Carefully',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // 100% Done Indicator
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double opacity, child) {
                      return Opacity(opacity: opacity, child: child);
                    },
                    child: const Text(
                      '100% Done ✅',
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Jost',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Animated Progress Bar
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Terms & Rules Widgets
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 800),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double opacity, child) {
                  return Opacity(opacity: opacity, child: child);
                },
                child: const TermAndConditionsWidget(),
              ),

              const SizedBox(height: 10),

              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 1000),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double opacity, child) {
                  return Opacity(opacity: opacity, child: child);
                },
                child: const RulesAndRegulationsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
