import 'package:flutter/material.dart';

class SwitchForm extends StatefulWidget {
  final String title;
  final double width;
  final double widthScale;
  final IconData icon;

  const SwitchForm(
      {super.key,
      required this.title,
      required this.width,
      this.widthScale = 0.9,
      required this.icon});

  @override
  State<SwitchForm> createState() => _SwitchFormState();
}

class _SwitchFormState extends State<SwitchForm> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * widget.widthScale,
      child: SwitchListTile(
        title: Text(widget.title),
        value: switchState,
        onChanged: (bool value) {
          setState(() {
            switchState = value;
          });
        },
        secondary: Icon(widget.icon),
      ),
    );
  }
}
