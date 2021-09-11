import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.icon,
    required this.label,
    required this.colour,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colour,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}
