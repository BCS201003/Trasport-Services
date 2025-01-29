import 'package:flutter/material.dart';
import 'package:untitled/Advertiz/Widget/RulesAndConditions/term_and_conditions.dart';
import 'package:untitled/Advertiz/Widget/RulesAndConditions/rules_and_regulations.dart';

class FollowRules extends StatelessWidget {

  const FollowRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.withOpacity(0.5)),
    borderRadius: BorderRadius.circular(15),
    ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Read Carefully',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Jost',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 32.0 / 14.0,
                      ),
                    ),
                  ),

                  const Text(
                    '100% Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Jost',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: 1.0,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(height: 16),
              const TermAndConditionsWidget(),
              const RulesAndRegulationsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

