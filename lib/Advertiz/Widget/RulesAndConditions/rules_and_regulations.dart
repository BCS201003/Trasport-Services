import 'package:flutter/material.dart';

class RulesAndRegulationsWidget extends StatefulWidget {
  const RulesAndRegulationsWidget({super.key});

  @override
  RulesAndRegulationsWidgetState createState() => RulesAndRegulationsWidgetState();
}

class RulesAndRegulationsWidgetState extends State<RulesAndRegulationsWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: _isExpanded ? Colors.grey.withOpacity(0.5) : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          color: const Color(0xFF343A40),
        ),
        title: const Text(
          'Rules And Regulations',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Jost',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '9 Points ',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Jost',
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.rule,
              color: Colors.blueAccent,
              size: 16,
            ),
          ],
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() => _isExpanded = expanded);
        },
        children: const [
          Divider(color: Colors.grey), // Divider after expansion
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RulePoint(
                  text: 'Valid Registration: Only registered students and staff are allowed to use the app and its services.',
                  color: Colors.blue,
                ),
                _RulePoint(
                  text: 'ID Verification: Users must provide valid university ID details for account activation.',
                  color: Colors.black,
                ),
                _RulePoint(
                  text: 'Accurate Information: Ensure all profile details, including contact and schedule information, are accurate and updated.',
                  color: Colors.amber,
                ),
                _RulePoint(
                  text: 'Timely Check-ins: Users must check in via the app at least 10 minutes before the scheduled bus departure.',
                  color: Colors.amberAccent,
                ),
                _RulePoint(
                  text: 'Prohibited Activities: Misuse of the app for non-academic or unauthorized purposes is strictly forbidden.',
                  color: Colors.red,
                ),
                _RulePoint(
                  text: 'Behavior on Buses: Follow university conduct rules while traveling. Misbehavior may result in suspension of app access.',
                  color: Colors.green,
                ),
                _RulePoint(
                  text: 'Bus Tracking: The tracking feature is for personal use only and must not be shared with unauthorized individuals.',
                  color: Colors.deepPurple,
                ),
                _RulePoint(
                  text: 'Report Issues: Users are required to report technical issues or schedule discrepancies promptly through the app.',
                  color: Colors.orange,
                ),
                _RulePoint(
                  text: 'Data Privacy: Users must not attempt to extract or misuse personal or location data of others.',
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// A separate widget for rules to improve readability
class _RulePoint extends StatelessWidget {
  final String text;
  final Color color;

  const _RulePoint({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: color),
      ),
    );
  }
}
