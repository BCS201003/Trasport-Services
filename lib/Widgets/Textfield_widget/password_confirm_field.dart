import 'package:flutter/material.dart';

class PasswordConfirmField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordConfirmField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.labelText = 'Confirm Password',
    this.validator,
  });

  @override
  PasswordConfirmFieldState createState() => PasswordConfirmFieldState();
}

class PasswordConfirmFieldState extends State<PasswordConfirmField> {
  bool _obscureText = true;
  bool _showIcon = false;
  String? _errorText;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _validatePassword(String password) {
    final regex = RegExp(r'(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$');
    return regex.hasMatch(password);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showIcon = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: (text) {
        widget.onChanged(text);
        setState(() {
          _errorText = _validatePassword(text)
              ? null
              : 'Password must be at least 8 characters long, include a number, a special character, a lowercase letter, and an uppercase letter.';
        });
      },
      validator: widget.validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: widget.labelText,
        errorText: _errorText,
        suffixIcon: _showIcon
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _toggleVisibility,
        )
            : null,
      ),
    );
  }
}
