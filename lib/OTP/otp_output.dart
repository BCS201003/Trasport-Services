import 'package:flutter/material.dart';

class OtpInputFields extends StatefulWidget {
  final Function(List<TextEditingController>) onOtpChanged;

  const OtpInputFields({super.key, required this.onOtpChanged});

  @override
  OtpInputFieldsState createState() => OtpInputFieldsState();
}

class OtpInputFieldsState extends State<OtpInputFields> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.length == 1 && index == 3) {
      _focusNodes[index].unfocus();
    }
    widget.onOtpChanged(_controllers);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 75,
            height: 65,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 38,
                fontWeight: FontWeight.w500,
                color: Color(0xFF52526C),
                height: 86.26 / 38,
                decoration: TextDecoration.none, // No underline
              ),
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF52526C)),
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: 0),
              ),
              onChanged: (value) => _onTextChanged(index, value),
            ),
          );
        }),
      ),
    );
  }
}
