import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.textSize,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
