import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/controllers/calculation.dart';
import 'package:bmi_calculator/views/calculate_button.dart';
import 'package:bmi_calculator/views/data_cards.dart';
import 'package:bmi_calculator/views/icon_details.dart';
import 'package:bmi_calculator/views/final_result_page.dart';
import 'package:bmi_calculator/views/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class DataInputPage extends StatefulWidget {
  const DataInputPage({Key? key}) : super(key: key);

  @override
  _DataInputPageState createState() => _DataInputPageState();
}

class _DataInputPageState extends State<DataInputPage> {
  Gender selectGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colour: selectGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: const IconDetails(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      colour: iconColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colour: selectGender == Gender.female
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: const IconDetails(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      colour: iconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DataCards(
            divisons: 25,
            dataName: "HEIGHT",
            data: height,
            unitName: "cm",
            sliderMin: 0,
            sliderMax: 250,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          DataCards(
            divisons: 15,
            dataName: "WEIGHT",
            data: weight,
            unitName: "kg",
            sliderMin: 0,
            sliderMax: 150,
            onChanged: (double newValue) {
              setState(() {
                weight = newValue.round();
              });
            },
          ),
          DataCards(
            divisons: 10,
            dataName: "AGE",
            data: age,
            unitName: "year",
            sliderMin: 0,
            sliderMax: 100,
            onChanged: (double newValue) {
              setState(() {
                age = newValue.round();
              });
            },
          ),
          CalculateButton(
            onTap: () {
              Calculator cal = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalResultPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    advice: cal.advice(),
                    colour: cal.getColour(),
                  ),
                ),
              );
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 8.0,
      constraints: const BoxConstraints.tightFor(
        width: 55.0,
        height: 55.0,
      ),
      shape: const CircleBorder(),
      fillColor: iconColor,
    );
  }
}
