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

Widget switchTest(String title, double width, double widthScale, IconData icon,
    bool value, Function onChange) {
  return SizedBox(
    width: width * widthScale,
    child: SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (newValue) {
        onChange(newValue);
      },
      secondary: Icon(icon),
    ),
  );
}
