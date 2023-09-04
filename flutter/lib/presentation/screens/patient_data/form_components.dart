import 'package:flutter/material.dart';

Widget switchTest(String title, double width, double widthScale, IconData icon,
    bool value, Function onChange) {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  return SizedBox(
    width: width * widthScale,
    child: SwitchListTile(
      thumbIcon: thumbIcon,
      title: Text(title),
      value: value,
      onChanged: (newValue) {
        onChange(newValue);
      },
      secondary: Icon(icon),
    ),
  );
}
