import 'package:flutter/material.dart';

class TermAndConditionsWidget extends StatefulWidget {
  const TermAndConditionsWidget({
    super.key,
  });

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
          color:
              !_isExpanded ? Colors.transparent : Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ExpansionTile(
            leading: _isExpanded
                ? const Icon(Icons.expand_less, color: Color(0xFF343A40))
                : const Icon(Icons.expand_more, color: Color(0xFF343A40)),
            title: Positioned(
              left: _isExpanded ? 50 : 0,
              top: _isExpanded ? 50 : 0,
              child: const Text(
                'Term and conditions',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Jost',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            trailing: Positioned(
              right: _isExpanded ? 50 : 0,
              top: _isExpanded ? 50 : 0,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '4 Components  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Jost',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.check_circle_sharp,
                    color: Colors.green,
                  ),
                ],
              ),
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
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eligibility: Users must be enrolled students, staff, or authorized personnel of the university.',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Account Security: Users are responsible for maintaining the confidentiality of their login credentials.',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Accurate Information: Users must provide accurate details during registration and updates.',
                      style: TextStyle(fontSize: 12, color: Colors.amber),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Service Usage: The app must be used only for its intended purpose, such as tracking buses and managing schedules.',
                      style: TextStyle(fontSize: 12, color: Colors.amberAccent),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Prohibited Activities: Users must not interfere with the app’s functionality, distribute harmful content, or use it for illegal purposes.',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Data Privacy: Personal data will be collected and managed as per the app’s Privacy Policy.',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Liability Disclaimer: The university is not responsible for delays, inaccuracies, or missed rides due to external factors like traffic or technical issues.',
                      style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Service Reliability: The app is provided "as-is" and is not guaranteed to be error-free or continuously available.',
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Termination: The university reserves the right to suspend or terminate user accounts for policy violations.',
                      style: TextStyle(fontSize: 12, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isExpanded)
            Positioned(
              left: 0,
              right: 0,
              top: 45,
              child: Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          if (_isExpanded)
            Positioned(
              left: 0,
              right: 0,
              top: 46,
              child: Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
        ],
      ),
    );
  }
}