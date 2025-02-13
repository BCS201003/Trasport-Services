import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TermAndConditionsWidget extends StatefulWidget {
  const TermAndConditionsWidget({super.key});

  @override
  TermAndConditionsWidgetState createState() => TermAndConditionsWidgetState();
}

class TermAndConditionsWidgetState extends State<TermAndConditionsWidget> {
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
          'Terms and Conditions',
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
              FontAwesomeIcons.houseFloodWater,
              color: Colors.redAccent,
              size: 14, // Adjusted size for better fit
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
                _TermPoint(
                  text: 'Eligibility: Users must be enrolled students, staff, or authorized personnel of the university.',
                  color: Colors.blue,
                ),
                _TermPoint(
                  text: 'Account Security: Users are responsible for maintaining the confidentiality of their login credentials.',
                  color: Colors.black,
                ),
                _TermPoint(
                  text: 'Accurate Information: Users must provide accurate details during registration and updates.',
                  color: Colors.amber,
                ),
                _TermPoint(
                  text: 'Service Usage: The app must be used only for its intended purpose, such as tracking buses and managing schedules.',
                  color: Colors.amberAccent,
                ),
                _TermPoint(
                  text: 'Prohibited Activities: Users must not interfere with the app’s functionality, distribute harmful content, or use it for illegal purposes.',
                  color: Colors.red,
                ),
                _TermPoint(
                  text: 'Data Privacy: Personal data will be collected and managed as per the app’s Privacy Policy.',
                  color: Colors.green,
                ),
                _TermPoint(
                  text: 'Liability Disclaimer: The university is not responsible for delays, inaccuracies, or missed rides due to external factors like traffic or technical issues.',
                  color: Colors.deepPurple,
                ),
                _TermPoint(
                  text: 'Service Reliability: The app is provided "as-is" and is not guaranteed to be error-free or continuously available.',
                  color: Colors.orange,
                ),
                _TermPoint(
                  text: 'Termination: The university reserves the right to suspend or terminate user accounts for policy violations.',
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

// A separate widget for terms to improve readability
class _TermPoint extends StatelessWidget {
  final String text;
  final Color color;

  const _TermPoint({required this.text, required this.color, super.key});

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
