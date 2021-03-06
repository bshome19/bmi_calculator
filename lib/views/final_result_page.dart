import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/views/calculate_button.dart';
import 'package:bmi_calculator/views/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinalResultPage extends StatelessWidget {

  FinalResultPage({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.advice,
    required this.colour,
  }) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String advice;
  Color colour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Your Result',
                    textScaleFactor: 3,
                    style: kResultTextStyle,
                  ),
                ),
              )),
          Expanded(
              flex: 5,
              child: Cards(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      textScaleFactor: 2,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: colour),
                    ),
                    Text(
                      bmiResult,
                      textScaleFactor: 8,
                      style: kBMITextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        advice,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: colour,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              child: CalculateButton(
                onTap: () => Navigator.of(context).pop(),
                text: 'CALCULATE AGAIN',
              ))
        ],
      ),
    );
  }
}
