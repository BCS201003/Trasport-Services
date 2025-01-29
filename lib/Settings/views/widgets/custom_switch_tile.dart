// lib/widgets/custom_switch_tile.dart
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

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
      activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
      activeTrackColor: activeTrackColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.5),
      secondary: Icon(
        value ? Icons.toggle_on : Icons.toggle_off,
        color: value
            ? (activeColor ?? Theme.of(context).colorScheme.primary)
            : Colors.grey,
        size: 32,
      ),
    );
  }
}
