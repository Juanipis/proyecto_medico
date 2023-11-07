import 'package:flutter/material.dart';

/*
  The `MaterialText` widget has two main properties: `name` and `style`.

  The various usages of this widget with their respective `name` and `style` are:

  - name: 'Display Large', style: textTheme.displayLarge!
  - name: 'Display Medium', style: textTheme.displayMedium!
  - name: 'Display Small', style: textTheme.displaySmall!
  - name: 'Headline Large', style: textTheme.headlineLarge!
  - name: 'Headline Medium', style: textTheme.headlineMedium!
  - name: 'Headline Small', style: textTheme.headlineSmall!
  - name: 'Title Large', style: textTheme.titleLarge!
  - name: 'Title Medium', style: textTheme.titleMedium!
  - name: 'Title Small', style: textTheme.titleSmall!
  - name: 'Label Large', style: textTheme.labelLarge!
  - name: 'Label Medium', style: textTheme.labelMedium!
  - name: 'Label Small', style: textTheme.labelSmall!
  - name: 'Body Large', style: textTheme.bodyLarge!
  - name: 'Body Medium', style: textTheme.bodyMedium!
  - name: 'Body Small', style: textTheme.bodySmall!

  Each of these usages represents a unique combination of `name` and `style` for the widget.
*/
class MaterialText extends StatelessWidget {
  const MaterialText({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}
