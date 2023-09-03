import 'package:flutter/material.dart';

class SwitchForm extends StatelessWidget {
  final String title;
  final double width;
  final double widthScale;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchForm({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.width,
    required this.widthScale,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * widthScale,
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
        secondary: Icon(icon),
      ),
    );
  }
}
