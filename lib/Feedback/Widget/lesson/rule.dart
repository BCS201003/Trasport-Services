import 'package:flutter/material.dart';

class Feedback1Widget extends StatefulWidget {
  const Feedback1Widget({
    super.key,
  });

  @override
  Feedback1WidgetState createState() => Feedback1WidgetState();
}

class Feedback1WidgetState extends State<Feedback1Widget> {
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
                'Quick Emergency',
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
                      'Any Emergency then contact admin\nPhone no. 03128889408',
                      style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Any problem During application use Contact Developer\n Phone no. 03128889408 ',
                      style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'If Any Harassment case or any issue please discuss Contact is here\nPhone no. 03128889408',
                      style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Driver behaviour is not good then discuss Phone no. 03128889408 ',
                      style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
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
