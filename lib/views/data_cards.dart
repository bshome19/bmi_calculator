import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/views/card.dart';
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
    required this.divisons,
  }) : super(key: key);

  final int data;
  final String dataName;
  final String unitName;
  final double sliderMin;
  final double sliderMax;
  final Function(double)? onChanged;
  final int divisons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Cards(
        colour: activeCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                dataName,
                textScaleFactor: 1.4,
                style: labelStyle,
              ),
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
                valueIndicatorColor: Colors.orange,
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
                label: "$data",
                divisions: divisons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
