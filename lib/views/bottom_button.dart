import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kTextStyle,
          ),
        ),
        color: buttonContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 75.0,
      ),
    );
  }
}
