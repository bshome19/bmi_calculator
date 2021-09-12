import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/views/reusable_card.dart';
import 'package:flutter/material.dart';

class DataCards extends StatelessWidget {
  const DataCards({
    Key? key,
    required this.data,
    required this.dataName,
    required this.unitName,
    required this.sliderMin,
    required this.sliderMax,
    required this.onChanged,
  }) : super(key: key);

  final int data;
  final String dataName;
  final String unitName;
  final double sliderMin;
  final double sliderMax;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: activeCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Text(
              dataName,
              style: labelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                FittedBox(
                  child: Text(
                    data.toString(),
                    textScaleFactor: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  unitName,
                  style: labelStyle,
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                  const RoundSliderOverlayShape(overlayRadius: 20.0)),
              child: Slider(
                value: data.toDouble(),
                min: sliderMin,
                max: sliderMax,
                activeColor: iconColor,
                inactiveColor: inActiveCardColour,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
