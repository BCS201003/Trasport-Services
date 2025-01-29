import 'package:flutter/foundation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(bool isValid) onPhoneFieldChange;
  const CustomPhoneField({super.key, required this.controller, required this.onPhoneFieldChange});

  @override
  CustomPhoneFieldState createState() => CustomPhoneFieldState();
}

class CustomPhoneFieldState extends State<CustomPhoneField> {
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      focusNode: _focusNode,
      controller: widget.controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: 'Phone No',
        errorText: _errorText,
      ),
      initialCountryCode: 'PK',
      onChanged: (phone) {
        if (kDebugMode) {
          print('${phone.countryCode}${phone.number}');
        }
        setState(() {
          bool isValid = phone.number.contains('-') == false;
          _errorText = isValid ? null : 'Invalid phone number format';
          widget.onPhoneFieldChange(isValid);
        });
      },
    );
  }
}
