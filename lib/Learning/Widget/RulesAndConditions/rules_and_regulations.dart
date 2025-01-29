import 'package:flutter/material.dart';

class RulesAndRegulationsWidget extends StatefulWidget {


  const RulesAndRegulationsWidget({
    super.key,
  });

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
          color: !_isExpanded ? Colors.transparent : Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: _isExpanded
            ? const Icon(Icons.expand_less, color: Color(0xFF343A40))
            : const Icon(Icons.expand_more, color: Color(0xFF343A40)),
        title: const Text(
          'Rules And Regulation',
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
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valid Registration: Only registered students and staff are allowed to use the app and its services.',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
                SizedBox(height: 8),
                Text(
                  'ID Verification: Users must provide valid university ID details for account activation.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  'Accurate Information: Ensure all profile details, including contact and schedule information, are accurate and updated.',
                  style: TextStyle(fontSize: 12, color: Colors.amber),
                ),
                SizedBox(height: 8),
                Text(
                  'Timely Check-ins: Users must check in via the app at least 10 minutes before the scheduled bus departure.',
                  style: TextStyle(fontSize: 12, color: Colors.amberAccent),
                ),
                SizedBox(height: 8),
                Text(
                  'Prohibited Activities: Misuse of the app for non-academic or unauthorized purposes is strictly forbidden.',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
                SizedBox(height: 8),
                Text(
                  'Behavior on Buses: Follow university conduct rules while traveling. Misbehavior may result in suspension of app access.',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
                SizedBox(height: 8),
                Text(
                  'Bus Tracking: The tracking feature is for personal use only and must not be shared with unauthorized individuals.',
                  style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                ),
                SizedBox(height: 8),
                Text(
                  'Report Issues: Users are required to report technical issues or schedule discrepancies promptly through the app.',
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
                SizedBox(height: 8),
                Text(
                  'Data Privacy: Users must not attempt to extract or misuse personal or location data of others.',
                  style: TextStyle(fontSize: 12, color: Colors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}