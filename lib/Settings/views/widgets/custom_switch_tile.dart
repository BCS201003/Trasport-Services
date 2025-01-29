import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  // Optional: Provide custom colors to override defaults
  final Color? activeColor;
  final Color? activeTrackColor;

  const CustomSwitchTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      activeTrackColor: activeTrackColor,
      // You can also use 'secondary:' to show an icon or avatar
      secondary: Icon(
        value ? Icons.toggle_on : Icons.toggle_off,
        color: activeColor ?? Theme.of(context).colorScheme.primary,
        size: 32,
      ),
    );
  }
}
