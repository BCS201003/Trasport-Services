import 'package:flutter/material.dart';

class Feedback2Widget extends StatefulWidget {
  const Feedback2Widget({
    super.key,
  });

  @override
  Feedback2WidgetState createState() => Feedback2WidgetState();
}
class Feedback2WidgetState extends State<Feedback2Widget> {
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
          'Emergency Contact',
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
                  'Police (Rescue 15): Dial 15 for immediate police assistance.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Ambulance & Rescue (Rescue 1122): Dial 1122 in many parts of Pakistan (especially Punjab and Khyber Pakhtunkhwa) for emergency medical assistance, firefighting, and rescue',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Fire Brigade: Dial 16 for fire emergencies (in many major cities).',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Edhi Ambulance: Dial 115 for the Edhi Foundation’s ambulance services nationwide.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Chhipa Ambulance: Dial 1020 (primarily operates in Karachi but may be available in other cities as well).',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Bomb Disposal Squad: Typically accessed via 15 (police) in most regions—ask to be connected to the Bomb Disposal Unit.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Pakistan Rangers (Helpline): Dial 1101 for Ranger assistance in certain areas (e.g., Karachi).',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
                Text(
                  'Traffic Police (Islamabad): Dial 1915 for traffic-related emergencies or inquiries in the Islamabad region.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                ),
                SizedBox(height: 8),
              Text(
                'Cybercrime (FIA): Dial 9911 to report cybercrime-related issues to the Federal Investigation Agency (FIA).',
                style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
              ),
              SizedBox(height: 8),
              Text(
                'Child Protection: Dial 1098 (a nationwide helpline for child protection services).',
                style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
              ),
              SizedBox(height: 8),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
