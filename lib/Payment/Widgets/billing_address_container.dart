import 'package:flutter/material.dart';

class BillingAddressContainer extends StatelessWidget {
  const BillingAddressContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ExpansionTile(
        title: const Text(
          'Billing Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: Colors.black,
        children: [
          _buildTextField('Full Name', 'Enter your full name', ' *', keyboardType: TextInputType.text),
          _buildTextField('Email Address', 'Enter your email address', ' *', keyboardType: TextInputType.emailAddress),
          _buildTextField('Address', 'Enter your address', ' *', keyboardType: TextInputType.text),
          _buildTextField('Country', 'Enter your country', ' *', keyboardType: TextInputType.text),
          _buildTextField('State', 'Enter your state', ' *', keyboardType: TextInputType.text),
          _buildTextField('City', 'Enter your city', ' *', keyboardType: TextInputType.text),
          _buildTextField('Zip Code', 'Enter your zip code', ' *', keyboardType: TextInputType.number),
          _buildTextField('Phone No', 'Enter your phone number', ' *', keyboardType: TextInputType.phone),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, String required, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 31.78 / 14,
                  color: Colors.black,
                ),
              ),
              if (required.isNotEmpty)
                Text(
                  required,
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 31.78 / 14,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 323,
            height: 46,
            child: TextField(
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}