import 'package:flutter/material.dart';

class BillingSummaryContainer extends StatelessWidget {
  const BillingSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: const ExpansionTile(
        title: Text(
          'Billing Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: Color(0xFF343A40),
        children: [
          ListTile(
            title: Text(
              'Subtotal:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Text(
              'PKR 1800.00',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Discount:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Text(
              'PKR 0.00',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Platform Charges:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Text(
              'PKR 0',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 22,
          ),
          ListTile(
            title: Text(
              'Grand Total:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              'PKR 1800.00',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Conversion Rate:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Text(
              '1 PKR = ?',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
