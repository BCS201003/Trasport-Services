import 'package:flutter/material.dart';
import 'package:untitled/Payment/Widgets/payment_sucessfull.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});

  @override
  PayWidgetState createState() => PayWidgetState();
}

class PayWidgetState extends State<PayWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  text: 'Please check to acknowledge our ',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF75788D),
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy & Terms Policy',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32.0, right: 32.0),
          child: Divider(color: Color(0xFFDDDDDD)),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Charges:',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14, // Line height adjusted for font size
              ),
            ),
            Text(
              'PKR 380.00',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14, // Line height adjusted for font size
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Background color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentSuccessScreen(),
                ),
              );
            },
            child: const Text(
              'Pay',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
