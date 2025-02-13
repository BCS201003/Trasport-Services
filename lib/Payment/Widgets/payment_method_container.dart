import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PaymentMethodContainer extends StatefulWidget {
  const PaymentMethodContainer({super.key});

  @override
  PaymentMethodContainerState createState() => PaymentMethodContainerState();
}

class PaymentMethodContainerState extends State<PaymentMethodContainer> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353, // Set width for the container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ExpansionTile(
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: const Color(0xFF343A40), // Expand icon color
        children: [
          RadioListTile<String>(
            activeColor: Colors.black, // Radio button color
            value: 'Credit/Debit Card',
            groupValue: _selectedMethod,
            onChanged: (value) {
              setState(() {
                _selectedMethod = value;
              });
            },
            title: const Text(
              'Credit/Debit Card',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/visa.png', width: 30, height: 30), // Visa logo
                const SizedBox(width: 5),
                Image.asset('assets/mastercard.png', width: 30, height: 30), // MasterCard logo
              ],
            ),
          ),
          RadioListTile<String>(
            activeColor: Colors.black, // Radio button color
            value: 'Jazzcash',
            groupValue: _selectedMethod,
            onChanged: (value) {
              setState(() {
                _selectedMethod = value;
              });
            },
            title: const Text(
              'Jazzcash',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Row(
    mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/jazz.png', width: 30, height: 30),
              ],
    )
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'PK',
            ),
          ),
        ],
      ),
    );
  }
}